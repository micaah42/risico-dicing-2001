import QtQuick 2.14
import QtQuick.Shapes 1.15

Shape {
    id: ctrl
    property int fractions: 50

    ShapePath {
        fillColor: "#c95400"
        strokeWidth: 7
        strokeColor: "#000000"
        capStyle: ShapePath.RoundCap

        PathPolyline {
            path: {

                // generate xScale:
                var xScale = [0.];
                for (var i = 1; i < fractions - 1; i++) {
                    xScale.push(Math.random());
                }
                xScale.push(1.);
                xScale.sort(function(a, b) { return a - b});

                // generate yScale
                var yScale = [0.5]
                for (i = 0; i < fractions - 1; i++) {
                    yScale.push(0.4 + 0.2 * Math.random());
                }
                yScale.push(0.5);

                // generate yWidths
                var yWidths = [0.]
                for (i = 0; i < fractions - 1; i++) {
                    yWidths.push(0.8 + 0.2 * Math.random());
                }
                yWidths.push(0.);

                // get the points of the outline
                var points = [];

                // upper row
                for (i = 0; i < fractions - 1; i++) {
                    var point = Qt.point(ctrl.width * xScale[i],
                                         ctrl.height * (yScale[i] + yWidths[i] / 2));
                    points.push(point);
                }
                // lower row
                for (i = fractions - 1; i >= 0; i--) {
                    point = Qt.point(ctrl.width * xScale[i],
                                     ctrl.height * (yScale[i] - yWidths[i] / 2));
                    points.push(point);
                }
                return points;
            }
        }
    }

}
