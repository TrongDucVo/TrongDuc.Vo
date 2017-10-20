import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 800; height: 600;
    color: "#8e44ad"
    signal changePassword
    Row{
        spacing: 100
        anchors.centerIn: parent
        Rectangle{
            id: inptext
            width: 400
            height: 60
            color: "#2980b9"
            focus: true
            TextInput{
                id: inpt
                text: ""
                cursorVisible: true
                font.pointSize: 24
                anchors.fill: parent
                color: "#ecf0f1"
                onTextChanged: {
                    root.changePassword()
                }
            }
        }
        Rectangle{
            id: btn_submit
            width: 150
            height: 60
            color: "#bdc3c7"
            Text{
                id: submitText
                text: "Submit"
                font.pointSize: 24
                anchors.centerIn:  parent
            }
            MouseArea {
                id: submitClick
                visible: false
                anchors.fill: parent
                onClicked: {
                    submitText.text = "Submited"
                }
            }
        }
    }

    Component.onCompleted:{
        root.onChangePassword.connect(enableButtonSubmit)
    }

    function enableButtonSubmit() {
        if (inpt.length>=3&&inpt.length<=8)
        {
            submitClick.visible =true
            btn_submit.color="#2980b9"
        }
        else {

            btn_submit.color = "#bdc3c7"
            submitText.text = "Submit"
        }
    }
    Grid{
        visible: true
        columns: 4
        rows:2
        spacing: 10
        MyObject{myColor:"#1abc9c"}
        MyObject{myColor:"#2ecc71"}
        MyObject{myColor:"#3498db"}
        MyObject{myColor:"#16a085"}
        MyObject{myColor:"#27ae60"}
        MyObject{myColor:"#2980b9"}
        MyObject{myColor:"#bdc3c7"}
        MyObject{myColor:"#e74c3c"}
    }
    Rectangle{
        width: 800
        height: 200
        color: "#7f8c8d"
        anchors.bottom: parent.bottom
        Column{
            spacing: 2
            anchors.fill: parent
            Text {
                text: qsTr("This is a application using connect from signal and slot")
                font.pointSize: 24
                color: "#ecf0f1"
            }
            Text {
                text: "Click to circle to change this color to yellow"
                font.pixelSize: 24
                color: "#f1c40f"
            }
            Text {
                text: "Press and hold the circle, It will be small. Then you can change its position"
                font.pixelSize: 24
                color: "#ecf0f1"
            }
            Text {
                text: "Input text to text box! when lengt of text >=3 and <=8 you can submit!"
                font.pixelSize: 24
                color: "#ecf0f1"
            }
            Text {
                text: "Designer: tienthanh.pham"
                font.pixelSize: 24
                color: "#ecf0f1"
            }
        }
    }

}
