import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    visible: true
    width: 1000
    height: 650

    Loader {
        id: mainCompoment1
        height: 600
        width: 800
        anchors.left: parent.left
        source: "qrc:/AppStudentMarkMan.qml"
    }

    Loader {
        id: mainCompoment2
        height: 600
        width: 400
        anchors.left:parent.left
    }
    // ListView Rectangle

    Rectangle {
        id: rect_list
        height: 400
        width: 200
        radius: 8
        border.width: 8
        border.color: "red"

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            height: rect_list.height*0.9
            width: rect_list.width*0.9
            anchors.centerIn: parent

            ListModel {
                id: model_data
                ListElement {name: "page1"; url: "qrc:/AppStudentMarkMan.qml"}
                ListElement {name: "page2"; url: "qrc:/main_clock.qml"}
                ListElement {name: "page3"; url: "qrc:/signal_connectQML.qml"}
            }

            ListView{
                model: model_data
                clip: true
                anchors.fill: parent
                anchors.leftMargin: parent.height/8
                spacing: parent.height/12

                delegate: Custum_list {
                    height: 50
                    width: 100
                    onSignal_choose: {
                        mainCompoment1.source = url
                    }
                }
            }
        }

        //        Button {
        //            id: btnPage1
        //            height: 50
        //            width: 100
        //            anchors.left: parent.left
        //            text: "Page1"
        //            onClicked: mainCompoment1.setSource("qrc:/AppStudentMarkMan.qml")
        //        }


        //        Button {
        //            id: btnPage2
        //            height: 50
        //            width: 100
        //            anchors.left: btnPage1.right
        //            text: "Page2"
        //            onClicked: mainCompoment1.setSource("qrc:/main_clock.qml")
        //        }

        //        Button {
        //            id: btnPage3
        //            height: 50
        //            width: 100
        //            anchors.left: btnPage2.right
        //            text: "Page3"
        //            onClicked: mainCompoment1.setSource("qrc:/signal_connectQML.qml")
        //        }
    }
    Button {
        id: btnPage4
        height: 50
        width: 100
        anchors.bottom: parent.bottom
        //anchors.left: btnPage3.right
        text: "EXIT"
        MouseArea{
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }

}
