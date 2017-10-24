import QtQuick 2.2
import QtQuick.Window 2.2

Window {
    visible: true
    //ipphone
    width: 400
    height: 600
    //maximumWidth: 400
    //maximumHeight: 600
    title: qsTr("Advanced Exercise")

    ListModel{
        id: lmTopBar
        ListElement{name:"ComboBox";url:"ComboBox.qml"}
        ListElement{name:"LongText";url:"LongText.qml"}
        ListElement{name:"Contact";url:"AZlistcontact.qml"}
        ListElement{name:"CalendarSS";url:"CalendarSS.qml"}
    }

    // Tabview main contains

    ListView {
        id: listTab
        width: 400
        height: parent.height-50
        anchors.top: listview.bottom
        smooth: true
        contentWidth: 2000
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveVelocity: 1000
        model: lmTopBar
        delegate: Loader{
                    source: url
        }
        onCurrentIndexChanged: {
            listview.currentIndex = listTab.currentIndex
        }


    }
    //


    // tabview topbar
    ListView{
        id: listview
        width: parent.width
        height: 50
        orientation: ListView.Horizontal
        model:lmTopBar
        delegate: Rectangle{
            id: delegate
            width: 100
            height: 50
            color: (listview.currentIndex===index) ? "#8e44ad": "#3498db"
            border.color: "#2980b9"
            border.width: 0.5
            radius: 2
            Text {
                anchors.centerIn: parent
                font.pointSize: 13
                text: name
            }
            MouseArea{
                id: mousearea
                anchors.fill: parent
                onClicked: {
                    listTab.contentX = index*400
                    listview.currentIndex = index
                    console.log(listview.currentIndex+" "+index)
                }
            }
        }


    }

}
