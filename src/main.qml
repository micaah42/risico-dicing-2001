import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: window
    width: 520
    height: 232
    visible: true
    title: qsTr("Riscy Dicer")
    color: "#ededed"

    RowLayout {
        x:5; y:x;
        // Attacker Dices
        ColumnLayout {
            Layout.preferredWidth: 300

            DiceGroup {
                id: attackerDices
                name: qsTr("Attacker")
                Layout.preferredHeight: 90
                numDices: 3
            }

            DiceGroup {
                id: defenderDices
                name: qsTr("Defender")
                Layout.preferredHeight: 90
                numDices: 2
            }
        }

        // Result
        ColumnLayout {
            ScoreBox {
                id: scoreBox
                Layout.fillHeight: true
            }

            Button {
                text: qsTr("Roll the Dices!")
                onClicked: {
                    attackerDices.roll();
                    defenderDices.roll();
                }
            }
        }
    }
}
