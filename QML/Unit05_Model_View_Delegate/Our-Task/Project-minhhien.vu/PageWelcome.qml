import QtQuick 2.0
import QtQuick.Window 2.2

Window {
    id: win2
    width: 800
    height: 534
    visible: true
    Item {
        anchors.fill: parent
        focus: true
        Keys.onEnterPressed:onEnterPress()

        Loader{
            id: loader2
            focus: true
        }

        AnimatedImage{
            id: img2
            x: 0
            y: 0
            source: "image/fire.gif"
        }
        Text {
            id: text2
            x: 80
            y: win2.height-height
            text: qsTr("Welcome to my page!!")
            font.pointSize: 50
            color: "white"
            ParallelAnimation{
                running: true
                NumberAnimation{
                    target: text2
                    properties: "y"
                    to: win2.height/2 - 50
                    duration: 3000
                }
            }
        }

        function onEnterPress(){
            win2.visible = false
            loader2.source = "Catalogue.qml"
        }
    }
}
