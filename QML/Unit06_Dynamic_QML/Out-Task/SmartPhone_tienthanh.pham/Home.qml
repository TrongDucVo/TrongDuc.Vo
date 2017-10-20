import QtQuick 2.4

Rectangle {
    width: 400
    height: 400
    color: "#00000000"
    Clock{}
    Btn_click{
        name: "Menu"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        onClick: {
            mainComponent.source = "qrc:/ListViewMenu.qml"
        }
    }

    Btn_click{
        name: "Quit"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onClick:{
            Qt.quit()
        }
    }
}
