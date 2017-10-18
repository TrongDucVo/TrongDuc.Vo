import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.1

Item {
    visible: true
    id:root

    Rectangle{
        id:rect
        width: root.width
        height: 200
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 40
        color:"blue"
        Button{

        id:button1
            width: 80
            height: 50
            text:"Push Here"

           y:260
anchors.horizontalCenter: parent.horizontalCenter

                onPressedChanged: {
                    console.log("Mouse area is pressed",pressed)
                    rect.color="black"
                }

            }
        }





        }



