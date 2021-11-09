import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Rectangle {
    width: frame.implicitWidth + 10
    height: frame.implicitHeight + 10
    property int count:  view.model[view.currentIndex];

    function rollDice() {
        view.currentIndex = Math.floor(Math.random()*view.model.length);
    }

    Component {
        id: delegateComponent

        Label {
            text: modelData;
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 50 - Math.sqrt(Math.abs(Tumbler.displacement)) * 10
        }
    }

    Frame {
        id: frame
        padding: 0
        anchors.centerIn: parent

        Tumbler {
            id: view
            model: {
                var items = [];
                for (var i = 0; i < 1 + 6 * 10; i++) {
                    items.push(i % 6 + 1);
                }
                return items;
            }
            delegate: delegateComponent
        }
    }
}
