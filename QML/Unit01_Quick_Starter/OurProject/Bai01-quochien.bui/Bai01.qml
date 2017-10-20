import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle{
    id: rec
    width: 520
    height: 520
    color: "white"
    Loader{
        id: loader
        focus: true
    }

    Image {
        id: image1
        x: 110
        y: 30
        width: 300
        height: 100
        source: "image/Welcome.jpg"
    }
    Text{
        id: text1
        x: 50
        y: 190
        font.pointSize: 20
        text: "USERNAME"
        color: "#0000FF"
    }
    Text{
        id: text2
        x: 50
        y: 290
        font.pointSize: 20
        text: "PASSWORD"
        color: "#0000FF"
    }
    TLineEditV1{
        id: input1
        x: 200
        y: 180
        width: 250
        height: 50
        text: ""
    }
    TLineEditV1{
        id: input2
        x: 200
        y: 280
        width: 250
        height: 50
        text: ""
    }
    Rectangle{
        id: rec1
        x: 200
        y: 400
        width: 135
        height: 50
        border.color: "black"
        color: "white"
        MouseArea {
            anchors.fill: parent
            onClicked: {

                loader.source = "page.qml"
                image1.visible=false
                text1.visible=false
                text2.visible=false
                rec1.visible=false
                input1.visible=false
                input2.visible=false
            }

            Text {
                id: text3
                anchors.centerIn: rec1
                font.pointSize: 25
                text: " SIGN IN"
                color: "blue"

            }
        }
    }
}
