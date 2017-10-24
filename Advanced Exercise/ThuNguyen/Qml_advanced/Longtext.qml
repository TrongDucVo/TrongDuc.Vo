import QtQuick 2.6
//import QtQuick.Window 2.2

Rectangle {
    visible: true
    width: parent.width
    height: parent.height
    property alias mytext: txt.text
    //property alias : value

    Column{
        width:parent.width
        height: parent.height
        Rectangle{
            height: parent.height/7
            width: parent.width
            border.color: "red"
            //color: ""
            Text {
                id: topic
                text: "Long text"
                width: parent.width
                color:"black"
                font.pointSize: 24
                wrapMode: Text.WordWrap
            }
        }
        Rectangle{
            width:parent.width
            height: parent.height*6/7
            Flickable{
                id: flickable
                anchors.fill: parent
                contentHeight: txt.height
                clip: true
                Text1{
                    id: txt
                    width: parent.width
                    color: "black"
                    font.pointSize: 12
                    wrapMode: Text.WordWrap

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            bar.visible=true
                            timer.running=true
                        }
                    }
                }
                onFlickEnded: {timer.running = true}
                onContentYChanged: {
                    if(!mouse.drag.active) {scrollbar.y = flickable.visibleArea.yPosition * flickable.height;}
                }
            }
            Rectangle{
                id: bar
                anchors.right: flickable.right
                height: parent.height
                visible: false
                Rectangle {
                    id: scrollbar
                    anchors.right: parent.right
                    //y: flickable.visibleArea.yPosition * flickable.height
                    width: 10
                    height: flickable.visibleArea.heightRatio * flickable.height
                    color: "black"
                    onYChanged: {
                        bar.visible = true;
                        if(mouse.drag.active){
                            flickable.contentY = scrollbar.y/flickable.height*flickable.contentHeight;
                            timer.running = false;
                        }
                        //else timer.restart()
                    }
                    MouseArea{
                        id: mouse
                        anchors.fill: parent
                        drag.target: scrollbar
                        drag.axis: Drag.YAxis
                        drag.minimumY: 0
                        drag.maximumY: bar.height-100
                        onReleased: {
                            timer.restart()
                        }
                    }
                }
            }
            Timer{
                id: timer
                interval: 2000; running: false; repeat: false
                onTriggered: {
                    bar.visible = false
                }
            }
        }
    }
}
