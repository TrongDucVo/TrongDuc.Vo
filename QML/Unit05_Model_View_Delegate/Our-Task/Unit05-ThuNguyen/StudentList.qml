//StudentList.qml
import QtQuick 2.0
import QtQuick.Controls 1.4

//color: "steelblue"
Rectangle{

    id: root
    signal signal_remove(int index)
    Row{
        spacing: 3
        Student{
            id: student
            identity1: model.identity
            name1: model.name
            math1: model.math
            literature1: model.literature
            english1: model.english
        }

        Rectangle{
            id: btnRemove
            width: 100
            height: 30
            color:"red"
            Text{
                anchors.fill: parent
                text:"Delete"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    signal_remove(model.index)
                }
            }
        }
    }


}

