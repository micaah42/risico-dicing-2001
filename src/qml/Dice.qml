import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12

Item {
    id: ctrl
    property int size: 65
    height: size; width: size;

    property alias count: faceLayout.currentIndex
    property alias redrawInterval: redrawTimer.interval

    function startRoll() {
        if (redrawTimer.running) {
            console.log('timer already running!')
            return;
        }
        redrawTimer.start();
    }

    function stopRoll() {
        redrawTimer.stop();
    }

    Timer {
        id: redrawTimer
        interval: 75
        repeat: true

        onTriggered: {
            var curr = faceLayout.currentIndex ;
            var next = (curr + 1) % 6
            faceLayout.currentIndex = next;
        }
    }

    Rectangle {
        anchors.fill: parent
        radius: 4.5
        border.color: "#dddddd"

        StackLayout {
            id: faceLayout
            anchors.fill: parent
            currentIndex: { return 0; }

            // This repeater generates the 6 faces
            Repeater {
                id: faces
                Layout.fillWidth: true
                Layout.fillHeight: true
                delegate: DiceFace {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    eyes: faces.model[index]
                }

                // face configurations
                model: [
                    [0,0,0,
                     0,1,0,
                     0,0,0],

                    [1,0,0,
                     0,0,0,
                     0,0,1],

                    [1,0,0,
                     0,1,0,
                     0,0,1],

                    [1,0,1,
                     0,0,0,
                     1,0,1],

                    [1,0,1,
                     0,1,0,
                     1,0,1],

                    [1,0,1,
                     1,0,1,
                     1,0,1],
                ]
            }
        }
    }
}
