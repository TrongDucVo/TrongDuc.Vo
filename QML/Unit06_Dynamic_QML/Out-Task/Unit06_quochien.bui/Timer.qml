import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    id: win
    visible: true
    width: 1000
    height: 600
    color: "#A9F5F2"
    property date currentDate: new Date()
    Row {
//        spacing: 20
        id: rowClock
        width: 700
        anchors.centerIn: win
        anchors.fill: parent
        anchors.margins: 50
        Rectangle{
            id: rec1
            width: 300
            height: 300
            Image{
                id: image1
                source: "images/hanoi.jpg"
                width: 300
                height: 350
            }

            Clock{hour:currentDate.getHours()+7;min:currentDate.getMinutes()}
            Text{
                anchors.bottom: image1.bottom
                anchors.horizontalCenter: rec1.horizontalCenter
                text: "Ha Noi"
                color: "#DB1515"
                font.pointSize: 24
                font.family: "Comic Sans MS"
            }
        }
        Rectangle{
            id: newyork
            width: 300
            height: 300
            Image{
                id: image2
                source: "images/newyork.jpg"
                width: 300
                height: 350
            }

            Clock{hour:currentDate.getHours()-5;min:currentDate.getMinutes()}
            Text{

                anchors.bottom: image2.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "New York"
                 color: "#F6EB12"
                font.pointSize: 24
                font.family: "Comic Sans MS"
            }
        }
        Rectangle{
            width: 300
            height: 300
            Image{
                id: image3
                source: "images/paris.jpg"
                width: 300
                height: 350
            }

            Clock{hour:currentDate.getHours()+2;min:currentDate.getMinutes()}
            Text{
                anchors.bottom: image3.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Paris"
                 color: "#323EBF"
                font.pointSize: 24
                font.family: "Comic Sans MS"
            }
        }
    }

    Text {
        //anchors.horizontalCenter:
        id: textt
        text: qsTr("World Clock")
        font.bold: true
        font.pointSize: 40
        font.family: "Comic Sans MS"
//        font.underline: true
        font.italic: true
        color: "#DF0101"
        horizontalAlignment: textt.AlignHCenter
        verticalAlignment: textt.AlignVCenter
        anchors.horizontalCenter: rowClock.horizontalCenter
        y: 450
    }
}
