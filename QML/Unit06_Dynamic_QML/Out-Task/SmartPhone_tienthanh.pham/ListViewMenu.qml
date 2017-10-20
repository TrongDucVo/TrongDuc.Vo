import QtQuick 2.4

Rectangle {
    id: root
    width: 400
    height: 400
    color: "#00000000"

    ListModel{
        id: dataModel
        ListElement{
            name: "Contact"
            imgSource: "img/contact.png"
        }
        ListElement{
            name: "Messager"
            imgSource: "img/messager.png"
        }
        ListElement{
            name: "Information"
            imgSource: "img/information.png"
        }
    }

    Rectangle{
        width: 250
        height: 250
        anchors.centerIn: parent
        PathView {
            id: listViewMenu
            width: 250
            height: 250
            model: dataModel
            focus: true
            path: Path {
                startX: 120; startY: 100
                PathQuad { x: 120; y: 25; controlX: 260; controlY: 50 }
                PathQuad { x: 120; y: 100; controlX: -20; controlY: 50 }
            }

            delegate: MenuItem{
                textName: model.name
                imgSource: model.imgSource
                onClick: {
                    selectIcon.click()
                }
            }
        }
    }
    Btn_click{
        name:"previous"
        width: 100
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        onClick: {
            listViewMenu.decrementCurrentIndex()
        }
    }
    Btn_click{
        name:"next"
        width: 100
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        onClick: {
            listViewMenu.incrementCurrentIndex()
        }
    }
    Btn_click{
        id: selectIcon
        name: "Select"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        onClick: {
        }
    }
    Component.onCompleted: {
        selectIcon.onClick.connect(openLoader)
    }
    function openLoader(){
        switch (listViewMenu.currentIndex){
        case 0:
            mainComponent.source = "qrc:/Contact.qml"
            break;
        case 1:
            mainComponent.source = "qrc:/Messager.qml"
            break;
        case 2:
            mainComponent.source = "qrc:/Information.qml"
            break;
        }
    }

    Btn_click{
        name: "Back"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onClick:{
            mainComponent.source = "Home.qml"
        }
    }
}
