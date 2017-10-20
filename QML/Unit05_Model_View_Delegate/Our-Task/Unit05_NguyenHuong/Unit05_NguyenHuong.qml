import QtQuick 2.8
import QtQuick.Window 2.2

Item {
    id: root
    width: 600; height: 600
    ListModel {
        id: myModel
        ListElement { name: "Hung"}
        ListElement { name: "Dong"}
        ListElement { name: "Trang"}
        ListElement { name: "Nam"}
        ListElement { name: "Thuy"}
        ListElement { name: "Anh"}
        ListElement { name: "Duong"}
        ListElement { name: "Duc"}
        ListElement { name: "Bac"}
        ListElement { name: "Nhung"}
    }
  /*  Column {
        id: root
        spacing: 2
        Repeater {
            model: myModel
            Rectangle {
                id: rec
                width: root.width
                height: 50
                color: "yellow"
                Text {
                    id: name
                    width: 100
                    height: parent.height
                    text: model.name
                }
                Rectangle {
                    id: remove
                    width: 100
                    height: parent.height
                    color: "blue"
                    anchors.left: name.right
                    MouseArea {
                        anchors.fill: parent
                        onClicked:myModel.remove(model.index)
                    }
                }
                Rectangle {
                    id: append
                    width: 100
                    height: parent.height
                    color: "red"
                    anchors.left: remove.right
                    MouseArea {
                        anchors.fill: parent
                        onClicked: myModel.append({"name":changeName.text})
                    }
                }
            }
        }
    }
*/
   ListView {
        id: myView
        width: 300
        height: parent.height-100
        spacing: 8
        model: myModel
        delegate: Mycustom {
            width: parent.width
            height: 100
            onSignal_remove: {
                myModel.remove(index)
            }
            onSignal_add: {
               myModel.insert(index,{"name":changeName.text})
            }
        }
        header: Rectangle {
            width: parent.width
            height: 100
            color: "Green"
            Text {
                anchors.centerIn: parent
                text: "Danh Sach Ten"
            }
        }
    }

    Rectangle {
        id: control
        anchors.top: myView.bottom
        anchors.margins: 10
        width: parent.width/2
        height: 100
        color: "black"
        Rectangle {
            id: nhapten
            width: parent.width/5
            height: parent.height/5
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 10
            border.color: "blue"
            TextEdit {
                anchors.centerIn: parent
                text: "Nhap ten"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    placeChangeName.visible = true
                    changeName.focus = true
                }
            }
        }
        Rectangle {
            id: quit
            width: parent.width/5
            height: parent.height/5
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 10
            border.color: "blue"
            Text {
                anchors.centerIn: parent
                text: "Quit"
            }
            MouseArea {
                anchors.fill: parent
                onClicked:  Qt.quit()
            }
        }
    }
    Rectangle {
        id: placeChangeName
        visible: false
        width: 100; height: 20
        border.color: "black"
        anchors.left: myView.right
        anchors.top: root.top
        anchors.margins: 100
        TextEdit {
            id: changeName
            anchors.centerIn: parent
            focus: false
        }
    }
    Text {
        id: note
        anchors.top: placeChangeName.bottom
        anchors.left: myView.right
        anchors.margins: 10
        text: "Cick to Nhap Ten--> Viet Ten--->Add (Se dien ngay duoi)
Remove--->Xoa
Quit ---> Dong man hinh"
    }
}
