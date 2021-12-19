import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: ctrl
    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height
    property alias numDices: layout.model
    property bool rolling: false
    property bool isAttacker: true

    property int avgRollTime: 750
    property int rollTimeVariance: 250


    function roll() {
        console.log('rolling ...');
        for (var i = 0; i < numDices; i++) {
            layout.itemAt(i).startRoll();
        }

        stopTimer.start();
        rolling = true;
    }

    Timer {
        id: stopTimer
        property int toStop: 0
        repeat: false

        onTriggered: {
            if(toStop < numDices) {
                layout.itemAt(toStop).stopRoll()
                toStop++

                stopTimer.interval = (avgRollTime +  (Math.random() - 0.5) * rollTimeVariance)
                stopTimer.start();
            }
            else {
                toStop = 0;
                ctrl.rollFinished();
                ctrl.rolling = false;
                console.log('finished!');
            }
        }
    }

    signal rollFinished()

    function counts() {
        var counts = [];
        for (var i = 0; i < layout.model; i++)
            counts.push(1 + layout.itemAt(i).count)
        return counts.sort(function(a, b) { return b - a; });
    }


    Row {
        spacing: 10
        Repeater {
            id: layout
            delegate: Dice {
                redrawInterval: 50
            }
            model: 3
        }
    }
}
