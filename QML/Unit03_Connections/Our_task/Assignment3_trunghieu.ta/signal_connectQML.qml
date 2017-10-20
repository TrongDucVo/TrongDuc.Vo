import QtQuick 2.6

Item {
    id: root
    height: 300
    width: 300
    function enableSubmit() {
        console.log("submit success")
    }

    function lengText(){
        if(inp1.length >= 3 && inp1.length <= 8){
            //rec2.visible = true
            rec2.color = "#e67e22"
        }
        else
        {
            //rec2.visible = false
            rec2.color = "white"
        }
    }


    //console.log("lengText")
    signal changeText()

    Component.onCompleted: {
        root.changeText.connect(lengText)
    }

    Rectangle {
        id: rec3
        height: 300
        width: 300
        //color: "lightsteelblue"
        border.color: "blue"
        border.width: 6
        anchors.centerIn: parent
    }

    Rectangle {
        id: rec1
        height: 30
        width: 200
        color: "lightsteelblue"
        border.color: "blue"
        anchors.centerIn: parent


        TextEdit {
            id: inp1
            x: 20; y: 3
            width: 150; height: 60
            focus: true
            font.pixelSize: 20
            wrapMode: Text.Wrap
            onTextChanged: {
                changeText()
            }

            //onChangeText: lengText()
        }


        Rectangle {
            visible: true
            property int index: 0
            id: rec2
            x:20
            y: 53
            height: 30
            width: 100
            border.color: "black"
            color: (index == 0)? "white" : "blue"
            border.width: 2

            Text {
                id: name
                anchors.centerIn: parent
                font.pixelSize: 20
                text: qsTr("submit")
            }

            MouseArea {
                anchors.fill: parent
                onClicked: rec2.color = "blue"
                onPressed: rec2.color = "red"
                onPressAndHold: rec2.color = "green"
            }
        }
    }
}

