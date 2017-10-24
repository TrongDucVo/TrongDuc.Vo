import QtQuick  2.0
//import QtQuick.Controls 1.4
//import QtQuick.Window 2.0

Item{
    visible: true
    height: 300
    width: 200
    property ListModel mymodel: ListModel{}
    property alias topic: txt.text
    Rectangle{
        id: rect1
        width: 200
        height: 40
        visible: true
        border.color: "cyan"
        property alias name1: txt.text
        Text{
            id: txt
            text:""
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                rect2.visible ? rect2.visible = false: rect2.visible = true
            }
            hoverEnabled: true
            onEntered: rect1.color = "PowderBlue"
            onExited: rect1.color = "white"
        }
    }
    Rectangle{
        id: rect2
        width: 200
        height: 120
        anchors.top: rect1.bottom
        visible: false
        border.color: "cyan"
        border.width: 1
        ListView{
            id: listview
            model: mymodel
            spacing: 3
            anchors.fill: parent
            clip: true
            delegate: Delegate1{
                onSignal_choose: {
                    rect1.name1 = modelData
                    rect2.visible = false
                }
            }

        }

    }
}
