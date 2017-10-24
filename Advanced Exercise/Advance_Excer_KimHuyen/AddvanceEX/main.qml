import QtQuick 2.4
import QtQuick.Window 2.2

Window{
    id:root
    width: 500
    height: 700
    visible: true
    property int  currentIndex : 0


    Rectangle{

        width: parent.width
        height: 120
        color: "white"

          id: tab
        Row{


            width: parent.width
            height: 90
            spacing: 5

            Repeater{

                model:["List","Long Text","ComboBox"]

                Rectangle{

                    width: parent.width/3
                    color: ( index == currentIndex)?"#33CCFF":"#FFCC99"
                    height: 90

                    Text {

                        text: modelData
                        font.pointSize: 18
                        anchors.centerIn: parent


                    }

                    MouseArea{

                        anchors.fill:parent
                        onClicked: {
                            currentIndex = index


                        }

                    }


                }

            }


        }


        Rectangle{
              id: recbottom
              width: parent.width
              height: 30
              color: "#33CCFF"
              anchors.bottom: parent.bottom


          }

    }


    Rectangle{
        id: view
        width: parent.width
        height: parent.height - tab.height
        border.color: "red"

        anchors.bottom: parent.bottom
        Flickable{
            id: flickable

            anchors.fill: parent

            //clip: true
            contentWidth: rect.width

            Rectangle{
                id: rect
                width: view.width*3
                height: parent.height
                Rectangle{

                    id: rect1
                    width: view.width
                    height: parent.height
                    anchors.left: rect.left
                    color: "yellow"

                    List{}


                }
                Rectangle{

                    id: rect2
                    width: view.width
                    height: parent.height
                    anchors.horizontalCenter: rect.horizontalCenter
                    LongText2{}




                }
                Rectangle{
                    id: rect3
                    width: view.width
                    height: parent.height

                    anchors.right: rect.right
                    ComboBox{}

                }
            }

            onMovementEnded: {
                if(contentX < view.width/2) {
                    contentX = 0; currentIndex = 0;
                }
                if(contentX >= view.width/2 && contentX <view.width*3/2){
                    contentX = view.width;
                    currentIndex = 1
                }
                if(contentX >= view.width*3/2) {contentX = view.width*2; currentIndex =2}
            }
        }
    }





}


