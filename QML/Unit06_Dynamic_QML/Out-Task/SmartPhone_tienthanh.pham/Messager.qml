import QtQuick 2.4

Item {
    id: root
    anchors.fill: parent
Text{
    text:"This is messager of phone, I will improve it later!"
    anchors.centerIn: parent
}
    Btn_click{
        name: "Back"
        anchors.right: root.right
        anchors.bottom: root.bottom
        onClick:{
            mainComponent.source = "ListViewMenu.qml"
        }
    }

}
