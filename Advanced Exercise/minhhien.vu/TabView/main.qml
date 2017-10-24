import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 550
    height: 800
    maximumHeight: height
    maximumWidth: width

    Row{
        id: row
        height: 50
        width: 550
        spacing: 5
        Rectangle{
            id: rowRec_1
            color: "black"
            height: 50
            width: 180
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    rec.x = 20
                    rowRec_1.color = "black"
                    rowRec_2.color = "blue"
                    rowRec_3.color = "blue"
                }
            }
        }
        Rectangle{
            id: rowRec_2
            color: "blue"
            height: 50
            width: 180
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    rec.x = -527
                    rowRec_1.color = "blue"
                    rowRec_2.color = "red"
                    rowRec_3.color = "blue"
                }
            }
        }
        Rectangle{
            id: rowRec_3
            color: "blue"
            height: 50
            width: 180
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    rec.x = -1075
                    rowRec_1.color = "blue"
                    rowRec_2.color = "blue"
                    rowRec_3.color = "green"
                }
            }
        }
    }

    Rectangle{
        id: rec
        x: 20
        y: 100
        height: 500
        width: 1600
//        border.color: "black"
        MouseArea{
            anchors.fill: parent

            onPositionChanged: {
                console.log(rec.x)
                drag.target = rec
                drag.axis = Drag.XAxis
                drag.target = rec
                drag.maximumX = 100
                drag.minimumX = -1100
            }
            onReleased: {
                if((rec.x > -260)){
                    rec.x = 20
                    rowRec_1.color = "black"
                    rowRec_2.color = "blue"
                    rowRec_3.color = "blue"
                }

                if((rec.x < -260 && (rec.x > -820))){
                    rec.x = -527
                    rowRec_1.color = "blue"
                    rowRec_2.color = "red"
                    rowRec_3.color = "blue"
                }
                if((rec.x < -820)){
                    rec.x = -1075
                    rowRec_1.color = "blue"
                    rowRec_2.color = "blue"
                    rowRec_3.color = "green"
                }
            }
        }
        Rectangle {
            id: rec_1
            x: 0
            y: 0
            width: 500
            height: 500
            color: "black"
        }
        Rectangle {
            id: rec_2
            x: 550
            y: 0
            width: 500
            height: 500
            color: "red"
        }
        Rectangle {
            id: rec_3
            x: 1100
            y: 0
            width: 500
            height: 500
            color: "green"
        }
    }
}
