import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15

Item {
    id: ctrl
    property bool isAttacker;
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
        interval: 50
        repeat: true

        onTriggered: {
            var curr = faceLayout.currentIndex ;
            var next = (curr + 1) % 6
            faceLayout.currentIndex = next;
        }
    }

    Rectangle {
        id: dice
        anchors.fill: parent
        radius: 4.5
        border.color: "#dddddd"

        SwipeView {
            id: faceLayout
            anchors.fill: parent
            orientation: Qt.Vertical
            interactive: false
            currentIndex: { return 0; }
            clip: true

            // This repeater generates the 6 faces
            Repeater {
                id: faces
                Layout.fillWidth: true
                Layout.fillHeight: true
                delegate: DiceFace {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    eyes: faces.model[index]
                    isAttacker: ctrl.isAttacker
                    isRolling: redrawTimer.running
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

        DirectionalBlur {
            visible: redrawTimer.running
            anchors.fill: faceLayout
            source: faceLayout
            angle: 0
            length: 43
            samples: 59
            cached: true
        }
    }

    DropShadow {
        anchors.fill: dice
        source: dice
        color: "#000000"
        samples: 19
        radius: 11
    }
}
