import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id: win1
    visible: true
    height: 1000
    width: 1300
    Image {
        id: image
        source: "assets/background1.jpg"
        width: 1300
        height: 1000
    }

    ClickableImageV3{
        id: rocket
        x: 0
        y: 800
        source: "assets/rocket.png"
        Text{
            text: "Rocket"
            font.pointSize: 20
            color: "white"
            font.bold: true
        }
        onClicked: anim1.restart()
    }
    SequentialAnimation{
        id: anim1
        RotationAnimation {
            target: anim1
            properties: "rotation"
            to: 360
            duration: 1000
        }
        NumberAnimation{
            target: rocket
            properties: "y"
            to: 20
            duration:  1000
        }
        NumberAnimation{
            target: rocket
            properties: "x"
            to: 1100
            duration:  1000
        }
    }

    ClickableImageV3{
        id: ufo
        x: 1100
        y: 800
        source: "assets/ufo.png"
        Text{
            text: "UFO"
            font.pointSize: 20
            color: "yellow"
            font.bold: true
        }
        onClicked: anim2.restart()
    }
    ParallelAnimation{
        id: anim2
        NumberAnimation{
            target: ufo
            properties: "x"
            to: 10
            duration: 3000
        }
        NumberAnimation{
            target: ufo
            properties: "y"
            to: 10
            duration: 3000
        }
    }

}
