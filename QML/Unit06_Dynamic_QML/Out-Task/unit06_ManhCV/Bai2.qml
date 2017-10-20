import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle{
    id: root
    visible: true
    width: 600
    height:600
    y:100;x:100

    Rectangle {
        id: frame
        width: 100; height: 70
        border.color: "black"
        radius: 8
        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
    }
    Rectangle {
        id: button
        width:50;height:30
        color: "lightgrey"
        x: 150; y:350
        signal click()
        function click_act(){
            console.log("Start the clock")
            timer1.running = true
            button.color = "#F660AB"
            frame.color = "#57FEFF"
            button2.color = "lightgrey"
        }
        Component.onCompleted: {
            button.click.connect(click_act)
        }
        Text{
            text: "Start"
            font.pixelSize: 20
            anchors.fill: button
            anchors.verticalCenter: button.verticalCenter
            anchors.horizontalCenter: button.horizontalCenter
        }
        MouseArea {
            id:mouseare
            anchors.fill: button
            onClicked:{
                button.click()
            }
        }
    }
    Rectangle {
        id: button2
        width:50;height:30
        color: "lightgrey"
        x: 390; y:350
        signal click1()
        function click1_act(){
            console.log("Stop the clock")
            timer1.running = false
            button2.color = "#F660AB"
            frame.color = "white"
            button.color = "lightgrey"
        }
        Component.onCompleted: {
            button2.click1.connect(click1_act)
        }
        Text{
            text: "Stop"
            font.pixelSize: 20
            anchors.fill: button2
            anchors.verticalCenter: button2.verticalCenter
            anchors.horizontalCenter: button2.horizontalCenter
        }
        MouseArea {
            id:mouseare2
            anchors.fill: button2
            onClicked:{
                button2.click1()
            }
        }
    }
    Timer {
        id: timer1
        interval: 1000
        running:false;repeat: true
        property int min: 00
        property int sec: 00
        onTriggered: {
            sec +=1
            if(sec%10==0){
                console.log("Hey guy! You wasted 10 seconds to look this clock")
            }
            if(sec ==60)
            {
                sec = 0; min += 1
            }
            if(min==60)
            {
                min = 0
            }
            display.text
        }
    }
    Text{
        id:display
        text: timer1.min +":"+timer1.sec
        font.pixelSize: 30
        anchors.verticalCenter: frame.verticalCenter
        anchors.horizontalCenter: frame.horizontalCenter
    }
    Text {
        id:noti
        text:"A notification will appear every 10 seconds in console"
        font.pixelSize: 20
        anchors.horizontalCenter: root.horizontalCenter
        y:30
    }
}
