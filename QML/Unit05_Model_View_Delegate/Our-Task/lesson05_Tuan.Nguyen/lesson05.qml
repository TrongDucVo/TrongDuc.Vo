import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    id:root
    width: 1000
    height: 1000
    //color: "#f6f6f6"
    gradient: Gradient {
        GradientStop { position: 0.0; color: "black" }
        GradientStop { position: 1.0; color: "white"}
    }
    TextInput{
        anchors.horizontalCenter: root.horizontalCenter
        anchors.top:root.top
        anchors.topMargin: 20
        text:"PHẦN MỀM QUẢN LÝ SINH VIÊN"
        color:"yellow"
        font.pixelSize: 40
    }

    ListModel {
        id: theModel

        ListElement { Name: "Nguyen Duc Tuan";no:1;mark:"10" }
        ListElement { Name: "Nguyen Hoang Nam";no:2;mark:"9" }
        ListElement { Name: "Ngo Trong Hieu";no:3;mark:"8" }
    }
    ListView {
        id:list
        width:500
        height: 500
        x: 380
        y:150
//        anchors.horizontalCenter: parent.horizontalCenter
        model: theModel
        delegate: numberDelegate
//        header: numberDelegate
        spacing: 5
        focus: true
    }
    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20

        height: 40

        color: "#53d769"
        border.color: Qt.lighter(color, 1.1)

        Text {
            anchors.centerIn: parent

            text: "Add student"
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                theModel.append({Name:"Name",mark:"?"});
            }
        }

        property int count: 9
    }

    Component {
        id: numberDelegate
        Item {
            Rectangle {
                id: delete_box
                width: 40
                height: 40
                anchors.left: markbox.right
                anchors.leftMargin: 10
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#f8306a" }
                    GradientStop { position: 1.0; color: "#fb5b40" }
                }

                Text {
                    anchors.centerIn: delete_box
                    focus:true
                    font.pixelSize: 20

                    text: "X"
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                            theModel.remove(index);
                    }
                }
            }

            id: studen_info
            width: 500
            height: 40
            Rectangle {
                id: namebox
                width: 200
                height: 40

                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#f8306a" }
                    GradientStop { position: 1.0; color: "#fb5b40" }
                }

                TextInput {
                    id:name_input
                    anchors.centerIn: namebox
                    focus:true
                    font.pixelSize: 20
                    text: Name
                }
            }
            Rectangle {
                id: nobox
                width: 40
                height: 40
                anchors.right: namebox.left
                anchors.rightMargin: 10
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#f8306a" }
                    GradientStop { position: 1.0; color: "#fb5b40" }
                }

                Text {
                    anchors.centerIn: nobox

                    font.pixelSize: 20

                    text: index
                }
            }
            Rectangle {
                id: markbox

                width: 50
                height: 40
                anchors.left: namebox.right
                anchors.leftMargin: 10
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#f8306a" }
                    GradientStop { position: 1.0; color: "#fb5b40" }
                }

                TextInput {
                    anchors.centerIn: markbox
                    font.pixelSize: 20
                    text: mark
                }

            }
        }
    }
}
