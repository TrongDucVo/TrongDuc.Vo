import QtQuick 2.6
import QtQuick.Window 2.2


Item {
    property variant colorlist: ["green","blue","#red","purple"]
    id: back_gnd
    width:1000;height:1000
    Rectangle{
        id:rec1

        height: back_gnd.height-200
        width:back_gnd.width/4
        color: colorlist[cl1_index]
        property int cl1_index: 0
        MouseArea{
            anchors.fill:rec1
            onClicked:{
                if(++rec1.cl1_index>3)rec1.cl1_index=0
                rec1.color=colorlist[rec1.cl1_index]
            }
        }
    }
    Rectangle{
        id:rec2
        height: back_gnd.height-200
        width:back_gnd.width/4
        color: "#03A9F4"
        anchors.left:rec1.right
        property int cl2_index: 1
        MouseArea{
            anchors.fill:rec2
            onClicked:{
                if(++rec2.cl2_index>3)rec2.cl2_index=0
                rec2.color=colorlist[rec2.cl2_index]
            }
        }
    }
    Rectangle{
        id:rec3
        height: back_gnd.height-200
        width:back_gnd.width/4
        color: "#F44336"
        anchors.left:rec2.right
        property int cl3_index: 2
        MouseArea{
            anchors.fill:rec3
            onClicked:{
                if(++rec3.cl3_index>3)rec3.cl3_index=0
                rec3.color=colorlist[rec3.cl3_index]
            }
        }
    }
    Rectangle{
        id:rec4
        height: back_gnd.height-200
        width:back_gnd.width/4
        color: "#AB47BC"
        anchors.left:rec3.right
        property int cl4_index: 3
        MouseArea{
            anchors.fill:rec4
            onClicked:{
                if(++rec4.cl4_index>3)rec4.cl4_index=0
                rec4.color=colorlist[rec4.cl4_index]
            }
        }
    }

    Rectangle {
        Rectangle{
            id:relay_l
            width:
            {
                if(relay.x>=rec1.x&&relay.x<rec2.x&&relay.y<back_gnd.height-200)
                {
                    if(relay.x-rec1.x<rec1.width-relay.width) width:relay.width
                    else width:rec1.width-relay.x
                }
                else if(relay.x>rec2.x&&relay.x<rec3.x&&relay.y<back_gnd.height-200)
                {
                    if(relay.x-rec2.x<rec2.width-relay.width) width:relay.width
                    else width:rec2.width-relay.x+rec1.width
                }
                else if(relay.x>rec3.x&&relay.x<rec4.x&&relay.y<back_gnd.height-200)
                {
                    if(relay.x-rec3.x<rec3.width-relay.width) width:relay.width
                    else width:rec3.width-relay.x+rec2.width*2
                }
                 else if(relay.x>rec4.x&&relay.y<back_gnd.height-200)
                {
                    if(relay.x-rec4.x<rec4.width-relay.width) width:relay.width
                    else width:rec4.width-relay.x+rec3.width*3
                }
                else if(relay.y>back_gnd.height-200) width:relay.width
            }
            height: relay.height
            color:{
                if(relay.x>=rec1.x&&relay.x<rec2.x&&relay.y<back_gnd.height-200) color:rec2.color
                else if(relay.x>rec2.x&&relay.x<rec3.x&&relay.y<back_gnd.height-200) color:rec3.color
                else if(relay.x>rec3.x&&relay.x<rec4.x&&relay.y<back_gnd.height-200) color:rec4.color
                else if(relay.x>rec4.x&&relay.y<back_gnd.height-200) color:rec1.color
                else if(relay.y>back_gnd.height-200) color:"#212121"
            }
        }
        Rectangle{
            id:relay_r
            width:relay.width-relay_l.width
            height: relay.height
            color:{
                if(relay.x>=rec1.x&&relay.x<rec2.x&&relay.y<back_gnd.height-200) color:rec1.color
                else if(relay.x>rec2.x&&relay.x<rec3.x&&relay.y<back_gnd.height-200) color:rec2.color
                else if(relay.x>rec3.x&&relay.x<rec4.x&&relay.y<back_gnd.height-200) color:rec3.color
                else if(relay.x>rec4.x&&relay.y<back_gnd.height-200) color:rec4.color
                else if(relay.y>back_gnd.height-200) color:"#212121"
            }

            anchors.left:relay_l.right
        }


        id: relay
        width:100;height:100
        y:back_gnd.height-190
        color:{
            if(relay.x>=rec1.x&&relay.x<rec2.x&&relay.y<back_gnd.height-200) color:rec1.color
            else if(relay.x>rec2.x&&relay.x<rec3.x&&relay.y<back_gnd.height-200) color:rec2.color
            else if(relay.x>rec3.x&&relay.x<rec4.x&&relay.y<back_gnd.height-200) color:rec3.color
            else if(relay.x>rec4.x&&relay.y<back_gnd.height-200) color:rec4.color
            else if(relay.y>back_gnd.height-200) color:"#212121"
        }
        signal iclick()
        signal ipress()
        signal ipressandhold()
        signal irelease()
        function iclick_act()
        { console.log("Click")
            text1.text="Drag me"
        }
        function ipress_act()
        { console.log("Press")
//            if(relay.x>=rec1.x&&relay.x<rec2.x&&relay.y<back_gnd.height-200) relay.color=rec1.color
//            else if(relay.x>rec2.x&&relay.x<rec3.x&&relay.y<back_gnd.height-200) relay.color=rec2.color
//            else if(relay.x>rec3.x&&relay.x<rec4.x&&relay.y<back_gnd.height-200) relay.color=rec3.color
//            else if(relay.x>rec4.x&&relay.y<back_gnd.height-200) relay.color=rec4.color
//            else if(relay.y>back_gnd.height-200) color="#212121"
        }
        function ipressandhold_act()
        { console.log("Press and hold")
            text1.text="Drag me"
        }
        function irelease_act()
        { console.log("Release")
//            relay.color="#212121"
            text1.text="Press me"
        }
        Component.onCompleted: {
            relay.iclick.connect(iclick_act)
            relay.ipress.connect(ipress_act)
            relay.irelease.connect(irelease_act)
            relay.ipressandhold.connect(ipressandhold_act)
        }

        MouseArea{
            anchors.fill:relay
            onClicked:{
                relay.iclick();
            }
            onPressed:{
                relay.ipress();
            }
            onPressAndHold: {
                relay.ipressandhold();
            }
            onReleased: {
                relay.irelease();
            }
            drag.target: relay

        }
        Text{
            id:text1
            anchors.centerIn: relay
            text:"Press me"
            font.pixelSize: 20
            focus:true
            color:"white"
//            MouseArea{
//                anchors.fill: text1
//                onClicked: text1.text=""
//            }
        }
    }
}
