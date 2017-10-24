import QtQuick 2.0

Component {
    id: spaceManDelegate
    Item {
        width: ListView.view.width
        height: 50
        Text {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 8
            font.pixelSize: 12
            text: model.name
            color: '#1f1f1f'
        }
    }
}
