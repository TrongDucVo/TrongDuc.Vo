import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    property int count: 0
    Text {
        id: text_1
        text: qsTr("Volume Mixer-You can click buttons Up, Down or click on ajust button to change Volume")
    }
    Rectangle{
        id: rec_1
        x: 270
        y: 12
        height: 400
        width: 100

        Rectangle{
            id: rec_2
            x: 27
            y: 48
            height: 330
            width: 30
            border.color: "black"

        }
        Rectangle{
            id: rec_3
            x: 27
            y: 358
            border.color: "black"
            height: 20
            width: 30
            Text {
                anchors.centerIn: parent
                id: text_2
                text: 119-Math.floor((rec_3.y/3))
            }
            MouseArea{
                id: mousearea2
                x: 80
                anchors.fill: parent
                drag.target: rec_3
                drag.axis: Drag.YAxis
                drag.maximumY: rec_2.height
                drag.minimumX: rec_2.y + height
                onPressAndHold:{

                    console.log("hold")
                }
                onReleased: {
                    print(rec_3.y)
                }
            }
        }
    }
    Button{
        id: btn_2
        x: 160
        y: 362
        width: 80
        height: 50
        flat: true
        highlighted: true
        text:"Up"
        onClicked: {
            if(rec_3.y >= 0){
                rec_3.y -= 3
                count +=1
            }
        }
    }
    Button{
        id: btn_1
        x: 400
        y: 362
        width: 80
        height: 50
        flat: true
        highlighted: true
        text: "Down"
        onClicked: {
            if(rec_3.y >= 0){
                rec_3.y += 3
                count -=1
            }
        }
    }
}
