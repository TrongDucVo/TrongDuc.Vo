//CalendarObject.qml for Calendar
import QtQuick 2.0

Rectangle{
    id: root
    width: parent.width/3
    height: parent.height
    property var mymodel: value;
    property int curIndex: 1
    property int object ;
    property int startNumber: 0;
    property int xStart;
    property int yStart;
    property int xEnd;
    property int yEnd;
    property alias myindex: listview.currentIndex
    PathView {
        id: listview
        width: 180; height: 300
        Component {
            id: delegate
            Rectangle {
                id: wrapper
                width: 180
                height: listview.height/3
                Text {
                    id: txt
                    text: {
                        if(object ==1) return modelData
                        else return index+startNumber
                    }
                    color: (index==myindex+1)? "red":"black";
                    font.pointSize: 18
                    anchors.centerIn: parent
                }
            }
        }
        model: mymodel
        delegate: delegate
        focus: true
        clip: true
        path: Path {
            startX: xStart; startY: yStart
            PathLine { x: xEnd; y: yEnd}
        }
        onMovementEnded:{
            if((object !=1)&&currentIndex == mymodel-1){curIndex = 0}
            else if((object==1)&&currentIndex==11){curIndex = 0}
            else curIndex = currentIndex+1
            //ctrlindex()
        }
    }
}

