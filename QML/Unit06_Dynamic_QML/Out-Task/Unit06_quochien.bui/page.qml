import QtQuick 2.0

Rectangle{
    width: 1000
    height: 520
    visible: true
    Text {
        x: 200
        text: "Move circle to A, B, C"
        font.pointSize: 15
        font.bold: true
        color: "#F07132"
    }
    Rectangle{
        x: 100; y:300
        width:100; height: 100
        radius: width*0.5
        border.color: "#610B21"
        Text{
            text: "A"
            font.bold: true
            font.pointSize: 10
        }
    }
    Rectangle{
        x: 450; y:100
        width:100; height: 100
        radius: width*0.5
        border.color: "#0101DF"
        Text{
            text: "B"
            font.bold: true
            font.pointSize: 10
        }
    }
    Rectangle{
        x: 450; y:300
        width:100; height: 100
        radius: width*0.5
        border.color: "#264A22"
        Text{
            text: "C"
            font.bold: true
            font.pointSize: 10
        }
    }

    Rectangle {
        id: item
        x: 100
        y: 100
        width: 100
        height: 100
        radius: width*0.5
        Text{
            x: 90
            y: 100
            text:"Press and hold"
            font.pointSize: 10
            color: "red"
            font.bold: true
        }
        state: "stop"

        states: [
            State {
                name: "go"
                PropertyChanges { target: mouseArea; drag.target: item}
                PropertyChanges { target: item; color: "#F2281A"}
            },
            State {
                name: "stop"
                PropertyChanges { target: mouseArea; drag.target: undefined}
                PropertyChanges { target: item; color: "#2FE80E"}
            }
        ]
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onPressAndHold: {
//                duration: 800
                item.state = "go"
                //mouse.accepted = false
            }
            onReleased: {
                item.state = "stop"
            }
        }
    }
}
