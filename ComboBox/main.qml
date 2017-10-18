import QtQuick 2.6
import QtQuick.Controls 1.2
import QtQuick.Window 2.2



ApplicationWindow {
    id: window1
    visible: true
    title: "Demo"

    color: "#00ff99"
    width: 600
    height: 800
    ListModel{
        id:combo
        ListElement{ name: "Car"}
        ListElement{ name: "Moto"}
        ListElement{ name: "Boat"}

    }
   Item{
       id : listcombo
       width: 200
       height: 50

       x: window1.width/2
       y: 100
       Loader{

       }
    }
   Component{
       id:compo_load
       Column{
        id:columnbox
        Repeater{
            model: combo
            Rectangle{
                id : rect
                width:60
                height: 40
                color: "gray"

                Text {
                    id: text1
                    text: model.name
                    width: parent.width
                    height: 40
                    color: "#0066ff"
                    font.pointSize: 10
                    anchors.horizontalCenter: rect.horizontalCenter
                }
            }
        }
       }
    }
   }


