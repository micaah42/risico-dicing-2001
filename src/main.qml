import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: window
    width: 840
    height: 400
    visible: true
    title: qsTr("Riscy Dicer")

    RowLayout {
        x:15; y:x;
        anchors.fill: parent

        // Dices
        Rectangle {
            Layout.preferredWidth: parent.width / 3
            Layout.fillHeight: true
            color: "#ededed"

            ColumnLayout {
                anchors.fill: parent

                DiceGroup {
                    id: attackerDices
                    Layout.preferredHeight: 90
                    name: qsTr("Attacker")
                    numDices: 3

                    onRollFinished: {
                        if (!defenderDices.rolling)
                            scoreBox.update(attackerDices.counts(), defenderDices.counts())
                    }
                }

                DiceGroup {
                    id: defenderDices
                    Layout.preferredHeight: 90
                    name: qsTr("Defender")
                    numDices: 2

                    onRollFinished: {
                        if (!defenderDices.rolling)
                            scoreBox.update(attackerDices.counts(), defenderDices.counts())
                    }
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }




        // Result & Buttons
        Rectangle {
            Layout.preferredWidth: 2 * parent.width / 3
            Layout.fillHeight: true
            color: "#cdcdcd"

            ColumnLayout {
                anchors.fill: parent

                ScoreBox {
                    id: scoreBox
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Row {
                    Layout.fillWidth: true
                    Button {
                        width: 2 * parent.width / 3
                        text: qsTr("Roll")
                        onClicked: {
                            attackerDices.roll();
                            defenderDices.roll();
                        }
                    }
                    Button {
                        width: parent.width / 3
                        text: "Finish Turn"
                        highlighted: true
                        onClicked: {
                            scoreBox.resetScore();
                        }
                    }
                }
            }
        }
    }
}
