import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    visible: true
    width:1500; height:1000
    Image{
        id: background
        anchors.fill: parent
        source:"background.jpg"
    }
    ListModel{
        id: listhomework
        ListElement{name:"Unit1_Connection"}
        ListElement{name:"Unit2_Signal&Slots"}
        ListElement{name:"Unit3_Model-View-Delegate"}
    }
    ListView{
        id:listview
        anchors.fill: parent
        model:listhomework
        clip:true
        spacing:5
        delegate: homework_delegate
        header:header
        //highlight: highlightcomponent

    }
    Component{
        id:header
        Rectangle {
            id: recheader
            width: 350
            height: 80
            color:"#A6ED8E"
            radius: 10
            anchors.right: parent.right
            //anchors.verticalCenter: parent.verticalCenter
            Text{
                text: "Danh sach bai tap"
                anchors.centerIn: recheader
                font.pixelSize: 25
            }
        }
    }
    Component{
        id: homework_delegate
        Rectangle{
            id: recdelegate
            width: 350
            height: 80
            anchors.right: parent.right
            //anchors.verticalCenter: parent.verticalCenter
            color:"#8fbaf3"
            radius:10
            Text{
                id: ten_bai
                anchors.centerIn: recdelegate
                text: model.name
                font.pixelSize: 25
            }
            MouseArea{
            anchors.fill: parent
            onClicked: {
                if(index==0){
                loader.setSource("qrc:/Bai1.qml")
                }
                if(index==1){
                loader.setSource("qrc:/Bai2.qml")
                }
                if(index==2){
                loader.setSource("qrc:/Bai3.qml")
                }


            }
        }
    }
    }
    Loader{
        id: loader
    }


}

