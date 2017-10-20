import QtQuick 2.6
import QtQuick.Window 2.2




Item{
    id: root
    width: 860
    height: 500
    visible: true


    signal clickImage
    signal pressHold
    signal changePassword

    Row{
        spacing: 100
        anchors.centerIn: parent
        Rectangle{
            id: inptext
            width: 300
            height: 60
            color: "white"
            focus: true
            border.width: 1
            TextInput{
                id: inpt
                text: ""

                cursorVisible: true
                font.family: "Ubuntu"
                font.pointSize: 24
                anchors.fill: parent
                color: "Grey"
                onTextChanged: {
                    root.changePassword()
                }
            }
        }
        Rectangle{

            Column{
                spacing: 2
                anchors.bottom: btn_submit.top

                Text {
                    text: "Type >=3 or <=8 to submit"
                    font.pixelSize: 24
                    color: "Blue"
                }


            }


            id: btn_submit
            width: 150
            height: 60
            color: "#bdc3c7"
            border.width: 1
            Text{
                id: submitText
                text: "Submit"
                font.family: "Ubuntu"
                font.pointSize: 24
                anchors.centerIn:  parent

            }
            MouseArea {
                id: submitClick
                visible: false
                anchors.fill: parent
                onClicked: {

                    submitText.text = "Submitted"

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
                btn_submit.color="green"
            }
            else {

                submitClick.visible =false
                btn_submit.color = "#bdc3c7"
                submitText.text = "Submit"

            }
        }
    }


    Rectangle{
        Column{
            spacing: 2
            anchors.fill: parent

            Text {
                text: "Click to circle to change the color"
                font.pixelSize: 24
                color: "Blue"
            }
            Text {
                text: "Press and hold the circle to make it smaller"
                font.pixelSize: 24
                color: "Blue"
            }

        }
        id: rec


        x : 50
        y : 50
        width: 100
        height: 100
        radius : 50
        color:"green"

        MouseArea{
            id: poit
            anchors.fill: parent
            onClicked: {
                root.clickImage();
            }
            onPressAndHold: {
                root.pressHold()
            }
            onReleased: {
                rec.scale = 1;
                drag.target = poit
            }

        }
    }
    function myClick(){
        rec.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        poit.drag.target=rec
    }

    function myPressHold(){
        rec.scale = 0.5
        poit.drag.target =rec
    }
    Component.onCompleted: {
        root.onClickImage.connect(myClick)
        root.onPressHold.connect(myPressHold)

    }
}

