import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: ctrl
    property var scores: []

    function update(attackerCounts, defenderCounts) {
        var attLost = 0;
        var defLost = 0;
        for (var i = 0; i < attackerCounts.size; i++) {
            if (defenderCounts[i] < attackerCounts[i])
                defLost++;
            else
                attLost++;
        }
        return {
            'attackers': attLost,
            'defenders': defLost
        }
    }


    property var currentLosses: {
        var attLost = 0;
        var defLost = 0;
        for (var i = 0; i < defenderDices.count; i++) {
            if (defenderCounts[i] < attackerCounts[i])
                defLost++;
            else
                attLost++;
        }
        return {
            'attackers': attLost,
            'defenders': defLost
        }
    }

    Column {
        anchors.fill: parent
        RowLayout {
            Label {
                Layout.fillWidth: true
                text: qsTr("Attackers Lost:")
            }
            Label {
                text: currentLosses['attackers']
            }
        }

        RowLayout {
            Label {
                Layout.fillWidth: true
                text: qsTr("Defenders Lost:")
            }
            Label {
                text: currentLosses['defenders']
            }
        }
    }
}
