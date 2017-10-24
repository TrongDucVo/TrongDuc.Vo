import QtQuick 2.6
import QtQuick.Window 2.2


Item {
    id:root
    visible: true
    width:500
    height:500
    x:0
    y:0
    //    color: "black"
    //content of component of list view
    property int combox_width: 100
    property int combox_height: 40
    property int combox_x:100
    property int combox_y:100
    property string header_name: "ComboBox"
    property variant comboBox_list:["Item1","Item2","Item3","Item4","Item5"]
    property int cur_item: list.currentIndex

    Rectangle{
        id:header
        width:combox_width;height: combox_height
//        anchors.horizontalCenter: root.horizontalCenter
//        anchors.top:root.top
//        anchors.topMargin: 50
        property alias text2: header_text.text
        x:combox_x
        y:combox_y
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //invisible and visible sequentially the list when clich header
                list_frame.visible^=1//list_frame.visible?false:true
                drag.target=header
            }
            drag.target:header
        }
        border.color: "black"
        Text {
            id: header_text
            font.pixelSize: combox_height/2
            anchors.centerIn: parent
            text:header_name
        }

    }


    Rectangle{
        id:list_frame
        width:combox_width
        height: combox_height*3+10
        //            color: window.color
        visible: false
        anchors.top:header.bottom
        anchors.topMargin:0
        anchors.horizontalCenter: header.horizontalCenter
        ListView{
            id:list
//            model: listmodel
            anchors.fill: parent
            delegate: list_element
            spacing: 5
            focus: true
            //                highlight: Rectangle {
            //                    color: 'grey'
            //                }
            highlightFollowsCurrentItem:true
            flickableDirection: Flickable.AutoFlickDirection
            clip:true
        }

        Component{
            id:list_element

            Item{
                //                    property alias x1: option.x
                width: combox_width
                height: combox_height
                Rectangle{
                    id:option
                    width:parent.width
                    height: parent.height
                    color:"white"
                    opacity: 1
                    MouseArea
                    {
                        anchors.fill:parent

                        onClicked:
                        {
                            //                                list_frame.visible=false
                            header_name=e_text.text            //apply content of component to header
                            list.currentIndex = index           //change current item
                        }
                        onReleased: {
                            list_frame.visible=false            //invisible list when releasing
                        }
                        hoverEnabled: true                      //highlight item contain mouse

                        onEntered: option.color="lightblue"
                        onExited: option.color="white"
                    }
                    Text{
                        id:e_text
                        anchors.centerIn: parent
                        font.pixelSize: combox_height/2
                        text:modelData
                    }

                }
            }
        }
        Component.onCompleted: {
            list.model=comboBox_list
        }
    }


}
