import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    width: 580
    height: 400

    Image {
        id: background
        source: "Space.png"
        anchors.fill: parent
    }
    Image {
        id: rocket1
        source: "rocket-1.png"
        x:30
        y:500
        width: 100
        height: 150
        ParallelAnimation {
            running: true
            NumberAnimation {target: rocket1; properties: "y"; to: 10; duration: 10000}
        }
    }
    Image {
        id: rocket2
        source: "rocket-2.png"
        x:150
        y:500
        width: 100
        height: 150
        ParallelAnimation {
            running: true
            NumberAnimation {target: rocket2; properties: "y"; to: 10; duration: 10000}
        }
    }
    Image {
        id: rocket3
        source: "rocket-3.png"
        x:300
        y:500
        width: 100
        height: 150
        ParallelAnimation {
            running: true
            NumberAnimation {target: rocket3; properties: "y" ;to: 10; duration: 10000}
        }
    }
    Text {
        id: txt
        text: "Into the Universe"
        color: "orange"
        font.pointSize: 15
        x : 10
        y : 10
        ParallelAnimation {
            running: true
            NumberAnimation {target: txt; properties: "x" ;to: 350; duration: 10000}
        }
    }
}
