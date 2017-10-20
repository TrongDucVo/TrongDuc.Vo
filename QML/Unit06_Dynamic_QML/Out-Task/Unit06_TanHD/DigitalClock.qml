import QtQuick 2.0

Item {
    property int hours: 00
    property int minutes: 00
    property int seconds: 00
    property string clockName: value

    Rectangle {
        id: rect1
        width: 80
        height: 80
        border.color: "black"
        border.width: 3
        radius: 10
        Text {
            id: hello1
            anchors.centerIn: parent
            color: "red"
            font.pointSize: 30

        }
    }
    Text {
        id: middleText
        text: ":"
        font.pointSize: 50
        x: 80
    }
    Rectangle {
        id: rect2
        width: 80
        height: 80
        x: 100
        border.color: "black"
        border.width: 3
        radius: 10
        Text {
            anchors.centerIn: parent
            id: hello2
            color: "green"
            font.pointSize: 30

        }
    }
    Text {
        id: middleText2
        text: ":"
        font.pointSize: 50
        x: 180
    }
    Rectangle {
        id: rect3
        width: 80
        height: 80
        x: 200
        border.color: "black"
        border.width: 3
        radius: 10
        Text {
            anchors.centerIn: parent
            id: hello3
            color: "blue"
            font.pointSize: 30
        }
    }
    Text {
        id: timeZone
        text: clockName
        x:300
    }
    Timer {
        id: timer2
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            seconds++
            if (seconds == 60) {
                seconds = 0
                minutes++
            }
            if (minutes == 60) {
                minutes = 0
                hours++
            }
            if (hours == 24) {
                hours = 0
            }
            if (seconds<10) hello3.text = "0"+seconds
            else hello3.text = seconds
            if (minutes<10) hello2.text = "0"+minutes
            else hello2.text = minutes
            if (hours<10) hello1.text = "0"+hours
            else hello1.text = hours
            console.log("running...")
        }
    }
}
