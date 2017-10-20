import QtQuick 2.8
Rectangle{
    id: rec
    width: 520
    height: 700
    Image {
        id: image
        width: 520
        height: 700
        source: "images/background2.jpg"

        Image {
            id: image1
            x: 80
            y: 500
            width: 100
            height: 100
            source: "images/rocket1.png"
            NumberAnimation on y {
                to: 0
                duration: 2000
                loops: Animation.Infinite
            }
            RotationAnimation on rotation {
                to: 360
                duration: 1800
                loops: Animation.Infinite
            }
        }
        Image {
            id: image2
            x: 360
            y: 500
            width: 100
            height: 100
            source: "images/rocket1.png"
            NumberAnimation on y {
                to: 0
                duration: 2500
                loops: Animation.Infinite
            }
        }
    }

}
