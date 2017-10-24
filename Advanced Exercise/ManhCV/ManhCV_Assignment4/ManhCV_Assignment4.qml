import QtQuick 2.6
import QtQuick.Window 2.2


Window{
    id:window
    width:600;height:800
    Rectangle{
        id:image
        width:200
        height:80
        border.color:"black"
        radius:10
        color:"#00ff33"
        Text{
            id:imagetext
            text:"Image"
            font.pixelSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea{
            anchors.fill: image
            onClicked: {
                image.color="#00ff33"
                music.color="grey"
                empty.color="grey"
                flickablearea.contentX=imageScreen.x
            }
        }
    }
    Rectangle{
        id:music
        width:200
        height:80
        border.color:"black"
        color:"grey"
        radius:10
        anchors.left:image.right
        Text{
            id:musictext
            text:"Music"
            font.pixelSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea{
            anchors.fill: music
            onClicked: {
                music.color="#00ff33"
                image.color="grey"
                empty.color="grey"
                flickablearea.contentX=musicScreen.x
            }
        }
    }
    Rectangle{
        id:empty
        width:200
        height:80
        border.color:"black"
        color:"grey"
        radius:10
        anchors.left:music.right
        Text{
            id:emptytext
            text:"Empty"
            font.pixelSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea{
            anchors.fill: empty
            onClicked: {
                image.color="grey"
                music.color="grey"
                empty.color="#00ff33"
                flickablearea.contentX=emptyScreen.x
            }
        }
    }
    Rectangle{
        id:screen
        y:100
        width:parent.width;height:700
        Flickable{
            id:flickablearea
            anchors.fill: screen
            flickableDirection: Flickable.HorizontalFlick
            contentWidth: 600*3
            clip:true
            Rectangle{
                id:imageScreen
                width:600;height:700
//                anchors.fill: parent
                Image {
                    id: car
                    source: "seasight.jpg"
//                    anchors.fill: parent
                    width:600;height:700
                }
            }
            Rectangle{
                id:musicScreen
                width:600;height:700
                anchors.left:imageScreen.right
                Image {
                    id: musicboard
                    source: "music.PNG"
                    width:600;height:700
                    anchors.fill: parent
                }
            }
            Rectangle{
                id:emptyScreen
                width:600;height:700
                anchors.left: musicScreen.right
                Text{
                    text:"This tab is empty!"
                    font.pixelSize: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            onContentXChanged:  {
                if(flickablearea.contentX==imageScreen.x){
                    image.color="#00ff33"
                    music.color="grey"
                    empty.color="grey"
                }
                if(flickablearea.contentX==musicScreen.x){
                    music.color="#00ff33"
                    image.color="grey"
                    empty.color="grey"
                }
                if(flickablearea.contentX==emptyScreen.x){
                    empty.color="#00ff33"
                    music.color="grey"
                    image.color="grey"
                }
            }
        }
    }
}
