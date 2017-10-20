import QtQuick 2.0
import QtQuick.Controls 2.2
SwipeDelegate {
    id: swipeDelegate
    width: 450
    height: 40
    text: model.name + " - " + model.score
    ListView.onRemove: SequentialAnimation {


        PropertyAction {
            target: swipeDelegate
            property: "ListView.delayRemove"
            value: true
        }
        NumberAnimation {
            target: swipeDelegate
            property: "height"
            to: 0
            easing.type: Easing.InOutQuad
        }
        PropertyAction {
            target: swipeDelegate;
            property: "ListView.delayRemove";
            value: false
        }
    }

    swipe.right: Label {
        id: deleteLabel
        text: "Delete"
        color: "white"
        verticalAlignment: Label.AlignVCenter
        padding: 0
        height: parent.height
        anchors.right: parent.right

        SwipeDelegate.onClicked: listView.model.remove(index)

        background: Rectangle {
            color: deleteLabel.SwipeDelegate.pressed ? Qt.darker("tomato", 1.1) : "tomato"
        }
    }
}

