import QtQuick 2.0

Item {
    id: root
    property int myItemIndex: -1
    property string myItem: textItem.text
    property var item: []
    property int myComboBoxHeight: 30
    property int myComboBoxWidth: 100
    width: myComboBoxWidth
    Rectangle{ //This is rectangle using to show the top of ComboBox
        id: onComboBox
        width: root.width
        height: myComboBoxHeight
        color: "white"
        border.color: "black"
        border.width: 1
        MouseArea{ //using to control mouse click to ComboBox
            anchors.fill: parent
            onClicked: {
                inComboBox.visible ? inComboBox.visible = false:inComboBox.visible=true
            }
            onEntered: parent.color = "#3498db"
            onExited: parent.color = "white"
        }
        Text{ //Text to show the Item
            id: textItem
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: myItem
        }
        Text { //show the down arrow
            text: "V"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
        }
    }
    Rectangle{ //This is rectangle using to show all Item of ComboBox
        id: inComboBox
        visible: false
        color: "white"
        border.color: "black"
        anchors.top: onComboBox.bottom
        width: parent.width
        height: myRepeaterItem.count*myComboBoxHeight+15
        Column{ //column to show all item in here
            id: colItem
            anchors.fill: parent
            anchors.margins: 10
            Repeater{ //Repeater the item from data to each rectangle
                id:  myRepeaterItem
                model: item
                Rectangle{ //Rectangle contain each item
                    width: colItem.width
                    height: myComboBoxHeight
                    Text{ //text item show in here
                        id: textInComboBox
                        text: modelData
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                    }
                    MouseArea{ //control click to item
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.color = "#3498db"
                        onExited: parent.color = "white"
                        onClicked: {
                            myItemIndex = model.index
                            myItem = textInComboBox.text
                            inComboBox.visible = false
                        }
                    }
                }
            }
        }
    }
}
