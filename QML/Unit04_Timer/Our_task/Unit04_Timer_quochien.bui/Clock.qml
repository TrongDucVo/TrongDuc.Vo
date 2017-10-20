import QtQuick 2.6

Item{
    width: 300
    height: 300
    anchors.centerIn: parent
    property var sec: 0
    property var hour: 0
    property var min: 0
    Rectangle{
        width: 300
        height: 300
        radius: width/2
        color: "#00000000"
        Image {
            id: bg
            source: "images/clock.png"
            width: parent.width
            height: parent.height
        }
        Clockwise{wise:"images/hour.png";time:hour*360/12+min/2}
        Clockwise{wise:"images/minute.png";time:min*360/60}
        Clockwise{wise:"images/second.png";time:sec*360/60}
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
