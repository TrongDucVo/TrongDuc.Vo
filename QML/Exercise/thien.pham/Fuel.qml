import QtQuick 2.0

import org.example 1.0

Item {
    id: fuelForm
    property FuelModel model
    property string textMaxfuel: ""
    objectName: "FuelInterface"

    Component {
        id: dragDelegate
        Rectangle {
            id: content
            anchors { left: parent.left; right: parent.right }
            height: column.implicitHeight + 4
            border.width: 1
            border.color: "lightsteelblue"
            radius: 2
            Column {
                id: column
                anchors { fill: parent; margins: 2 }
                Text { text: 'Time: ' + model.name }
                Text { text: 'Fuel %: ' + model.type }
            }
        }
    }
    ListView {
        id: view
        anchors.margins: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: maxfuel.top
        model: fuelForm.model
        delegate: dragDelegate
        spacing: 4
        cacheBuffer: 50
        boundsBehavior: Flickable.OvershootBounds
    }
    Text {
        id: maxfuel
        text: fuelForm.textMaxfuel
        anchors { right: parent.right; bottom: parent.bottom }
        anchors.margins: 5
    }

    Component.onCompleted:
    {
        if (typeof fuelInterface !== 'undefined')
            fuelInterface.onLoadFuelModel()
    }
}
