import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {

    id:root
    visible:true
    width:200
    height:400
    Image {
        id: bgnd
        anchors.fill:parent
        source: "download.jpg"
    }
    Loader{
        id:mainComponent
        anchors.margins: 100
        active:true
        onLoaded: {
//            console.log(root.height)
            root.width=mainComponent.item.width
            root.height=mainComponent.item.height
            menu.visible=true
        }
    }
    ListModel{
        id:theModel
        ListElement{url:"lesson03.qml";name:"Game"}
        ListElement{url:"lesson04.qml";name:"Đồng hồ"}
        ListElement{url:"lesson05.qml";name:"QLSV"}


    }
    Rectangle{
        id:back_gnd
        width:200
        height: 400
        opacity: 0
    }

    ListView{
        id:list
        width:80
        height: 500
        anchors.horizontalCenter: back_gnd.horizontalCenter
        model: theModel
        delegate: numberDelegate
        spacing: 5
        focus: true

    }
    Component{
        id:numberDelegate
        Button{
            id:btn
            width:80
            height: 40
            text: name
            onClicked: {
                mainComponent.active=true
                mainComponent.setSource(url)
                list.visible=false
                menu.visible=true
            }
//            MouseArea{
//                anchors.fill: parent
//                drag.target: btn
//                onClicked: {
//                    mainComponent.active=true
//                    mainComponent.setSource(url)
//                    list.visible=false
//                    menu.visible=true
//                }
//            }
        }
    }
    Button{
        id:menu
        width:80
        height:40
        anchors.left:root.right
//        anchors.leftMargin: 5
        text:"Menu"
        onClicked: {
//            console.log(root.width)
            mainComponent.active=false
            root.width=200
            root.height=400
            menu.visible=false
            list.visible=true
        }
        visible: false
    }

}
