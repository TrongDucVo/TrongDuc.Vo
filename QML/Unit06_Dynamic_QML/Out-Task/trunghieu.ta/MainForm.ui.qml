import QtQuick 2.5

Rectangle {
    property alias mouseArea: mouseArea

    width: 360
    height: 360

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        BorderImage {
            id: borderImage1
            x: 130
            y: 105
            width: 100
            height: 100
            source: "qrc:/qtquickplugin/images/template_image.png"

            Flickable {
                id: flickable1
                x: 31
                y: 16
                width: 300
                height: 300
            }
        }

        FocusScope {
            id: focusScope1
            x: 148
            y: 49
            width: 100
            height: 100
        }

        Image {
            id: image1
            x: 119
            y: 105
            width: 100
            height: 100
            source: "qrc:/qtquickplugin/images/template_image.png"
        }

        Item {
            id: item1
            x: 48
            y: 97
            width: 200
            height: 200

            Text {
                id: text1
                x: 89
                y: 93
                text: qsTr("Text")
                font.pixelSize: 12
            }
        }

        MouseArea {
            id: mouseArea1
            x: 48
            y: 29
            width: 100
            height: 100

            Rectangle {
                id: rectangle1
                x: 92
                y: 27
                width: 200
                height: 200
                color: "#ffffff"
            }

            TextEdit {
                id: textEdit1
                x: 27
                y: 66
                width: 80
                height: 20
                text: qsTr("Text Edit")
                font.pixelSize: 12
            }

            TextInput {
                id: textInput1
                x: 92
                y: 49
                width: 80
                height: 20
                text: qsTr("Text Input")
                font.pixelSize: 12
            }
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Hello World"
    }
}
