import QtQuick 2.5

Item {
    id: root
    //visible: true
    width: 600
    height: 700

    property int valid: 0
    MouseArea {
        anchors.fill: parent
        onPositionChanged: console.log(flickableRoot.contentX)
    }

    Rectangle {
        id: rectScroll
        width: 600
        height: 600

        Flickable {
            id: flickableRoot
            width: 600; height: 600
            contentWidth: rect.width

            //contentX: 900

            Timer{
                id: timer
                interval: 40
                running: true
                repeat: true
                onTriggered:{
                    valid = 0
                }
            }

            Timer {
                id: timer1
                interval: 10
                running: true
                repeat: true
                onTriggered:{
                    if(valid == 0){
                        //console.log("hello")
                        flickableRoot.contentX = (flickableRoot.contentX <= 300) ? 0 : (flickableRoot.contentX >= 300 && flickableRoot.contentX < 900) ? 600 : 1200
                        if(flickableRoot.contentX == 0){
                            page1.color = "gray"
                            page2.color = "white"
                            page3.color = "white"
                        }
                        else if(flickableRoot.contentX == 600){
                            page2.color = "gray"
                            page1.color = "white"
                            page3.color = "white"
                        }
                        else if(flickableRoot.contentX == 1200){
                            page3.color = "gray"
                            page2.color = "white"
                            page1.color = "white"
                        }

                    }
                }
            }

            onContentXChanged: {
                valid = 1
                //console.log(valid)
                //contentX = (contentX > 200 && contentX < 300) ? 0 : (contentX >= 300 && contentX < 900) ? 600 : 1200
            }
            Rectangle {
                id: rect
                width: 1800
                height: 600
                Loader {
                    width: 600
                    height: 600
                    id: loadQml
                    source: "Unit1_ComboBox.qml"
                }

                Loader {
                    width: 600
                    height: 600
                    id: loadQml1
                    anchors.left: loadQml.right
                    source: "LongText.qml"
                }

                Loader {
                    width: 600
                    height: 600
                    id: loadQml2
                    anchors.left: loadQml1.right
                    source: "Contact.qml"
                }
            }
        }
    }

    Rectangle {
        id: page1
        height: 50
        width: 150
        border.color: "gray"
        border.width: 5
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 20
        anchors.leftMargin: 46
        Text {
            id: textP1
            anchors.centerIn: parent
            font.pointSize: 16
            text: "page1"
        }
        //opacity: 0.3
        MouseArea {
            anchors.fill: parent
            onClicked: {
                flickableRoot.contentX = 0
            }
        }
    }

    Rectangle {
        id: page2
        height: 50
        width: 150
        border.color: "gray"
        border.width: 5
        anchors.left: page1.right
        anchors.top: page1.top
        anchors.leftMargin:  30
        Text {
            id: textP2
            anchors.centerIn: parent
            font.pointSize: 16
            text: "page2"
        }
        //opacity: 0.3
        MouseArea {
            anchors.fill: parent
            onClicked: {
                flickableRoot.contentX = 600
            }
        }
    }

    Rectangle {
        id: page3
        height: 50
        width: 150
        border.color: "gray"
        border.width: 5
        anchors.left: page2.right
        anchors.top: page2.top
        anchors.leftMargin:  30
        Text {
            id: textP3
            anchors.centerIn: parent
            font.pointSize: 16
            text: "page3"
        }
        //opacity: 0.3
        MouseArea {
            anchors.fill: parent
            onClicked:{
                flickableRoot.contentX = 1200
            }
        }
    }
}
