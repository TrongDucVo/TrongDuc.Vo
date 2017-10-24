import QtQuick 2.0

// combo List
Rectangle {
    id: recCombolist
    color: "lightsteelblue"
    radius: 10
    signal clickComboBox
    Text {
        text: model.name
        anchors.centerIn: parent
        font.pointSize: 13
        MouseArea{
            anchors.fill: parent

            onClicked: {
            recCombolist.clickComboBox();
            }

        }
    }
    function funcClickBox(){
        txtPressed.text = model.name;
        rectCombo.visible = false;
    }

    Component.onCompleted: {
        recCombolist.onClickComboBox.connect(funcClickBox)
    }
}
