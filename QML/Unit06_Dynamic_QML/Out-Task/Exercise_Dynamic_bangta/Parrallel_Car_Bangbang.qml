import QtQuick 2.8
import QtQuick.Window 2.2

Rectangle {
    visible: true
    width: 640
    height: 480

Image{
    id: im1
    source: "assets/ad.jpg"
    width: 700; height: 700

    Image {
        id: rect
        source: "assets/subaru.png"
        x: 5; y: 100
        width: 100; height: 100
       // BorderImage.color: "green"

        ParallelAnimation {
            running: true
            NumberAnimation { target: rect; property: "x"; to: 500; duration: 10000 }
            NumberAnimation { target: rect; property: "y"; to: 400; duration: 10000 }
        }
}
    Image {
        id: rect1
        source: "assets/mitsubishi_lancer.png"
        x: 10; y: 50
        width: 100; height: 100
        //BorderImage.color: "red"


        ParallelAnimation {
            running: true
            NumberAnimation { target: rect1; property: "x"; to: 500; duration: 10000 }
            NumberAnimation { target: rect1; property: "y"; to: 200; duration: 10000 }
        }

}
}
}
