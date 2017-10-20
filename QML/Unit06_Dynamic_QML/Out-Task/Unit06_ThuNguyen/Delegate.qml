//Delegate.qml
import QtQuick 2.0
import QtQuick.Controls 1.4

Button{
    id:bt1
    width: parent.width
    height: parent.height/4
    //text: model.name
    onClicked: {
        mainComponent.setSource(model.url)
        //txt.color = "green"
    }
    Text {
        id: txt
        width: parent.width
        height: parent.height/2
        text: model.name
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 16
        color: "Steelblue"
    }
}
