import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
import "Constants.js" as Constants
Item {

    ListModel{
        id:home
        ListElement{name:"Favorites"}
        ListElement{name:"Keypad"}
        ListElement{name:"Recents"}
        ListElement{name:"Contacts"}
        ListElement{name:"Phones"}
    }
    Row{
        id:rowhome
        Repeater{
            id : rc12
            model: home
            Rectangle{
                id:recthome
                color: "black"
                width: Constants.screen_width/5
                height: Constants.status_bar_height
                Text {
                    id: texthome
                    width: parent.width
                    height: parent.height
                    text: model.name
                    x:38
                    y: 15
                    font.pointSize: 20
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:
                    { if( index == 0)
                            lightwork.x = 0
                        if(index == 1)
                            lightwork.x = Constants.screen_width/5
                        if(index == 2)
                            lightwork.x = Constants.screen_width*2/5
                        if(index == 3)
                            lightwork.x = Constants.screen_width*3/5
                        if(index == 4)
                            lightwork.x = Constants.screen_width*4/5
                    }
                }
            }
        }

    }

    Row {
        id:rowhome2
        spacing: 158
        x : 158
        Repeater{
            model: 4
            Image {
                id: image1
                y: 20
                source: "images/statusbar_timetemp_separator.png"
            }
        }
    }

    Image {
        id: image2
        source: "images/function_separator_phone.png"
        y : Constants.status_bar_height
        x:4
    }
    Rectangle{
        id:lightwork
        width: 160
        height: 2
        color: "blue"
        anchors.top: image2.top
    }

    Rectangle{
        id:favorites
        width: Constants.screen_width
        height: Constants.status_bar_y -70
        color: "gray"
        Text {
            id: txt1
            text: qsTr("text in put")
            anchors.centerIn: parent
            font.pointSize: 20
        }
        anchors.top: image2.bottom
    }
}





