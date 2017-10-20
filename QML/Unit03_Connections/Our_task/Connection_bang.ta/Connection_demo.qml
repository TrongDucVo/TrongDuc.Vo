import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    visible: true
    width: 900
    height: 900
    title: qsTr("Connection")

    Rectangle{
        id:rect0
        width: 900; height: 900

        signal enableSubmit(int a1, int a2)
        Text {
            id: txt2
            color: "red"
            font.pixelSize: 50
            anchors.centerIn: parent
            text: qsTr("Submit")
        }


        TextInput{
            id: tx1
            x:50; y:50
            color: "blue"
            text: "nhap ten o day"
            MouseArea {
                id: txtMouseArea
                anchors.fill: parent
                onClicked: {
                    tx1.clear()
                    tx1.focus = true
                }
            }
            function changeText(a1, a2) {
                console.log(a1)
                if (tx1.length>=3&&tx1.length<=8) {
                    txt2.visible = true
                } else {
                    txt2.visible =false
                }
            }
            onTextChanged: {
                rect0.enableSubmit(1, 2)
            }
        }
    }

    Component.onCompleted: {
        rect0.enableSubmit.connect(tx1.changeText)  //  connect signal and slot
        rect0.changeText //  Call slot.
    }
}

