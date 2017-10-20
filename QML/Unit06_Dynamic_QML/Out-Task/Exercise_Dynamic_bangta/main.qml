import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1500
    height: 1000
    title: qsTr("Dynamic")
    property int color: green
    Rectangle{
        id: rect1
        x:100
        width: 600; height: 500
        Loader{
            id: loader
            active: true
        }
    }
    Rectangle{
        id: rect2
        x:0
        width: 60
        height: parent.height
    ListModel{
        id: dataModel
        ListElement{name:"1";url: "qrc:/unit01.qml"; status: "Quick Starter" }
        ListElement{name:"2";url: "qrc:/Parrallel_Car_Bangbang.qml"; status: "Fluid Element"}
        ListElement{name:"3";url: "qrc:/qml_signal_slot.qml"; status: "Connection"}
        ListElement{name:"4";url: "qrc:/Timer_Clock_bangta.qml"; status: "Timer"}
        ListElement{name:"5";url: "qrc:/main_bai5.qml"; status: "Model View Delegate"}

    }
    ListView{
        id: listView
        model: dataModel
        width: 100; height: parent.height
        spacing: 6
        delegate: CustomRow {
            width: parent.width; height: 100
            //color: "green"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    loader.source = model.url
                }
            }

        }
    }
    }

}
