import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import risiko.style 1.0

Item {
    id: ctrl

    property int attackersLost: 0
    property int defendersLost: 0


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

        attackersLost += attLost;
        defendersLost += defLost;

        scores.append({
                          'attackers': attLost,
                          'defenders': defLost
                      });

        scoresView.positionViewAtEnd();
    }

    function resetScore() {
        attackersLost = 0;
        defendersLost = 0;
        scores.clear();
    }

    ListModel {
        id: scores
    }

    ListView {
        id: scoresView
        anchors.fill: parent
        model: scores

        headerPositioning: ListView.OverlayHeader
        header: Rectangle {
            width: parent.width
            height: 25
            color: "transparent"

            Row {
                anchors.fill: parent
                CenteredText {
                    font.pixelSize: 20
                    font.bold: true
                    width: parent.width / 2
                    text: qsTr("ATTACKER")
                    color: Theme.attackerColor
                }
                CenteredText {
                    font.pixelSize: 20
                    font.bold: true
                    width: parent.width / 2
                    text: qsTr("DEFENDER")
                    color: Theme.defenderColor
                }
            }
        }

        delegate: Rectangle {
            color: index % 2 ? "#222222" : "#2f2f2f"
            width: parent.width
            radius: 1.5
            height: 20

            Row {
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter

                CenteredText {
                    width: parent.width / 2
                    text: attackers
                    color: "#cdcdcd"
                }
                CenteredText {
                    width: parent.width / 2
                    text: defenders
                    color: "#cdcdcd"
                }
            }
        }

        footerPositioning: ListView.OverlayFooter
        footer: Rectangle {
            color: "#424242"
            width: parent.width
            height: 25
            radius: 1.5

            Row {
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter

                CenteredText {
                    font.pixelSize: 20
                    font.bold: true
                    color: Theme.orangeAccent
                    width: parent.width / 2
                    text: attackersLost
                }
                CenteredText {
                    font.pixelSize: 20
                    font.bold: true
                    color: Theme.orangeAccent
                    width: parent.width / 2
                    text: defendersLost
                }
            }
        }
    }
}
