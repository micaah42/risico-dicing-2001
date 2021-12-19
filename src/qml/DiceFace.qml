import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15
import risiko.style 1.0

Item {
    id: ctrl
    property var eyes: [1,1,1, 1,1,1, 1,1,1]
    property bool isAttacker;
    property bool isRolling;

    Grid {
        id: face
        width: 0.8 * parent.width
        height: 0.8 * parent.height
        anchors.centerIn: parent
        columns: 3
        rows: 3

        Repeater {
            model: 9
            delegate: Item {
                width: parent.width / 3
                height: parent.height / 3

                Rectangle {
                    visible: ctrl.eyes[index] !== 0
                    width: 0.9 * parent.width
                    height: 0.9 * parent.height
                    anchors.centerIn: parent

                    color: isAttacker ? Theme.attackerColor : Theme.defenderColor
                    radius: width < height ? width / 2 : height / 2
                }
            }
        }
    }


}
