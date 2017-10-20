import QtQuick 2.6
import QtQuick.Window 2.2

Item{
    property int cnt_col: 3
    id:item
    width:1000;height:1000
    Rectangle{
        id:background
        width:800;height:800
        color:"#937241"
        anchors.fill:parent

    }
    Rectangle{
        id:chart_gnd
        width:700;height:500
        color:"#937241"
        anchors.centerIn:parent
        border.color: "black"

    }
    Rectangle{
        id:button_plus
        width:100;height:50
        color:"white"
        anchors{
            left:background.left
            leftMargin: 20
            top:background.top
            topMargin: 20
        }
        Text{
            anchors.centerIn: button_plus
            text:"Add column"
        }
    }
    Rectangle{
        id:refresh
        width:100;height:50
        color:"white"
        anchors{
            left:button_plus.right
            leftMargin: 20
            top:button_plus.top
        }
        Text{
            anchors.centerIn: refresh
            text:"Refresh"
        }
        MouseArea{
            id:refresh_click
            anchors.fill: parent
            onClicked: {
                column1.height=parseInt(val1.text.toString())
                column2.height=parseInt(val2.text.toString())
                column3.height=parseInt(val3.text.toString())
            }
        }
    }
    Row{
        id:chart
        spacing:35
        anchors{
            left:chart_gnd.left
            leftMargin: 50
            bottom:chart_gnd.bottom
            bottomMargin: 0
        }
        Rectangle {
            width:40; height: 450; id:column1;
            color:"red"
//            anchors.bottom:chart_gnd.bottom
            TextInput{
                anchors{
                    left:column1.left
                    top:column1.bottom
                    topMargin: 20
                }
                text:"Text1"
                focus:true
            }
            TextInput{
                id:val1
                anchors{

                    bottom:column1.top
                    bottomMargin: 10
                    horizontalCenter:column1.horizontalCenter
                }
                text:column1.height
                focus:true
            }
        }
        Rectangle {
            width:40; height: 300; id:column2;
            color:"blue"
            anchors.bottom: column1.bottom
            TextInput{
                anchors{
                    left:column2.left
                    top:column2.bottom
                    topMargin: 20
                }
                text:"Text1"
                focus:true
            }
            TextInput{
                id:val2
                anchors{

                    bottom:column2.top
                    bottomMargin: 10
                    horizontalCenter:column2.horizontalCenter
                }
                text:column2.height
            }


        }
        Rectangle {
            width:40; height: 200; id:column3;
            color:"yellow"
            anchors.bottom: column1.bottom
            TextInput{
                anchors{
                    left:column3.left
                    top:column3.bottom
                    topMargin: 20
                }
                text:"Text1"
                focus:true
            }
            TextInput{
                id:val3
                anchors{

                    bottom:column3.top
                    bottomMargin: 10
                    horizontalCenter:column3.horizontalCenter
                }
                text:column3.height
            }
        }

    }



}
