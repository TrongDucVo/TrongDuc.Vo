import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    width: 580
    height: 400

    ColorPoint {
        rColor: "red"
    }

    ColorPoint {
        x: 50
        rColor: "blue"
    }
    ColorPoint {
        x: 100
        rColor: "yellow"
    }
    ColorPoint {
        x: 150
        rColor: "purple"
    }

    Rectangle {
        width: 100
        height: 100
        anchors.bottom: parent.bottom
        Text {
            id: text03_1
            anchors.top: parent.top
            text: qsTr("Press and Hold than move the point color")
        }
        Text {
            anchors.top: text03_1.bottom
            text: qsTr("Click to change color")
            }
        }
    }
