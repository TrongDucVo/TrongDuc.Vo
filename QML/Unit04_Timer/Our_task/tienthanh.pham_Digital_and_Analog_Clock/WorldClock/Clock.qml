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
            source: "img/back2.png"
            width: parent.width
            height: parent.height
        }
        HandClock{hand:"img/hour.png";time:hour*360/12+min/2}
        HandClock{hand:"img/min.png";time:min*360/60}
        HandClock{hand:"img/sec.png";time:sec*360/60}
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
    }
}
