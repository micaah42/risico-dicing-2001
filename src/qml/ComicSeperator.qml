import QtQuick 2.14
import QtGraphicalEffects 1.15
import risiko.style 1.0

Item {
    id: ctrl
    property int fractions: 50

    Rectangle {
        id: bar
        anchors.fill: parent
        border.color: "#000000"
        border.width: 2
        radius: height / 4
        color: Theme.orangeAccent
    }

    DropShadow {
        anchors.fill: bar
        source: bar
        color: "#000000"
        radius: 4
        samples: 15

    }
}
