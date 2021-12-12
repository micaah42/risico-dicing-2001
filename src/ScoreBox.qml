import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: ctrl
    property var scores: []
    property var totalLosses: {
        "attackers": 0,
        "defenders": 0
    }

    function update(attackerCounts, defenderCounts) {
        console.log(attackerCounts, defenderCounts)
        var attLost = 0;
        var defLost = 0;
        for (var i = 0; i < 2; i++) {
            if (defenderCounts[i] < attackerCounts[i])
                defLost++;
            else
                attLost++;
        }

        var score = {
            'attackers': attLost,
            'defenders': defLost
        };

        totalLosses['attackers'] += score['attackers'];
        attackerLosses.text = totalLosses['attackers'];

        totalLosses['defenders'] += score['defenders'];
        defenderLosses.text = totalLosses['defenders'];

        scores.push(score);
        scoreList.model = scores.length

        console.log(JSON.stringify(score));
        console.log(JSON.stringify(totalLosses));
    }


    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            color: "#8f8f8f"
            Layout.preferredHeight: 25
            Layout.fillWidth: true

            Row {
                anchors.fill: parent
                CenteredText {
                    font.pixelSize: 20
                    font.bold: true
                    width: parent.width / 2
                    text: qsTr("Attackers")
                }
                CenteredText {
                    font.pixelSize: 20
                    font.bold: true
                    width: parent.width / 2
                    text: qsTr("Defenders")
                }
            }
        }

        Repeater {
            id: scoreList
            model: 0
            delegate: Rectangle {
                color: index % 2 ? "#cdcdcd" : "#dadada"
                Layout.preferredHeight: 12
                Layout.fillWidth: true

                Row {
                    anchors.fill: parent
                    CenteredText {
                        width: parent.width / 2
                        text: scores[index]['attackers']
                    }
                    CenteredText {
                        width: parent.width / 2
                        text: scores[index]['defenders']
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }

        Rectangle {
            color: "#8f8f8f"
            Layout.preferredHeight: 25
            Layout.fillWidth: true
            Row {
                anchors.fill: parent
                CenteredText {
                    id: attackerLosses
                    font.pixelSize: 20
                    font.bold: true
                    width: parent.width / 2
                    text: totalLosses['attackers']
                }
                CenteredText {
                    id: defenderLosses
                    font.pixelSize: 20
                    font.bold: true
                    width: parent.width / 2
                }
            }
        }
    }
}
