import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {
    id: window
    visible: true
    width: parent.width
    height: parent.height
    property int currentIndex:0
    Row{
        id: tab
        width: parent.width
        height: 100
        spacing: 3
        Repeater{
            model: ["Combobox","Long text","Calendar"]
            Rectangle{
                width: parent.width/3
                height: 100
                color: (index == currentIndex)?"green":"grey"
                border.width: 1
                Text{
                    text: modelData
                    font.pointSize: 16
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        currentIndex = index;
                        flickable.contentX = view.width*index;

                    }
                }
            }
        }
    }
    Rectangle{
        id: line
        width: parent.width
        height: 10
        y: tab.height-1
        color: "green"
    }


    Rectangle{
        id: view
        width: parent.width
        height: parent.height - tab.height - line.height
        anchors.top: line.bottom
        border.color: "red"

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
                    ListModel{
                        id:datamodel
                        ListElement{name:"Monday"}
                        ListElement{name:"Tuesday"}
                        ListElement{name:"Wednesday"}
                        ListElement{name:"Thursday"}
                        ListElement{name:"Friday"}
                        ListElement{name:"Saturday"}
                        ListElement{name:"Sunday"}
                    }
                    Mycombobox{
                    topic: "Date"
                    mymodel: datamodel
                    }
                }
                Rectangle{
                    id: rect2
                    width: view.width
                    height: parent.height
                    color:"green"
                    anchors.horizontalCenter: rect.horizontalCenter
                    Longtext{}
                }
//                Rectangle{
//                    id: rect3
//                    width: view.width
//                    height: parent.height
//                    color:"blue"
//                    anchors.left: rect2.right
//                    SortedList{}
//                }
                Rectangle{
                    id: rect4
                    width: view.width
                    height: parent.height
                    color:"blue"
                    anchors.right: rect.right
                    Calendar{}
                }
            }
            onContentXChanged: console.log(contentX)
            onMovementEnded: {
                if(contentX < view.width/2) {
                    contentX = 0; currentIndex = 0;

                }
                if(contentX >= view.width/2 && contentX <view.width*3/2){
                    contentX = view.width;
                    currentIndex = 1
                }
                if(contentX >= view.width*3/2&& contentX <view.width*5/2) {contentX = view.width*2; currentIndex =2}
                //if(contentX >= view.width*5/2) {contentX = view.width*3; currentIndex =3}
            }
        }
    }
}
