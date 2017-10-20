import QtQuick 2.6
import QtQuick.Window 2.2
//import Qt.labs.controls 1.0

Rectangle{
    id: root
    width: 200; height: 400
    color: "lightsteelblue"
    border.color: "slategrey"
    Image {
        id: logo
        width: 50; height: 90
        anchors.left: root.left
        anchors.topMargin: 2
        anchors.margins: 6
        source: "bachkhoa.jpg"
    }
    Image {
        id: welcome
        y: 200
        anchors.horizontalCenter:  root.horizontalCenter
        source: "welcome.png"
    }
    Text {
        id: tentruong
        x: 60; y: 5
        font.family:   "Ubuntu"
        font.pixelSize: 60
        width: 100; height: 100
        text: qsTr("Dai Hoc Bach Khoa Ha Noi")
    }
    Text {
        id: tentrang
        font.family: "Ubuntu"
        y: 90
        font.pixelSize: 60
        anchors.horizontalCenter: root.horizontalCenter
        text: qsTr("He thong quan li sinh vien")
    }
    Rectangle{
        id: btnMSSV
        width: 100; height: 40
        y: 350
        anchors.left: tentrang.left
        color: "lightgreen"
        Text {
            id: mssv
            font.family: "Ubuntu"
            font.pixelSize: 30
            anchors.fill: btnMSSV
            anchors.centerIn: btnMSSV.Center
            text: qsTr("MSSV")
        }
       Rectangle{
           id: input_mssv
           width: 150; height: 40
           x: 160
           color: "white"
           TextInput {
               id : input1
               anchors.fill: input_mssv
               font.pixelSize: 30
               focus: true
               KeyNavigation.tab:input2

           }
       }
    }
    Rectangle{
        id: btn_password
        width: 100; height: 40
        y: 400
        anchors.left: tentrang.left
        color: "lightgreen"
        Text {
            id: password
            font.family: "Ubuntu"
            font.pixelSize: 20
            anchors.fill: btn_password
            anchors.centerIn: btn_password.Center
            text: qsTr("Password")
        }
       Rectangle{
           id: input_password
           width: 150; height: 40
           x: 160
           color: "white"
           TextInput {
               id: input2
               anchors.fill: input_password
               font.pixelSize: 30
               focus: true
               KeyNavigation.tab: btn_login

           }
       }
    }
     Rectangle{
        id: btn_login
        width: 70;height: 40
        anchors.left: btn_password.left
        y: 450
        color: "Grey"
        Text{
            anchors.fill: btn_login
            text: "Login"
            font.pixelSize: 25
        }
    }

}
