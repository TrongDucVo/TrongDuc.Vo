import QtQuick 2.8
import QtQuick.Window 2.0

Item {
    id: root
    width: 1200
    height: 700

    Image {
        anchors.centerIn: parent
        source: "images.pnd"


    }



    MouseArea {
        anchors.fill: parent
        onClicked:{
            rocket1.y=rocket2.y=rocket3.y=400
        }
    }
    Clickmouse{
        id: rocket1
        x: 40; y: root.height-height
        source: "images.png"
        text: "animation on property"
        NumberAnimation on y {
            to: 40; duration: 8000
        }
    }


    Clickmouse{
        id: rocket2
        x: 500; y: root.height-height
        source: "images.png"
        text: "behavior on property"

        Behavior on y {
            NumberAnimation {duration: 4000}
        }
        onClicked: y=40
    }
    Clickmouse{
        id: rocket3
        x:900; y: root.height-height
        source: "images.png"
        onClicked: anim.restart()
        //        onClicked: anim.start()

        text: "Standalone animation"



    }





    ParallelAnimation {
        id: anim
        NumberAnimation {
            target: rocket3
            properties: "y"
            to: 40
            duration: 4000

        }
        NumberAnimation {
            target: rocket3
            properties: "x"
            to: 750
            duration: 4000

        }

        RotationAnimation  {
            target:rocket3
            from : 0
            to: 360
            duration: 4000

        }
    }



}

