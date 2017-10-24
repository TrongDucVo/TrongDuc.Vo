import QtQuick 2.0

Item {
    id: root
    property int currentIndex: 0
    property var myModel: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    property int typeModel: 1
    property int dataDateTime: {
        if(typeModel === 0) return currentIndex+1
        if(typeModel === 1) return currentIndex+1
        if(typeModel === 2) return currentIndex+1970
    }

    Rectangle{
        anchors.fill: parent
        clip:true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#7f8c8d" }
            GradientStop { position: 0.5; color: "white" }
            GradientStop { position: 1.0; color: "#7f8c8d" }
        }
        border.width: 1
        Flickable{
            id: flickable
            height: root.height/3
            width: root.width
            y:root.height/3

            contentHeight: (myRepeater.count+2)*(flickable.height)
            onContentYChanged: {
                currentIndex = Math.round(contentY/flickable.height)
            }
            onMovementEnded: { //When stop movement
                flickable.state = 'home'
                flickable.state = 'nearNumber'
                if(contentY>(myRepeater.count-1)*flickable.height){
                    flickable.state = 'back'
                }
            }

            states: [
                State {
                    name: "home"
                    PropertyChanges {
                        target: flickable
                    }
                },
                State {
                    name: "nearNumber"
                    PropertyChanges {
                        target: flickable
                        contentY: currentIndex*flickable.height
                    }
                },
                State {
                    name: "back"
                    PropertyChanges {
                        target: flickable
                        contentY: (myRepeater.count-1)*flickable.height
                    }
                }
            ]
            transitions: Transition {//Control animation of contentX
                NumberAnimation{
                    properties: "contentY"
                    duration: 200
                }
            }
            Column{
                anchors.fill: parent
                Repeater{
                    id: myRepeater
                    model: myModel
                    Rectangle{
                        height: flickable.height
                        width: flickable.width
                        color: "#00000000"
                        Text {
                            text:{
                                if(typeModel === 0) return index+1
                                if(typeModel === 1) return modelData
                                if(typeModel === 2) return index+1970
                            }
                            anchors.centerIn: parent
                            color: (currentIndex===index)?"black":"#95a5a6"
                            font.pointSize: 24
                            font.bold: true
                        }
                    }
                }
            }
            Component.onCompleted: {
                flickable.state = 'home'
                flickable.state = 'nearNumber'
            }
        }
    }
}
