import QtQuick 2.0
Item {
    id: root
    width: 400; height: 400
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
        width: 80; height: 80
        anchors.centerIn: parent
        Image {
            id: im1
            x: (root.width - width)/2; y: 20
            source: "image/clock.png"
            visible: root.night == false
        }
        Image {
            id: im2
            x: (root.width - width)/2; y: 20
            source: "image/clock-night.png"
            visible: root.night == true
        }
        ShaderEffectSource{
        }
        Image {
            id: kimgio
            x: (root.width - width)/2 -1; y: 20
            source: "image/hour.png"
            scale: 0.5
            transform: Rotation{
                id:quaykimgio
                origin.x : kimgio.width/2; origin.y: kimgio.height/2
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
            source: "image/minute.png"
            scale: 0.5
            transform: Rotation{
                id:quaykimphut
                origin.x : kimphut.width/2; origin.y: kimphut.height/2
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
    }
    Text {
        id: cityLable


        font.family: "Ubuntu"
        font.bold: true
        font.pixelSize: 24
        color: "#7f8c8d"
    }
}




