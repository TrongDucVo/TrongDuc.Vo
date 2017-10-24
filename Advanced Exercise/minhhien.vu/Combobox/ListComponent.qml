import QtQuick 2.0
Rectangle{
    id: rec_4
    width: 450
    height: 50
    color: "blue"
    Text{
        anchors.centerIn: parent
        font.pointSize: 15
        text: model.name + "----" + model.color
    }

}
