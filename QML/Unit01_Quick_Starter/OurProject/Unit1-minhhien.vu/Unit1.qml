import QtQuick 2.0
BrightSquare {
    id: root
    width: 700
    height: 600

    Image {
        x: 120
        y: 0
        width: 400
        height: 200
        id: img1
        source: "image/Helloworld.jpg"
    }
    Loader {
        id: loader
        focus: true
    }

    Rectangle {
        Rectangle {
            width: 100
            height: 50
            x: 50
            y: 250
            id: rec1
            Text {
                anchors.fill: parent
                font.pointSize: 30
                id: username
                text: "Username "
            }
        }
        Rectangle {
            width: 100
            height: 50
            x: 50
            y: 320
            id: rec2
            Text {
                anchors.fill: parent
                font.pointSize: 30
                id: password
                text: "Password "
            }
        }

        TLineEditV1{
            id: input1
            x: 250; y: 250
            width: 300; height: 50
            //            text: ""
            KeyNavigation.tab: input2
            signal typeText(string text)

            onTextChanged: {
                typeText(input1.text)
            }

        }
        TLineEditV1{
            id: input2
            x: 250; y: 320
            width: 300; height: 50
            //            text: ""
            KeyNavigation.tab: input1
            signal typeText(string text)
            onTextChanged: {
                typeText(input2.text)
            }
        }
        Rectangle {
            id: rec3
            x: 300
            y: 400
            width: 200
            height: 200
            //border.color: "black"
            color: "white"
            signal clickButton()

            Text {
                id: text1
                visible: false
                font.pointSize: 25
                text: " Sign In"

                MouseArea {
                    id: mousearea
                    anchors.fill: parent
                }
            }
        }
        function enabledSubmit(){
            if((input1.text.length < 10 && input1.text.length > 3) && (input2.text.length !=0)){
                text1.visible = true
            }
            else
            {
                text1.visible = false
            }
        }

        function onClickButton(){
            loader.source = "PageWelcome.qml"
            rec1.visible=false
            rec2.visible=false
            rec3.visible=false
            input1.visible=false
            input2.visible=false
        }

        Component.onCompleted: {
            input1.onTextChanged.connect(enabledSubmit)
            input2.onTextChanged.connect(enabledSubmit)
            mousearea.clicked.connect(onClickButton)
        }
    }
}
