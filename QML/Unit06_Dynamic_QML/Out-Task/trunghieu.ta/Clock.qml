import QtQuick 2.6

Rectangle {
    id: id_root
    height: 300
    width: 300

    property var date: new Date()
    property int hours: date.getHours()
    property int minutes: date.getMinutes()
    property int seconds: date.getSeconds()
    property int value: 0
    property alias cityText : text.text

    function getDate(){
        var date = new Date()
        hours = date.getHours() + value
        minutes = date.getMinutes()
        seconds = date.getSeconds()
    }

    Timer {
        //id: timer
        interval: 500; running: true; repeat: true; triggeredOnStart: true
        onTriggered: {
            id_root.getDate()
        }
    }

    Image {
        id: clock
        width: id_root.width
        height: width
        source: "images/clocks/Clock_v2.png"
        anchors.centerIn: parent
    }

    Image {
        id: second
        width: clock.width
        height: clock.width
        source: "images/clocks/second_2.png"
        anchors.verticalCenter: parent.verticalCenter
        transform: Rotation {
            origin.x: second.width/2
            origin.y: second.height/2

            angle: id_root.seconds*6
            Behavior on angle {
                SpringAnimation{
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }

    }

    Image {
        id: hour
        width: clock.width*0.7
        height: width
        source: "images/clocks/second_1.png"
        anchors.verticalCenter: parent.verticalCenter
        x: id_root.width/6.4
        transform: Rotation {
            origin.x: hour.width/2
            origin.y: hour.width/2

            angle: id_root.hours*30 + id_root.minutes*0.5
            Behavior on angle {
                SpringAnimation{
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }

    }

    Image {
        id: minute
        width: clock.width
        height: width
        source: "images/clocks/second_1.png"
        anchors.verticalCenter: parent.verticalCenter
        transform: Rotation {
            //id: xx
            origin.x: minute.width/2
            origin.y: minute.width/2

            angle: id_root.minutes*6
            Behavior on angle {
                SpringAnimation{
                    spring: 2
                    damping: 0.3
                    modulus: 360
                }
            }
        }
    }

    Rectangle {
        width: id_root.width/15
        height: width
        radius: width/2
        anchors.centerIn: parent
        color: "red"
    }

    Rectangle {
        width: id_root.width/25
        height: width
        radius: width/2
        anchors.centerIn: parent
        color: "blue"
    }

    Text {
        id: text
        font.bold: true
        font.pixelSize: id_root.width/15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: id_root.width/5
    }

}
