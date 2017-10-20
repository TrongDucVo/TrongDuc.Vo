
import QtQuick 2.0

Rectangle{
    id:rec4
//    anchors.centerIn: root
    width: 360; height: 360
    border.color: "black"
    radius:180
//        Image {
//            id: bgnd
//            anchors.fill:parent
//            source: {
//                if(6<rec4.hour&&rec4.hour<18) source:"day.jpg"
//                else source:"night.jpg"
//            }

//        }
    property int hour_cal
    property int second: rec4.currentDate.getUTCSeconds()
    property int min: rec4.currentDate.getUTCMinutes()+((shift % 1) * 60)
    property int hour:
    {
        hour_cal = currentDate.getUTCHours()+ Math.floor(shift)
        if(hour_cal<0) hour=(24+hour_cal)
        else if(0<=hour_cal<=24) hour=hour_cal
        else if(hour_cal>24) hour=(hour_cal-24)
    }

    property var locale: Qt.locale()
    property date currentDate: new Date()
    property string dateString
    property real shift
    property alias city:cityLabel.text
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
                    console.log(rec4.hour)
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
        rec3.rec_angle=rec4.hour*30+180

    }
    Text {
        id: cityLabel
        y: 210;
        anchors{
            top: rec4.bottom
            topMargin: 30
            horizontalCenter: rec4.horizontalCenter
        }
//        text:rec4.hour
        color: "Black"
        font.family: "Helvetica"
        font.bold: true; font.pixelSize: 16
        style: Text.Raised; styleColor: "black"
    }
    Text {
        id: time
        y: 210;
        anchors{
            bottom:  rec4.bottom
            bottomMargin:  30
            horizontalCenter: rec4.horizontalCenter
        }
        text:{

            if(0<rec4.hour&&rec4.hour<12) text:"PM"
                        else text:"AM"
        }
        color: "Black"
        font.family: "Helvetica"
        font.bold: true; font.pixelSize: 16
        style: Text.Raised; styleColor: "black"
    }

}

