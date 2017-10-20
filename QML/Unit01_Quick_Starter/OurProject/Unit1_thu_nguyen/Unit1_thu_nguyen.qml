import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1500
    height: 1100
    Image {
        anchors.fill: parent
        objectName: "back_ground"
        source: "images/background.jpg"
    }
    Rectangle{
        width: 400
        height: 50
        color: "linen"
        x: 550; y: 200
        Text{
            font.family: "Helvetica"
            font.pointSize: 20
            color: "#FF9933"
            text: "  Greeting in different languages"
        }
    }
    Grid{
        rows: 4
        columns:1
        anchors.centerIn: parent
        anchors.margins: 20
        spacing: 10
        BlueSquare{
            id: vn
            Text {
                id: vnt
                font.family: "Helvetica"
                font.pointSize: 18
                color: "white"
                text: " Vietnames"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    vn.color = "#00FF00"
                    vnt.text = " Vietnamese: Xin chào!"
                }
            }
        }
        BlueSquare{
            id: en
            Text {
                id: ent
                font.family: "Helvetica"
                font.pointSize: 18
                color: "white"
                text: " English"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    en.color = "#00FF00"
                    ent.text = " English: Hello!"
                }
            }
        }
        BlueSquare{
            id: kr
            Text {
                id: krt
                font.family: "Helvetica"
                font.pointSize: 18
                color: "white"
                text: " Korean"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    kr.color = "#00FF00"
                    krt.text =" Korean: 안녕하세요!"
                }
            }
        }
        BlueSquare{
            id: other
            Text {
                font.family: "Helvetica"
                font.pointSize: 18
                color: "white"
                text: "Other language:"
            }
            TextInput {
                id: input1
                x: 3; y: 35
                width: 96; height: 20
                font.pointSize: 14
                color: "white"
                focus: true
                text: "Language: "
                KeyNavigation.tab: input2
            }
            TextInput {
                id: input2
                x: 3; y: 60
                font.pointSize: 14
                color: "white"
                width: 96; height: 20
                text: "Greeting: "
                KeyNavigation.tab: input1
            }

        }


    }
}
