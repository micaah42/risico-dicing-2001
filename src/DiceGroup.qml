import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: ctrl
    property alias name: nameText.text
    property alias numDices: layout.model
    property bool rolling: false


    function roll() {
        console.log('rolling ...');
        layout.itemAt(0).roll();
        rolling = true;
    }

    signal rollFinished()
    function counts() {
        var counts = [];
        for (var i = 0; i < layout.model; i++)
            counts.push(1 + layout.itemAt(i).count)
        return counts.sort(function(a, b) { return b - a; });
    }

    Column {
        Text { id: nameText }
        Row {
            spacing: 10

            Repeater {
                id: layout
                delegate: Dice {
                    onRollFinished: {
                        if (index === layout.model - 1) {
                            console.log ('finished!');
                            ctrl.rollFinished();
                            rolling = false;
                        }
                        else {
                            layout.itemAt(index + 1).roll();
                        }
                    }
                }
                model: 3
            }
        }
    }
}
