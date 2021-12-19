import QtQuick 2.15
import QtQuick.Controls 2.15
import risiko.style 1.0

Button {
    id: ctrl

    palette.buttonText: enabled ? Theme.orangeAccent : "#a0a0a0"
    palette.brightText: enabled ? Theme.turquoAccent : "#a0a0a0"

    font.pixelSize: 18
    font.bold: true
    Component.onCompleted: {
        background.radius = 5
    }

//    contentItem: Text {
//        text: ctrl.text
//        anchors.centerIn: parent
//        font.bold: true
//    }

//    background: Rectangle {
//        anchors.fill: parent
//        radius: 4
//        border.color: "#000000"
//        border.width: 2

//        color: ctrl.down ? backgroundColor : backgroundDownColor
//    }
}
