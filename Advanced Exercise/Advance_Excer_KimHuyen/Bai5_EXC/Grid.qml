import QtQuick 2.0

Rectangle{
    height: 500
    width: parent.width
    border.color: "green"
    Grid{
        height: parent.height
        width: 400
        rows:6; columns: 7
        spacing: 1

        Repeater{
            model: 31
            Rectangle{
                width: 40
                height: 40
                border.color: "#00CCFF"
                Text {
               //     text: index+2-n
                    text: index
                    font.pointSize: 12
                   // color: (index+2-n>0)?"black":"white"
                }
            }
        }
    }
}
