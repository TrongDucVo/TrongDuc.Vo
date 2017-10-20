import QtQuick 2.0
Item {
    id: root
    width: 200; height: 240
    property alias cityName: cityLable.text
    property  int gio
    property int phut
    property int giay
    property int shift
    property bool night
    function changeTime(){
        var date = new Date;
        gio = date.getUTCHours()+shift
        phut = date.getUTCMinutes()
        giay = date.getUTCSeconds()
        night = (gio < 7 || gio > 19)
    }
    Timer{
        interval: 1000; running: true; repeat: true
        onTriggered: root.changeTime()
    }
    Item {
        id: it1
        width: 200; height: 240
        anchors.centerIn: parent
        Image {
            id: im1
            x: (root.width - width)/2; y: (root.height - height)/2
            source: "image02/clock.png"
            visible: root.night == false
        }
        Image {
            id: im2
            x: (root.width - width)/2; y: (root.height - height)/2
            source: "image02/clock-night.png"
            visible: root.night == true
        }

        Image {
            id: kimgio
            x: 92.5; y: 27
            source: "image02/hour.png"
            scale: 0.5
            transform: Rotation{
                id:quaykimgio
                origin.x: 7.5; origin.y: 73;
                angle: root.gio*30 + root.phut*0.5
                Behavior on angle {
                    SpringAnimation{
                        spring: 2
                        modulus: 360
                        damping: 0.2
                    }

                }

            }

        }
        Image {
            id:kimphut
                 x: 93.5; y: 17
            source: "image02/minute.png"
            scale: 0.5
            transform: Rotation{
                id:quaykimphut
                origin.x: 6.5; origin.y: 83;
                angle: root.phut*6
                Behavior on angle {
                    SpringAnimation{
                        spring: 2
                        modulus: 360
                        damping: 0.2
                    }

                }
            }
        }

        Image {
            id:kimgiay
               x: 97.5; y: 20
            source: "image02/second.png"
            scale: 0.5
            transform: Rotation{
                id:quaykimgiay
                origin.x: 2.5; origin.y: 80;
                angle: root.giay*6
                Behavior on angle {
                    SpringAnimation{
                        spring: 2
                        modulus: 360
                        damping: 0.2
                    }

                }
            }
        }
    }
    Text {
        id: cityLable
//        anchors.top: clockFace.bottom; anchors.topMargin: 30
//        anchors.horizontalCenter: clockFace.horizontalCenter
        font.family: "Ubuntu"
        font.bold: true
        font.pixelSize: 24
        color: "#7f8c8d"
    }
}




