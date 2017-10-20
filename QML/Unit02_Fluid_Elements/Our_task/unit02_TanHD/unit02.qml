import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Image {
        id: background
        source: "images/Space.png"
        anchors.fill: parent
    }
    Image {
        id: rocket1
        source: "images/rocket-1.png"
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
        source: "images/rocket-2.png"
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
        source: "images/rocket-3.png"
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
        font.pointSize: 20
        x : 10
        y : 10
        ParallelAnimation {
            running: true
            NumberAnimation {target: txt; properties: "x" ;to: 400; duration: 10000}
        }
    }
}
