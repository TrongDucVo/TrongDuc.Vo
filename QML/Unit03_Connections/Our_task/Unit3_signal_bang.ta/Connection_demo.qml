import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    visible: true
    width: 900
    height: 900
    title: qsTr("Connection")

    //    Rectangle {
    //        id: relay
    //        signal send( string person, string notice)
    //        onSend: console.log("Send signal to: " + person + ", " + notice)
    //        Component.onCompleted: {//connect signal - slot
    //            relay.send.connect(sendToPost)
    //            relay.send.connect(sendToTelegraph)
    //            relay.send.connect(sendToEmail)
    //            relay.send("Tom", "Happy Birthday")
    //        }

    //        function sendToPost(person, notice) {
    //            console.log("Sending to post: " + person + ", " + notice)
    //        }
    //        function sendToTelegraph(person, notice) {
    //            console.log("Sending to telegraph: " + person + ", " + notice)
    //        }
    //        function sendToEmail(person, notice) {
    //            console.log("Sending to email: " + person + ", " + notice)
    //        }
    //    }
    //        signal nhapText(String text, var a, var b, var c)
    //    //function nhapText:
    //signal nhanText(string text)
    Rectangle{
        id:rect0
        width: 900; height: 900
        signal enableSubmit()
        Rectangle {
            id: rect1
            x: 250; y: 100
            height: 502; width: 602
            border.color: "red"
            color: "white"
            Image {
                id:img
                width: 600; height: 500
                source: "assets/images.jpg"
            }
            Text {
                id: txt2
                color: "red"
                font.pixelSize: 50
                anchors.centerIn: parent
                text: qsTr("Submit")
            }
            function enableSubmit( ){
                if(text.length > 10 && text.length < 16)
                    tx2.visible = true;
                else tx2.visible = false;
            }
    }
        TextInput{
            id: tx1
            x:50; y:50
            color: "blue"
            text: "nhap ten o day"

            MouseArea {
                id: txtMouseArea
                anchors.fill: parent
                onClicked: {
                    tx1.clear()
                    tx1.focus = true
                }
            }
        }
        Component.onCompleted: {
            rect1.enableSubmit.connect(tx1.changeText)  //  connect signal and slot
            rect1.enableSubmit() //  Call slot.
        }

    }
    }
