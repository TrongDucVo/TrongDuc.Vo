import QtQuick 2.6

Rectangle{
    id: root
    width: rec2.width-rec3.width-5
    height: rec2.height*1/5-5
    radius: 5
    color: "#3498db"
    Row{
        Rectangle{
            width: root.width*8/10
            height: root.height
            color: "#00000000"
            Grid{
                spacing: 2
                anchors.centerIn: parent
                columns: 3
                Text {
                    text: "ID"
                    font.pointSize: 12
                }
                Text {
                    text: "Name of Student"
                    font.pointSize: 12
                }
                Text {
                    text: "Student mark"
                    font.pointSize: 12
                }
                Rectangle{
                    width: root.width*1/10
                    height: 50
                    radius: 5
                    TextInput{
                        id: idstudent
                        anchors.fill: parent
                        font.pointSize: 24
                    }
                }
                Rectangle{
                    width: root.width*4/10
                    height: 50
                    radius: 5
                    TextInput{
                        id: name
                        anchors.fill: parent
                        font.pointSize: 24
                    }
                }
                Rectangle{
                    width: root.width*2/10
                    height: 50
                    radius: 5
                    TextInput{
                        id: mark
                        anchors.fill: parent
                        font.pointSize: 24
                    }
                }
            }
        }
        Rectangle{
            width: root.width*2/10
            height: root.height
            color: "#00000000"
            Column{
                spacing: 2
                anchors.centerIn: parent
                Rectangle{
                    width: 100
                    height: 25
                    radius: 5
                    Text {
                        text:"Add"
                        anchors.centerIn: parent
                        font.pointSize: 15
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            studentMarkModel.append({idstuden:idstudent.text,name:name.text,mark:mark.text})
                        }
                        onEntered: {
                            parent.color = "#3498db"
                        }
                        onExited: parent.color = "white"

                    }
                }
                Rectangle{
                    width: 100
                    height: 25
                    radius: 5
                    Text {
                        text:"Update"
                        anchors.centerIn: parent
                        font.pointSize: 15
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                        }
                        onEntered: {
                            parent.color = "#3498db"
                        }
                        onExited: parent.color = "white"

                    }
                }
                Rectangle{
                    width: 100
                    height: 25
                    radius: 5
                    Text {
                        text:"Delete"
                        anchors.centerIn: parent
                        font.pointSize: 15
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            studentMarkModel.remove(listStudentView.currentIndex,1)
                        }
                        onEntered: {
                            parent.color = "#3498db"
                        }
                        onExited: parent.color = "white"

                    }
                }

            }
        }
    }
}
