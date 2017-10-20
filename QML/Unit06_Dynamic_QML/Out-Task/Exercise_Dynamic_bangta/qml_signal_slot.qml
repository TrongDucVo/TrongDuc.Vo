import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Rectangle {
    signal submitTextField(string text)

    // this function is our QML slot
    function setTextField(text){
        console.log("setTextField: " + text)
        textField1.text = text
    }
    visible: true
    width: 1000
    height: 1000
    Image {
        id:appIcon
        width: 400; height: 400
        source: "assets01/face.jpg"
        PropertyAnimation {
            id: scaleAnimation
            target: appIcon
            properties: "scaledown"
            duration: -100000
            easing.type: Easing.OutQuad
        }
        //Animation to move to new index
        ParallelAnimation {
            id: moveToNewIndexAnimation
            SmoothedAnimation {
                target: appIcon
                properties: "x"
                duration: 100
                easing.type: Easing.OutQuad
                to: aParent.calculateX(pageIndex, appIcon.newCellIndex)
            }
            SmoothedAnimation {
                target: appIcon
                properties: "y"
                duration: 100
                easing.type: Easing.OutQuad
                to: aParent.calculateY(pageIndex, appIcon.newCellIndex)
            }
        }
    }
//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            Qt.quit();
//        }
//    }
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

