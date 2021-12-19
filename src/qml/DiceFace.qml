import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: ctrl
    property var eyes: [1,1,1, 1,1,1, 1,1,1]

    Grid {
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
                    width: 0.8 * parent.width
                    height: 0.8 * parent.height
                    anchors.centerIn: parent

                    border.color: "#000000"
                    color: "#000000"
                    radius: width < height ? width / 2 : height / 2
                }
            }
        }
    }

}
