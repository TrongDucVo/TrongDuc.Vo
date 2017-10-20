import QtQuick 2.0

Rectangle {

    id: root
    signal signal_remove(int index)

    gradient: Gradient {
        GradientStop{position: 0.0; color: "#2c3e50"}
        GradientStop{position: 1.0; color: "#34495e"}
    }

    Text {
        id: txt
        width: 100
        height: parent.height
        color: "#d35400"
        font.pointSize: 10
        text: "Name: " + model.name  +" Address: "+model.address+" Score: "+model.score
    }

    Rectangle {
        id: btnRemove
        width: 30
        height: parent.height
        color: "red"
        anchors.right: parent.right

        MouseArea {
            anchors.fill: parent

            onClicked: {
                signal_remove(model.index)
            }
        }
    }
}
