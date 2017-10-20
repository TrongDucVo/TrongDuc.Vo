import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    id: win
    height: 600
    width: 800
    //maximumHeight: height
    //maximumWidth: width

    ListModel {
        id: modeldata
        ListElement {name: "hieu"; sco: "5"}
        ListElement {name: "truong"; sco: "6"}
        ListElement {name: "tung"; sco: "4"}
        ListElement {name: "trang"; sco: "7"}
        ListElement {name: "hien"; sco: "9"}
        ListElement {name: "tuan"; sco: "2"}
        ListElement {name: "tho"; sco: "10"}
        ListElement {name: "kien"; sco: "13"}
    }

    ListView{
        model: modeldata
        clip: true
        anchors.fill: parent
        anchors.leftMargin: win.height/8
        spacing: win.height/12

        delegate: Custum {
            width: parent.width*0.9
            height: win.height/6
            //color: "green"
            border.color: "green"
            border.width: 5
            onSignal_remove: {
                modeldata.remove(model.index)
            }
        }
    }

    Touch {}
}
