import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Shapes 1.12
import risiko.style 1.0

ApplicationWindow {
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
            color: "#222222"
            radius: 5

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 15

                Text {
                    text: qsTr("ATTACKER")
                    Layout.alignment: Qt.AlignLeft
                    font.weight: Font.ExtraBold
                    font.pixelSize: 32
                    color: Theme.attackerColor
                }

                Item {
                    Layout.fillHeight: true
                }

                DiceGroup {
                    id: attackerDices
                    Layout.alignment: Qt.AlignHCenter
                    isAttacker: true
                    onRollFinished: {
                        if (!defenderDices.rolling)
                            scoreBox.update(attackerDices.counts(), defenderDices.counts())
                    }
                }

                // seperator line
                ComicSeperator {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 11
                }

                DiceGroup {
                    id: defenderDices
                    Layout.alignment: Qt.AlignHCenter
                    isAttacker: false
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
                    font.weight: Font.ExtraBold
                    font.pixelSize: 32
                    color: Theme.defenderColor
                }
            }
        }




        // Result & Buttons
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#222222"
            radius: 5
            clip: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10

                ScoreBox {
                    id: scoreBox
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                RowLayout {
                    Layout.fillWidth: true
                    // Layout.preferredHeight: 100
                    spacing: 5

                    ComicButton {
                        enabled: !attackerDices.rolling && !defenderDices.rolling
                        Layout.preferredWidth: 2 * parent.width / 3
                        //Layout.fillHeight: true

                        text: qsTr("Roll")
                        onClicked: {
                            attackerDices.roll();
                            defenderDices.roll();
                        }
                    }

                    ComicButton {
                        enabled: !attackerDices.rolling && !defenderDices.rolling
                        Layout.fillWidth: true
                        //Layout.fillHeight: true

                        text: qsTr("End Turn")
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
