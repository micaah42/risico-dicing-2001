import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    width: 520
    height: 232
    visible: true
    title: qsTr("Riscy Dicer")

    RowLayout {
        // Attacker Dices
        ColumnLayout {
            Label {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Attacker")
            }
            RowLayout {
                Repeater {
                    id: attackerDices
                    delegate: DiceView {}
                    model: 3
                }
            }
        }

        // Spacer
        Rectangle {
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: 5
            color: "#000000"
        }

        // Defender Dices
        ColumnLayout {
            Label {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Defender")
            }
            RowLayout {
                Repeater {
                    id: defenderDices
                    delegate: DiceView {}
                    model: 2
                }
            }
        }

        // Result
        ColumnLayout {
            Button {
                text: qsTr("Roll the Dices!")
                onClicked: {
                    var i;
                    // roll attacker dices
                    for (i = 0; i < attackerDices.count; i++) {
                        attackerDices.itemAt(i).rollDice();
                    }
                    // roll defender dices
                    for (i = 0; i < defenderDices.count; i ++) {
                        defenderDices.itemAt(i).rollDice();
                    }

                    // evaluate
                    var attackerCounts = [];
                    for (i = 0; i < attackerDices.count; i++) {
                        attackerCounts.push(attackerDices.itemAt(i).count);
                    }
                    attackerCounts.sort(function(a,b) { return b - a; });

                    var defenderCounts = [];
                    for (i = 0; i < defenderDices.count; i++) {
                        defenderCounts.push(defenderDices.itemAt(i).count);
                    }
                    defenderCounts.sort(function(a,b) { return b - a; });

                    console.log(JSON.stringify(attackerCounts));
                    console.log(JSON.stringify(defenderCounts));

                    var attLost = 0;
                    var defLost = 0;
                    for (i = 0; i < defenderDices.count; i++) {
                        if (defenderCounts[i] < attackerCounts[i])
                            defLost++;
                        else
                            attLost++;
                    }
                    attackersLost.text = attLost;
                    defendersLost.text = defLost;
                }
            }

            RowLayout {
                Label { text: qsTr("Attackers Lost:") }
                Label { id: attackersLost }
            }

            RowLayout {
                Label { text: qsTr("Defenders Lost:") }
                Label { id: defendersLost }
            }
        }
    }
}
