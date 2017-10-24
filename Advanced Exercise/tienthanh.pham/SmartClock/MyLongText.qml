import QtQuick 2.0

Item {
    property string myLongText: ""
    Rectangle{
        id: recText
        width: parent.width//-recScroll.width
        height: parent.height
        Flickable{ //Using to control animation of text
            id:flickable
            anchors.fill: parent
            contentHeight: myText.height
            focus:true
            clip:true
            onContentYChanged: {
                timer1.restart()
                recScroll.visible = true
                scrollbar.y = (contentY/contentHeight)*height
            }

            Text{ //This is long text
                id: myText
                width: parent.width
                text: myLongText
                wrapMode: Text.WordWrap
                focus: true
                font.pointSize: 13
                MouseArea{
                    anchors.fill: parent
                }
            }

        }
        Rectangle{ //This long Rectangle contain small scroll bar
            id: recScroll
            width: 10
            visible: false
            height: parent.height
            anchors.left: recText.right
            radius: 5
            opacity: 0.3
            color: "#95a5a6"
            clip: true
            Rectangle { //small scroll bar can animation when text animation
                id: scrollbar
                opacity: 1.3
                radius: 5
                anchors.right: recScroll.right
                width: 10
                height: flickable.visibleArea.heightRatio * flickable.height
                color: "#7f8c8d"
                onYChanged: {
                    if(mouseArea.drag.active)
                    {flickable.contentY = scrollbar.y/flickable.height*flickable.contentHeight
                        if(flickable.contentY<0)flickable.contentY=0
                        if(flickable.contentY>(flickable.height-scrollbar.height)/flickable.height*flickable.contentHeight)flickable.contentY=(flickable.height-scrollbar.height)/flickable.height*flickable.contentHeight
                    }
                }
                MouseArea{ //control drag scroll bar to change position of text
                    id:mouseArea
                    anchors.fill: parent
                    drag.target: scrollbar
                    onPressed: {
                        recScroll.visible = true
                        timer1.stop()
                    }
                    onReleased: {
                        timer1.restart()
                    }
                }
            }
        }

        Timer{ //timer using to visible scroll bar
            id:timer1
            interval: 2000
            onTriggered: recScroll.visible=false
        }
        Rectangle{ //this is border of text
            anchors.fill: parent
            anchors.margins: -10
            border.width: 1
            color: "#00000000"
        }
    }
}
