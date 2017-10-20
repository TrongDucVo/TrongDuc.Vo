import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
Window {

    id:root
    width: 1800
    height: 1000
    visible: true
    color: "#66CCFF"
    title: "List Assignment "

    Text {
        x: 620
        y: 50
        text: qsTr(" ASSIGNMENT DETAIL ")
        color: "blue"
        font.pointSize: 24
        font.bold: true


    }


    Rectangle
    {
        id:rect
        width: 1200
        height: 800
        x: 200
        y:120
        border.color: "#FF99FF"
        border.width: 3
        radius: 20

        Loader{

            id:mainComponent
            width: 1200
            height: 800



        }
    }
    Rectangle{

        x:  1450
        y : 290

        id: list

        width: 220
        height: 415
        border.color: "#FF66FF"
        border.width: 3


        ListModel{

            id: dataModel

            ListElement{

                name:"Connection" ;
                url:"qrc:/Practice1.qml"

            }
            ListElement{

                name:"Timer" ;
                url:"qrc:/Timer.qml"
            }

            ListElement{

                name:"List Model " ;
                url:"qrc:/list_model.qml"
            }


            ListElement{

                name:"Introduce " ;
                url:"qrc:/Intro.qml"
            }
        }


        ListView{


            id: lst
            model:dataModel

            spacing: 18
            anchors.fill :parent
            anchors.centerIn: parent

            delegate: CustomRow2{
                 width: parent.width - 1
                 height: 90



            }








        }




    }

}
