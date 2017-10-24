import QtQuick 2.6

Rectangle {
    id: rect_LongText
    width: 600
    height: 600
    border.color: "gray"
    border.width: 5
    clip: true

    property var positionInit
    property var positionInitNew
    property var positionNew: 0
    property int valid: 0

    Timer{
        id: timer
        interval: 10
        running: true
        repeat: true
        onTriggered:{
            valid = 0
        }
    }

    Timer{
        id: timer2
        repeat: true
        interval: (valid)? 10 : 2000
        running: true
        onTriggered:{
            if(valid == 0){
                scrollbar.visible = false
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            positionInit = flickable.contentY//scrollbar.y
            positionInitNew = mouseY
        }

        onPositionChanged: {
            positionNew = (mouseY - positionInitNew)// + positionInit
            flickable.contentY = 1310/500*positionNew + positionInit
            if(flickable.contentY > 1310 )
                flickable.contentY = 1310;
            if(flickable.contentY < 0)
                flickable.contentY = 0;
        }
    }

    Rectangle {
        width: 540
        height: 580
        y: 15
        x: 20

        Flickable {
            id: flickable
            width: 540; height: 580
            contentWidth: text_scroll.width
            contentHeight: text_scroll.height
            clip: true
            onContentYChanged: {
                scrollbar.visible = true
                valid = 1
            }
            Text {
                width: 540
                id: text_scroll
                wrapMode: Text.Wrap
                font.pointSize: 15
                text: qsTr("These properties hold the surface coordinate currently at the top-left corner of the Flickable. For example, if you flick an image up 100 pixels, contentY will be 100. dragging : bool
These properties describe whether the view is currently moving horizontally, vertically or in either direction, due to the user dragging the view.
draggingHorizontally : bool

These properties describe whether the view is currently moving horizontally, vertically or in either direction, due to the user dragging the view.

draggingVertically : bool

These properties describe whether the view is currently moving horizontally, vertically or in either direction, due to the user dragging the view.

flickDeceleration : real

This property holds the rate at which a flick will decelerate.
The default value is platform dependent.

flickableDirection : enumeration

This property determines which directions the view can be flicked.
Flickable.AutoFlickDirection (default) - allows flicking vertically if the contentHeight is not equal to the height of the Flickable. Allows flicking horizontally if the contentWidth is not equal to the width of the Flickable.
Flickable.HorizontalFlick - allows flicking horizontally.
Flickable.VerticalFlick - allows flicking vertically.
Flickable.HorizontalAndVerticalFlick - allows flicking in both directions.

flicking : bool

These properties describe whether the view is currently moving horizontally, vertically or in either direction, due to the user flicking the view.

flickingHorizontally : bool

These properties describe whether the view is currently moving horizontally, vertically or in either direction, due to the user flicking the view.

flickingVertically : bool

These properties describe whether the view is currently moving horizontally, vertically or in either direction, due to the user flicking the view.")
            }
        }

        Rectangle {
            id: scrollbar
            visible: false
            anchors.left: flickable.right
            anchors.leftMargin: 20
            //x: 20
            y: flickable.visibleArea.yPosition * flickable.height
            width: 10
            height: flickable.visibleArea.heightRatio * flickable.height
            color: "black"

        }
    }
}
