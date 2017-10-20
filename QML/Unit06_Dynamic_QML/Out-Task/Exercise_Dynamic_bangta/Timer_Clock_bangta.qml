import QtQuick 2.8
import QtQuick.Window 2.2


Rectangle {
    visible: true
   width: 640; height: 320
    Rectangle {
        id:root
        width: 500; height: 400
        color: "white"
        Grid {
            id: clockView
            anchors.fill: parent


            Clock{cityName: "Hanoi - VN"; shift: +7}

            Clock {cityName: "New York - USA"; shift: -5}

            Clock {cityName: "Paris - France"; shift: 0}


        }
        Image {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 10
            source: "content/content/arrow.png"
            rotation: -90
            opacity: clockview.atXBeginning ? 0 : 0.5
            Behavior on opacity { NumberAnimation { duration: 500 } }
        }
        Image {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 10
            source: "content/content/arrow.png"
            rotation: 90
            opacity: clockview.atXEnd ? 0 : 0.5
            Behavior on opacity { NumberAnimation { duration: 500 } }
        }
    }

}
