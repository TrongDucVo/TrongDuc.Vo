import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    signal submitTextField(string text)
    // this function is our QML slot
    function setTextField(text){
        console.log("setTextField: " + text)
        textField1.text = text
    }
    visible: true
    width: 1000
    height: 1000
//    Rectangle{
//        id:rect1
//        x: 8; y: 8
//        border.color: "red"
//        width: 400; height: 400

//        signal action(real x1, real y1)
//        function Click(x1, y1) {
//            rect1.color = "red"
//            rect1.text = "click"
//            rect1.x = x1 -100
//            rect1.y = y1 -100
//    }
//        function Press(x1, y1) {
//            rect1.color = "green"
//            rect1.text = "press"
//            rect1.x = x1 -100
//            rect1.y = y1 -100
//    }
//        function PressandHold(x1, y1) {
//            rect1.color = "black"
//            rect1.text = "pressnHold"
//            rect1.x = x1 -100
//            rect1.y = y1 -100
//    }

//        PropertyAnimation {
//            id: scaleAnimation
//            target: appIcon
//            properties: "scaledown"
//            duration: -100000
//            easing.type: Easing.OutQuad
//        }
//        //Animation to move to new index
//        ParallelAnimation {
//            id: moveToNewIndexAnimation
//            SmoothedAnimation {
//                target: appIcon
//                properties: "x"
//                duration: 100
//                easing.type: Easing.OutQuad
//                to: aParent.calculateX(pageIndex, appIcon.newCellIndex)
//            }
//            SmoothedAnimation {
//                target: appIcon
//                properties: "y"
//                duration: 100
//                easing.type: Easing.OutQuad
//                to: aParent.calculateY(pageIndex, appIcon.newCellIndex)
//            }
//        }
//    }
    Rectangle {
        width: 360
        height: 360
        Text {
            id: msg
            text: "Button kicked"
            visible : false
        }
        Button {
            x: 50; y: 50
            text: "kick me"
            onClicked: msg.visible = true
        }
    }
//    Rectangle {
//        width: 300
//        height: 300
//        Text {
//            id: msg1
//            x: 20; y:20
//            text: "Button clicked"
//            visible : false
//        Button {
//            x: 100; y: 100
//            text: "kick me"
//            onClicked: msg1.visible = true
//        }
//    }
//    }
    Image {
         id: container
         x: 300; y:300
        source: "image/ball_yellow_2.png"
         property int repeatDelay: 300
         property int repeatDuration: 75
         property bool pressed: false
         signal clicked
         scale: pressed ? 0.9 : 1
         function release() {
             autoRepeatClicks.stop()
             container.pressed = false
         }

         SequentialAnimation on pressed {
             id: autoRepeatClicks
             running: false

             PropertyAction { target: container; property: "pressed"; value: true }
             ScriptAction { script: container.clicked() }
             PauseAnimation { duration: repeatDelay }

             SequentialAnimation {
                 loops: Animation.Infinite
                 ScriptAction { script: container.clicked() }
                 PauseAnimation { duration: repeatDuration }
             }
         }

         MouseArea {
             anchors.fill: parent
             onPressed: autoRepeatClicks.start()
             onReleased: container.release()
             onCanceled: container.release()
         }
     }

    TextField {
        id: textField1
        x: 531
        y: 269
        width: 200
        placeholderText: qsTr("what is your username?..")
    }
    TextField {
        id: textField2
        x: 531
        y: 369
        width: 200
        placeholderText: qsTr("what is your password?...")
    }

    Button {
        id: but
        x: 793
        y: 267
        text: qsTr("Username")
        onClicked:
            // emit the submitTextField signal
            submitTextField(textField1.text)
    }
    Button {
        id: but1
        x: 793
        y: 367
        text: qsTr("Password")
        onClicked:
            // emit the submitTextField signal
            submitTextField(textField1.text)
    }
    Button {
        id: but2
        x: 693
        y: 500
        text: qsTr("Login")
        onClicked:
            // emit the submitTextField signal
            submitTextField(textField1.text)
    }

    Component.onCompleted: {
            but.setTextField.connect(tx1.changeText)  //  connect signal and slot
            but.setTextField() //  Call slot.
    }
}


