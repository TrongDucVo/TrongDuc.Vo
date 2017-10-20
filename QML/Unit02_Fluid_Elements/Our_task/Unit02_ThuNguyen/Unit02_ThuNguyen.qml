import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1900
    height: 1000
    property int count: 0

    Image{
        id: bg
        anchors.fill: parent
        source: "image/road2.jpg"
    }
    Timer{

        interval: 2000;
        running: true;
        repeat: true
        onTriggered: {
            count++
            if(count == 2){
                rabbit.text = "I still have a lot of time."
            }

            if (count == 5) {
                rabbit.source = "image/rabbit3.png"
                rabbit.text ="Omg! Why is he so quick?"
            }
            if (count == 6){
                rabbit.source = "image/rabbit4.png"
                rabbit.text = "I have to hurry up."
            }
            if (count == 8){
                rabbit.source = "image/rabbit3.png"
                rabbit.text ="Oh,no. He wins"
            }
        }
    }
    ClickableImageV3{
        id: rabbit
        x:10
        y:470
        source: "image/rabbit1.png"
        text: "Rabbit: Please CLICK on me to start!"
        onClicked: anim1.restart()
    }
    ParallelAnimation{
        id: anim1
        NumberAnimation {
            target: rabbit
            property: "y"
            to: 580
            duration: 5000
        }
        NumberAnimation {
            target: rabbit
            property: "x"
            duration: 13000
            to: 1000
        }
    }
    Image{
        x: 10
        y: 580
        width:100
        height:100
        source: "image/turtle.png"
        NumberAnimation on x{
                duration: 14000
                to: 1800
                loops: Animation.Infinite
        }
    }


}
