import QtQuick 2.4


Item {
    id: root
    width: 400
    height: 350
    y:50
    ListModel {
        id: contactModel
        ListElement {
            name: "PHAM TIEN THANH"
            number: "1234567890"
        }
        ListElement {
            name: "NGUYEN THI HOAI THU"
            number: "1234567890"
        }
        ListElement {
            name: "NGUYEN VAN DUNG"
            number: "1234567890"
        }
    }

    Component {
        id: contactDelegate
        Item {
            width: 400; height: 40
            Column {
                Text { text: '<b>Name:</b> ' + name }
                Text { text: '<b>Number:</b> ' + number }
            }
        }
    }

    ListView {
        anchors.fill: parent
        model: contactModel
        delegate: contactDelegate
    }
    Btn_click{
        name: "Back"
        anchors.right: root.right
        y:300
        onClick:{
            mainComponent.source = "ListViewMenu.qml"
        }
    }
}

