import QtQuick 2.8
import QtQuick.Window 2.2

Window
{
    id: win1
    visible: true
    width: 800
    height: 534
    Item{
        Keys.onEnterPressed:
        {
            if(text1.state =="True"){
                onClickButton()
            }
        }


        //    Item{
        //        id: item1
        //        anchors.fill: parent
        //        focus: true


        //    }
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
            id: rectt
            Rectangle {
                id: rec1
                width: 100
                height: 50
                x: 50
                y: 250

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

            TLineEditV1 {
                id: input1
                x: 250; y: 250
                width: 300; height: 50
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
                echoMode: TextInput.Password
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
                color: "white"
                signal clickButton()
                signal enterPress()
                Text {
                    id: text1
                    //visible: false
                    state: "False"
                    font.pointSize: 25
                    text: " Sign In"

                    MouseArea {
                        id: mousearea
                        anchors.fill: parent
                    }
                }
            }
        }
        function enabledSubmit(){
            if((input1.text.length < 20 && input1.text.length > 3) && (input2.text.length !=0)){
                text1.state = "True"
            }
            else
            {
                text1.state = "False"
            }
        }
        function onClickButton(){
            if(text1.state =="True"){
                win1.visible = false
                rectt.visible = false;
                img1.visible = false;
                loader.source = "PageWelcome.qml"

            }
        }
        Component.onCompleted: {
            input1.focus = true
            input1.onTextChanged.connect(enabledSubmit)
            input2.onTextChanged.connect(enabledSubmit)
            mousearea.clicked.connect(onClickButton)
        }
    }
}
