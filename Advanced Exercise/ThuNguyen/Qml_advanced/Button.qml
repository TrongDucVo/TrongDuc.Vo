import QtQuick 2.0

Rectangle {
    id: root
    property alias text: txt.text
    property alias txt_color: txt.color
    property alias txt_size: txt.font.pointSize
    color: "#FFFFFF"
    Text{
        id:txt
        anchors.fill: parent
        text:""
        Text.AlignHCenter: parent.horizontalCenter
        Text.AlignVCenter: parent.verticalCenter
    }
    function changecolor(){

    }
    Timer{
        interval: 500;
        running: true;
        repeat: false;
        onTriggered: {
            root.color = "#CCFFFF"
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {

        }
    }
}
