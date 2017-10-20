import QtQuick 2.6

Item{
    width: 250
    height: 250
    anchors.centerIn: parent
    property var sec: 0
    property var hour: 0
    property var min: 0
    Rectangle{
        width: 250
        height: 250
        radius: width/2
        color: "#00000000"
        Image {
            id: bg
            source: "img/back.png"
            width: parent.width
            height: parent.height
        }
        Timer{
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                sec++
                if (sec==60){
                    sec=0;
                    min++;
                }
                if (min==60){
                    hour++;
                    min = 0;
                }
            }
        }

        Item{

            anchors.fill: parent
            Image {
                id: clockHand
                source: "img/hour.png"
                anchors.fill: parent
                RotationAnimation{
                    id: rotation
                    target: clockHand

                    to:hour*360/12+min/2
                    duration: 10
                    running: true
                    onToChanged: {
                        rotation.start()
                    }
                }
            }
        }
        Item{

            anchors.fill: parent
            Image {
                id: clockHand1
                source: "img/min.png"
                anchors.fill: parent
                RotationAnimation{
                    id: rotation1
                    target: clockHand1

                    to:min*360/60
                    duration: 10
                    running: true
                    onToChanged: {
                        rotation1.start()
                    }
                }
            }
        }
        Item{

            anchors.fill: parent
            Image {
                id: clockHand2
                source: "img/sec.png"
                anchors.fill: parent
                RotationAnimation{
                    id: rotation2
                    target: clockHand2

                    to:sec*360/60
                    duration: 10
                    running: true
                    onToChanged: {
                        rotation2.start()
                    }
                }
            }
        }

    }
}
