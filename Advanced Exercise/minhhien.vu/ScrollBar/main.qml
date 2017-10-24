import QtQuick 2.8
import QtQuick.Window 2.2

Window{
    visible: true
    width: 800
    height: 800
    Item{
        width: 800
        height: 800
        x:0
        y:0
        Rectangle{
            id: rec_1
            x:0
            y: 100
            height: 500
            width: 500
            color: "black"
            MouseArea{
                anchors.fill: parent
                onPositionChanged: {
                    if((rec_1.y >= 0) && (rec_1.y <= 500)){
                        rec_2.y = -rec_1.y + 100
                        console.log(rec_1.y)
                        drag.target = rec_1
                        drag.axis = Drag.YAxis
                        drag.minimumY = 0
                        drag.maximumY = 500
                    }
                }
            }
        }
        Rectangle{
            id: rec_2
            anchors.right: parent.right
            color: "black"
            height: 300
            width: 50
            MouseArea{
                anchors.fill: parent
                onPositionChanged: {
                    if((rec_2.y >= 0) && (rec_2.y <= 500)){
                        rec_1.y = -rec_2.y + 100
                        console.log(rec_1.y)
                        drag.target = rec_2
                        drag.axis = Drag.YAxis
                        drag.minimumY = 0
                        drag.maximumY = 500
                    }
                }
            }
        }

    }
}
