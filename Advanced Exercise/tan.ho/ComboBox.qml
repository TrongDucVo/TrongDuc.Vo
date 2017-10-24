import QtQuick 2.0

Rectangle {
    id: recComboBox
    visible: true
    width: 400
    height: 600

    signal clickButton;

    //list Combo
    ListModel{
        id: dataModel
        ListElement{
            name:"comboboxitem1"
        }
        ListElement{
            name:"comboboxitem2"
        }
        ListElement{
            name:"comboboxitem3"
        }
    }
    //combobox
    Rectangle {
        id: rect2
        anchors.centerIn: parent
        anchors.leftMargin: 50
        width: 200
        height: 200

        Text {
            id: txtRight
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            color: "#e74c3c"
            font.pointSize: 18
            text: qsTr("Welcome!")
        }
        Rectangle {
            id:rect2Box
            anchors.top: txtRight.bottom
            width: parent.width
            height: 30
            border.width: 2
            border.color: "black"
            color: "#1abc9c"
            radius: 13
            Text {
                id: txtPressed
                text: qsTr("ComboBox")
                font.pointSize: 14
                anchors.centerIn: parent
            }

            Image {
                id: btnRight
                height: parent.height
                width: 30
                anchors.right: parent.right
                source: "arrow down 2.png"
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    recComboBox.clickButton();
                     console.log("Clicked")
                }

                onReleased: {
                    btnRight.source= "arrow down 2.png"
                }

            }
        }
        Rectangle {
            id: rectCombo
            visible: false
            anchors.top: rect2Box.bottom
            height: parent.height
            width: 180
            ListView {
                id: listview
                model: dataModel
                height: parent.height
                width: parent.width
                spacing: 2
                delegate: ShowListCombo{
                    width: parent.width
                    height: 30
                }
            }
        }
        // click comboBox

        function funcClick(){
            btnRight.source = "arrow down 1.png"
            if (rectCombo.visible === true) rectCombo.visible = false
            else
                rectCombo.visible = true
        }

        Component.onCompleted: {
        recComboBox.onClickButton.connect(funcClick)
    }

}
}
