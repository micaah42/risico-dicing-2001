import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Shapes 1.12

Window {
    id: window
    width: 840
    height: 400
    visible: true
    title: qsTr("Risik0 Dicing 2001")
    color: "#000000"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        // Dices
        Rectangle {
            Layout.preferredWidth: 420
            Layout.fillHeight: true
            color: "#333333"
            radius: 5

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10

                Text {
                    text: qsTr("ATTACKER")
                    Layout.alignment: Qt.AlignLeft
                    font.bold: true
                    font.pixelSize: 50
                    color: Palette.attackerColor

                }

                Item {
                    Layout.fillHeight: true
                }

                DiceGroup {
                    id: attackerDices
                    Layout.alignment: Qt.AlignHCenter
                    numDices: 3
                    onRollFinished: {
                        if (!defenderDices.rolling)
                            scoreBox.update(attackerDices.counts(), defenderDices.counts())
                    }
                }

                // seperator line
                ComicSeperator {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 15
                }

                DiceGroup {
                    id: defenderDices
                    Layout.alignment: Qt.AlignHCenter
                    numDices: 2
                    onRollFinished: {
                        if (!defenderDices.rolling)
                            scoreBox.update(attackerDices.counts(), defenderDices.counts())
                    }
                }

                Item {
                    Layout.fillHeight: true
                }

                Text {
                    text: qsTr("DEFENDER")
                    Layout.alignment: Qt.AlignRight
                    font.bold: true
                    font.pixelSize: 50
                    color: Palette.orangeColor

                }
            }
        }




        // Result & Buttons
        Rectangle {
            Layout.fillWidth: true
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
                        enabled: !attackerDices.rolling && !defenderDices.rolling
                        width: 2 * parent.width / 3
                        text: qsTr("Roll")
                        onClicked: {
                            attackerDices.roll();
                            defenderDices.roll();
                        }
                    }
                    Button {
                        enabled: !attackerDices.rolling && !defenderDices.rolling
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
