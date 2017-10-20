import QtQuick 2.8
import QtQuick.Window 2.2
Item {
    id: item1
    height: 49
    width: 190
    visible: true
    property int count: 100
    Rectangle {
        id: main
        x: 1
        y:1
        width: 190
        height: 48
        //border.color: "red"
        Text {
            id: text1
            anchors.centerIn: parent
            width: 180
            height: 40
            color: "red"
            visible: false
            font.pointSize: 20
            text: "Time Out"
        }
        Text{
            id: text2
            visible: true
            anchors.centerIn: parent
            text: "" + count

        }
    }
    Item {
        id: item2
        anchors.fill: parent
        focus: true
        state: "On"
        Keys.onSpacePressed:onSpacePress()
    }
    Timer {
        id: timer1
        interval: 50
        repeat: true
        running: false
        triggeredOnStart: false
        onTriggered: {
            onSpacePress()
            display()
        }
    }
    function onSpacePress(){
        if((item2.state == "Off") && (item1.visible == true)){
            if(count > 0){
                item2.state ="On"
                timer1.start()
                count -= 1
            }
            else{
                count-=0
            }
        }
        else{
            item2.state = "Off"
            count -= 0
        }
    }
    function display(){
        if (count == 0){
            text1.visible = true
            text2.visible = false
        }
        else{
            text1.visible = false
        }
    }
}
