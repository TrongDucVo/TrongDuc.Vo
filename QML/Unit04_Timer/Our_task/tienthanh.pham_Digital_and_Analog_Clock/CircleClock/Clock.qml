import QtQuick 2.6

Item{
    width: 250
    height: 250
    anchors.centerIn: parent
    Rectangle{
        width: 250
        height: 250
        radius: width/2
        color: "#000000"
        Image {
            id: bg
            source: "img/back.png"
            anchors.fill: parent
        }
        HandClock{hand:"img/hour.png";time:60*60*60000}
        HandClock{hand:"img/min.png";time:60*60000}
        HandClock{hand:"img/sec.png";time:60000}
        Rectangle{
            width: 10
            height: 10
            radius:5
            color: "white"
            anchors.centerIn: parent
        }
    }
}
