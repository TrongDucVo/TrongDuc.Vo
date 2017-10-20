import QtQuick 2.4

Item {
    id: root
    anchors.fill: parent
    Column{
        anchors.centerIn: parent
        spacing: 2
        Text{
            text: "This is my application the same an phone. Design by tienthanh.pham"
        }
        Text{
            text: "This phone using click."
        }
        Text{
            text: "I will develop it to bester!!!"
        }
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
