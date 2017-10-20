import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id: win1
    visible: true
    height: 1000
    width: 1200
    title: "Balloon"
    Image {
        width: 1200
        height: 1000
        source: "assets/background.jpg"

        ClickableImageV3{
            id: rocket1
            x: 40; y: root.height-height
            source: "assets/balloon.png"
            text: "animation on property"
            Behavior on y{
                NumberAnimation {
                    duration: 3000
                }
            }
            onClicked: y = 750
        }

        ClickableImageV3{
            id: rocket2
            x: 500; y: root.height-height
            source: "assets/balloon.png"
            text: "behavior on property"
            Behavior on y {
                NumberAnimation { duration: 1000 }
            }

            onClicked: y = 750
        }
        ClickableImageV3 {
            id: rocket3
            x: 1000; y: root.height-height
            source: "assets/balloon.png"
            onClicked: anim.restart()
            // onClicked: anim.restart()
            text: "standalone animation"
            NumberAnimation {
                id: anim
                target: rocket3
                properties: "y"
                to: 750
                duration: 1000
            }
        }
    }
}
