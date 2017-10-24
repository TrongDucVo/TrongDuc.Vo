import QtQuick 2.5

Item{
    Rectangle {
        id: root
        visible: true
        width: 600
        height: 600

        Rectangle {
            id: rect_root
            width: parent.width
            height: parent.height
            border.color: "gray"
            border.width: 10
            Rectangle {
                id: rect_head
                width: parent.width
                height: parent.height*0.15
                color: "gray"

                Text {
                    id: name
                    anchors.centerIn: parent
                    text: qsTr("ComboBox_byTa")
                    font.pointSize: 15
                }
            }

            BoxCroll {
                id: box1
                width: parent.width*0.4
                height: width*0.2
                x: parent.width*0.04
                y: parent.height*0.3
                onClick_scroll: Qt.quit()
                text: "ComboBox1"
            }

            BoxCroll {
                id: box2
                width: parent.width*0.4
                height: width*0.2
                anchors.left: box1.right; anchors.leftMargin: box1.x
                anchors.top: box1.top
                onClick_scroll: rect.visible = !rect.visible
            }

            Rectangle {
                id: rect
                visible: false
                width: parent.width*0.4 - 20
                height: 200
                //visible: false
                anchors.top: box2.bottom
                anchors.left: box2.left
                anchors.leftMargin: 10

                ListModel {
                    id: listModel
                    ListElement { name: "ComboBox1"}
                    ListElement { name: "ComboBox2"}
                    ListElement { name: "ComboBox3"}
                    ListElement { name: "ComboBox4"}
                    ListElement { name: "ComboBox5"}
                    ListElement { name: "ComboBox6"}
                    ListElement { name: "ComboBox7"}
                }

                Component {
                    id: contactDelegate
                    Rectangle {
                        id: rect_Delegate
                        width: rect.width; height: 40
                        border.color: "gray"
                        border.width: 3
                        radius: 5
                        Text {
                            text: name
                            font.pointSize: 15
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                box1.text = model.name
                                //list.currentIndex = index
                                rect.visible = !rect.visible
                                //list.visible = true
                            }
                            //highlightBar.currentIndex: index
                            hoverEnabled: true
                            onEntered: rect_Delegate.color = "red"
                            onExited: rect_Delegate.color = "white"
                        }
                    }
                }

                Component {
                    id: highlightBar
                    Rectangle {
                        z: 2
                        width: rect.width; height: 40
                        color: "#FFFF88"
                        opacity: 0.3
                        radius: 5
                        focus: true
                        //y: list.currentItem.y;
                        //Behavior on y { SpringAnimation { spring: 2; damping: 0.1 } }
                    }
                }

                ListView {
                    id: list
                    width: rect.width
                    height: rect.height
                    model: listModel
                    highlight: Rectangle {z: 2; opacity: 0.3; color: "green"; radius: 5}
                    highlightFollowsCurrentItem: false
                    delegate: contactDelegate
                    clip: true
                    focus: true
                    spacing: 10
                }
            }
        }
    }
}
