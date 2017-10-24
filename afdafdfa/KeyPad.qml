import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
import "Constants.js" as Constants
Window {
    //id : keypad
    width: Constants.screen_width
    height: Constants.screen_height -70
    visible: true
//    Rectangle {
//    id:ex
//    width: 100
//    height: 100
//    color: "blue"
//    anchors.bottom: parent.bottom
//    anchors.bottomMargin: 20
//    }
    Grid{
        id : grid1
        height: parent.height
        width: 400
        rows:4
        columns: 3
        spacing: 2
        y : 100
        x : 100
        Repeater{
            model: 12
            Rectangle{
                width: 100
                height: 65
                color: "gray"
                Text {
                    id:inp
                    text: index+1
                    font.pointSize: 25
                    color: mouGrid.containsMouse?"black":"white"
                    anchors.centerIn: parent
                    // font.bold: true
                }
                MouseArea{
                    id:mouGrid
                    anchors.fill:parent
                    onClicked: {
                        // input.text += inp.text

                    }


                }
            }
        }
    }


}
