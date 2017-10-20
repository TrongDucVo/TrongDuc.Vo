import QtQuick 2.8
import QtQuick.Window 2.2

Rectangle {
    id: win
    visible: true
    width: 640
    height: 480
    Image{
        id: image
        width: 640
        height: 480
        source: "images/bg.jpg"
    }

    Rectangle{
        id: rec1
        x: 150
        y: 100
        width: 350
        height: 50
        Rectangle{
            anchors.fill: parent
            color: "#E6E6E6"
            border.color: "black"
        }
        property alias text: input1.text
        property alias input: input1
        TextInput{
            id: input1
            font.pointSize: 15
            anchors.fill: parent
            anchors.margins: 10
            focus: true
            signal typeText(string text)
            onTextChanged: {
                typeText(input1.text)
            }
            MouseArea {
                id: txtMouse
                anchors.fill: parent
                onClicked: {
                    input1.clear()
                    input1.focus = true
                }
            }
        }
    }
    Loader{
        id: loader
        focus: true
    }

    Rectangle{
        id: rec2
        x:270
        y: 200
        width: 100
        height: 100
        radius: width*0.5
        color: "red"
        border.color: "black"
        Text {
            id: text1
            state: "False"
            font.pointSize: 15
            text: "Submit"
            anchors.centerIn: rec2
            signal clickButton()
        }
        MouseArea {
            id: mousearea
            anchors.fill: parent
    }
    Component.onCompleted: {
        input1.onTextChanged.connect(enableSubmit)
        mousearea.clicked.connect(onClickButton)
    }

    function enableSubmit(){
        if(input1.text.length >= 8 && input1.text.length <= 20)
        {
            rec2.color ="green"
            text1.state ="True"
        }
        else
        {
            text1.state = "False"
            rec2.color = "red"
        }
    }
    function onClickButton(){
        if(text1.state=="True")
        {

            loader.source = "page.qml"
            input1.visible=false
            input1.visible=false
            rec2.visible=false
            image.visible=false
        }
    }

}
}
