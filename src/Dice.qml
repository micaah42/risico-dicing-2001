import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12

Item {
    id: ctrl
    property int size: 65
    property alias count: faceLayout.currentIndex
    property alias redrawInterval: redrawTimer.interval

    property int minRedraws: 6
    property int maxRedraws: 12
    property var nextDice: null

    signal rollFinished();


    height: size; width: size;

    function roll() {
        if (redrawTimer.running) {
            console.log('timer already running!')
            return;
        }

        var redraws = minRedraws + Math.floor((maxRedraws - minRedraws) * Math.random())
        redrawTimer.redrawTarget = redraws;
        redrawTimer.start();
    }

    Timer {
        id: redrawTimer
        interval: 75
        property int redraws: 0
        property int redrawTarget: 0

        repeat: true

        onTriggered: {
            if (redraws == redrawTarget) {
                redrawTimer.stop()
                redraws = 0;

                rollFinished();
                if (nextDice) nextDice.roll();
                return;
            }

            var curr = faceLayout.currentIndex ;
            var next = (curr + 1) % 6
            faceLayout.currentIndex = next;
            redraws++;
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
