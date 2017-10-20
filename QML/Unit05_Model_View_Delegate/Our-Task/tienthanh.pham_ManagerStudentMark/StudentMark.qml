import QtQuick 2.6

Rectangle{
    id: root
    property alias idSt: idStudent.text
    property alias name: nameStudent.text
    property alias mark: markStudent.text
    color: "#00000000"
    Row{
        spacing: 5
        Rectangle{
            width: root.width/10
            height: root.height
            radius: 10
            Text{
                anchors.centerIn: parent
                id: idStudent
                text: idSt
                font.pointSize: 12
            }
        }
        Rectangle{
            width: root.width*7/10
            height: root.height
            radius: 10
            Text{
                anchors.verticalCenter: parent.verticalCenter
                id: nameStudent
                text: name
                font.pointSize: 12
            }
        }
        Rectangle{
            width: root.width*2/10
            height: root.height
            radius: 10
            Text{
                anchors.centerIn: parent
                id: markStudent
                text: mark
                font.pointSize: 12
            }
        }
    }
}
