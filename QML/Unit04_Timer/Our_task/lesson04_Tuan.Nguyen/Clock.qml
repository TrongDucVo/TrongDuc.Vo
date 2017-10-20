import QtQuick 2.0

import QtQuick 2.0

Rectangle{
    id:rec4
//    anchors.centerIn: root
    width: 360; height: 360
    border.color: "black"
    radius:180
    property int second: rec4.currentDate.getUTCSeconds()
    property int min: rec4.currentDate.getUTCMinutes()+((shift % 1) * 60)
    property int hour: rec4.currentDate.getUTCHours()+ Math.floor(shift)
    property var locale: Qt.locale()
    property date currentDate: new Date()
    property string dateString
    property real shift
    property alias city:cityLabel.text
    city:"Ha Noi"
    Rectangle {
        id:rec1
        //            anchors.centerIn: rec4
        anchors.horizontalCenter: rec4.horizontalCenter
        anchors.top:rec4.top
        anchors.topMargin: 130
        width: 4; height: 200
        color: "blue"
        transform: Rotation { origin.x: rec1.width/2; origin.y:rec1.height/4; angle: rec1.rec_angle
            Behavior on angle {
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }
        property int rec_angle
        Timer{
            id:timer
            repeat:true
            running:true
            interval:1000
            onTriggered: {
                if((rec1.rec_angle+=6)>=360)
                {
                    if((rec2.rec_angle+=6)>=360)
                    {
                        console.log("min")
                        if((rec3.rec_angle+=6)>=360)
                        {
                            console.log("min")
                            rec3.rec_angle=0
                        }
                        rec2.rec_angle=0
                    }
                    console.log(rec2.rec_angle)
                    rec1.rec_angle=0
                }
                //                    console.log(rec4.hour)
            }
        }

    }
    Rectangle{
        id:rec2
        //            anchors.centerIn: rec4
        anchors.horizontalCenter: rec4.horizontalCenter
        anchors.top:rec4.top
        anchors.topMargin: 140
        width: 4; height: 150
        color:"red"
        transform: Rotation { origin.x: rec2.width/2; origin.y:rec1.height/4-10; angle: rec2.rec_angle
            Behavior on angle {
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }
        property int rec_angle
    }
    Rectangle{
        id:rec3
        //            anchors.centerIn: rec4
        anchors.horizontalCenter: rec4.horizontalCenter
        anchors.top:rec4.top
        anchors.topMargin: 150
        width: 4; height: 100
        color:"black"
        transform: Rotation { origin.x: rec3.width/2; origin.y:rec1.height/4-20; angle: rec3.rec_angle
            Behavior on angle {
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }
        property int rec_angle
    }
    MouseArea{
        anchors.fill:rec4
        drag.target: rec4
    }
    Component.onCompleted: {
        rec1.rec_angle=rec4.second*6-180
        rec2.rec_angle=rec4.min*6-180
        rec3.rec_angle=rec4.hour*6-180
    }
    Text {
        id: cityLabel
        y: 210;
        anchors{
            top: rec4.bottom
            topMargin: 30
            horizontalCenter: rec4.horizontalCenter
        }
        color: "Black"
        font.family: "Helvetica"
        font.bold: true; font.pixelSize: 16
        style: Text.Raised; styleColor: "black"
    }

}

