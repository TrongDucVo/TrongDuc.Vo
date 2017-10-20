//appStudentMarkMan.qml
import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    id: id_root
    visible: true
    width: 800
    height: 600
    Text {
        id: textT
        text: qsTr("Student Mark Management ")
        color: "black"
        font.pointSize: 30
        anchors.horizontalCenter: id_root.horizontalCenter
        //font.family: "Helvetica"
        //font.bold: true
        y: 50
    }

    Rectangle {
        id: rect_in
        height: id_root.width/4
        width: id_root.width/3
        border.color: "red"
        border.width: 4
        x: id_root.width/10
        y: id_root.height/3

        Rectangle {
            id: inName
            height: rect_in.height/4
            width: rect_in.width*0.6
            border.width: 2
            anchors.top: rect_in.top
            anchors.right: rect_in.right
            anchors.margins: height*0.4
            color: "lightsteelblue"
            border.color: "blue"
            TextEdit {
                id: textTen
                x: 20; y: 10
                width: inName.width*0.8;
                height: inName.height*0.8
                focus: true
                font.pixelSize: 22
                wrapMode: Text.Wrap
                //KeyNavigation.tab: inMark

            }
        }

        Rectangle {
            id: inMark
            height: rect_in.height/4
            width: rect_in.width*0.6
            border.width: 2
            anchors.bottom: rect_in.bottom
            anchors.right: rect_in.right
            anchors.margins: height*0.4
            color: "lightsteelblue"
            border.color: "blue"
            TextEdit {
                id: textDiem
                x: 20; y: 10
                width: inMark.width*0.8;
                height: inMark.height*0.8
                focus: true
                font.pixelSize: 22
                wrapMode: Text.Wrap
                //KeyNavigation.tab: inName
            }
        }
    }

    Rectangle {
        id: rect_Disp
        height: id_root.width/2
        width: height*0.8
        border.color: "red"
        border.width: 4
        anchors.rightMargin: id_root.height/10
        anchors.right: id_root.right
        anchors.bottom: anchors.top
        y: id_root.height/4

        Disp_Mark{
            height: parent.height - 30
            width: parent.width - 30
            anchors.centerIn: parent
        }
    }

    Text {
        id: readMe
        text: qsTr("add     : nhan vao cham tron
delete  : nhan vao muc muon xoa")
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 20
        font.pointSize: 15
    }

}

