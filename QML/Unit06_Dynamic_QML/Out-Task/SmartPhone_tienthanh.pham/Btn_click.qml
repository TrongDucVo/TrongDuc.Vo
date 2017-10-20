import QtQuick 2.6

Rectangle{
    id: root
    property string name: btnString.text
    signal click()
    height: 50
    width: parent.width/2
    color: "#bdc3c7"
    Loader{

    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            root.click()
        }
        onEntered: root.color = "#7f8c8d"
        onExited: root.color ="#bdc3c7"
    }
    Text{
        id: btnString
        anchors.centerIn: parent
        text:name
    }
}
