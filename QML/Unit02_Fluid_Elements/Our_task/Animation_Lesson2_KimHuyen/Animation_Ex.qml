
import QtQuick 2.0

Item {
    id: root
    width: 600; height: 570

    Image {
        anchors.centerIn: parent
        source: "assets/bliss.jpg"
    }


    //M4>>
    MouseArea {
        anchors.fill: parent
        onClicked: {
            rocket1.y = rocket2.y = rocket3.y = 205
        }
    }
    //<<M4

    //M1>>
    ClickableImageV3 {
        id: rocket1
        x: 40; y: root.height-height
        source: "assets/bal.png"
        text: "animation on property"
        NumberAnimation on y {
            to: 40; duration: 4000
        }
    }
    //<<M1

    //M2>>
    ClickableImageV3 {
        id: rocket2
        x: 250; y: root.height-height
        source: "assets/bal5.png"
        text: "behavior on property"
        Behavior on y {
            NumberAnimation { duration: 4000 }
        }

        onClicked: y = 40
        // random y on each click
 //      onClicked: y = 40+Math.random()*(205-40)
    }
    //<<M2

    //M3>>
    ClickableImageV3 {
        id: rocket3
        x: 450 ; y: root.height-height
        source: "assets/bal.png"
        onClicked: anim.start()
//       onClicked: anim.restart()

        text: "standalone animation"

        NumberAnimation {
            id: anim
            target: rocket3
            properties: "y"
            to: 40
            duration: 4000
        }
    }
    //<<M3

}
