import QtQuick 2.6
Item{
    id: root
    width: 100
    height: 100
    visible: true
    property alias myColor: rec.color
//    property alias imageSource: ""
//    property alias show: root.visible
    signal clickImage
    signal pressHold
    Rectangle{
        id: rec
        x:parent.x
        y:parent.y
        anchors.fill: parent
        radius: width/2
        color: myColor
        MouseArea{
            id: poit
            anchors.fill: parent
            onClicked: {
                root.clickImage();
            }
            onPressAndHold: {
                root.pressHold()
            }
            onReleased: {
                rec.scale = 1;
                drag.target = poit
            }
        }
    }
    function myClick(){
        rec.color = "#f1c40f"
    }
    function myPressHold(){
        rec.scale = 0.5
        poit.drag.target = root
    }
    Component.onCompleted: {
        root.onClickImage.connect(myClick)
        root.onPressHold.connect(myPressHold)
    }
}
