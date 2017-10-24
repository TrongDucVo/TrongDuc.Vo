import QtQuick 2.0

import QtQuick 2.0

Item {
    id:thelist
    property int quantity: 100                      //number of member of pathview
    property int dele_height: 50                    //width of pathview
    property int dele_x: 200                        //x positon of pathview
    property int dele_y: 200                        //y positon of pathview
    property int path_init: quantity+1              //index of item you want to go
    property alias cur_idx:thePathView.currentIndex //alias current index
    property int cur_val: {                         //get current value of curent item

        if(thePathView.currentIndex==quantity-1) 1+dele_offset;
        else thePathView.currentIndex+2+dele_offset;
    }

    property int dele_offset: 0                     //offset you want to start path view offset->quantity instead of 1->quantity
    property bool isMonth: false                    //month is special cause display name of month
    signal sendMsg
    Component {
        id: delegate
            Text {
                property variant monthName: ["Jan","Feb","Mar","Apr","May","Jun","July","Aug","Seb","Oct","Nov","Dec"]
                id: nameText
                //content is in each component of pathview
                text: {
                    if(isMonth)
                    monthName[index+dele_offset]
                    else index+1+dele_offset
                }
                font.pointSize: 16
                //hightlight the middle of pathview
                color: {
                    if(index==(thePathView.currentIndex+1)) "red"
                    else if(thePathView.currentIndex==(thelist.quantity-1)&&index==0)  "red"
                    else "black"

                }
            }
//        }
    }
    Rectangle{
        id:window
        width: 50
        height: 150
        x:thelist.dele_x
        y:thelist.dele_y
        color:"yellow"
        gradient: Gradient {
                GradientStop { position: 0.0; color: "#2c3e50" }
                GradientStop { position: 0.5; color: "white" }
                GradientStop { position: 1.0; color: "#2c3e50" }
            }
        PathView {

            id:thePathView
            anchors.fill:parent
            //        anchors.left: parent.left
            model: thelist.quantity
            delegate: delegate
            path: Path {
                id:thePath
                startX: 25; startY: 22
                //            PathQuad { x: 120; y: 25; controlX: 260; controlY: 75 }
                //cal y in pathline to get spacing is 0
                PathLine { x:25; y: thePath.startY+ thelist.quantity*thelist.dele_height}
            }
            clip:true
            onMovementEnded:
            {
//                console.log(thePathView.currentIndex)
                thelist.sendMsg();
            }
            interactive :true
        }
    }
    Component.onCompleted: {
        //init current item of pathview
        thePathView.currentIndex=thelist.path_init-2-dele_offset
        console.log(thelist.cur_val)
    }

}
