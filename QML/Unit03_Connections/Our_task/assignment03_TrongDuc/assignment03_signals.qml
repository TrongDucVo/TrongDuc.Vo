import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Signals")




    Rectangle{
        id:rect
        width: 100
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 40


        color:"blue"


        MouseArea{
            id:mouseArea
            anchors.fill: parent
            onPressedChanged: {
                console.log("Mouse area is pressed",pressed)
                rect.color="black"
            }

        }

    }
}
