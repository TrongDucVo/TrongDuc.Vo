import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1500
    height: 1500
    title: qsTr("unit2_parallelanimation")
Image{
    id: background
    source: "Image/Duong-dua-Sepang.jpg"
    width: 1500; height: 1500

    Image {
        id: ferrari
        source: "Image/ferrari.jpg"
        x: 30; y: 100
        width: 100; height: 150

        ParallelAnimation {
            running: true
            NumberAnimation { target: ferrari; property: "x"; to: 700; duration: 10000 }
            NumberAnimation { target: ferrari; property: "y"; to: 700; duration: 10000 }
        }
}
    Image {
        id: lambor
        source: "Image/lambor.png"
        x: 100; y: 50
        width: 100; height: 150

        ParallelAnimation {
            running: true
            NumberAnimation { target: lambor; property: "x"; to: 1000; duration: 8000 }
            NumberAnimation { target: lambor; property: "y"; to: 900; duration: 8000 }
        }

}
    Image {
        id: koenigsegg
        source: "Image/koenigsegg.png"
        x: 80; y: 150
        width: 100; height: 150

        ParallelAnimation {
            running: true
            NumberAnimation { target: koenigsegg; property: "x"; to: 800; duration: 8000 }
            NumberAnimation { target: koenigsegg; property: "y"; to: 800; duration: 8000 }
        }

}
}
}
