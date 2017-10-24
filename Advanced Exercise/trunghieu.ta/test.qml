import QtQuick 2.6

Item {
    id: window
    width: 600
    height: 600

    state: "summary"
    states: [
        State { name: "summary"; },
        State { name: "details"; }
    ]
    transitions: [
        Transition { from: "summary"; to: "details";
            SequentialAnimation {
                PropertyAction { target: animationRect; property: "visible"; value: true; }
                ParallelAnimation {
                    NumberAnimation { target: animationRect; properties: "x,y"; to: 0; duration: 200; }
                    NumberAnimation { target: animationRect; property: "width"; to: 400; duration: 200; }
                    NumberAnimation { target: animationRect; property: "height"; to: 200; duration: 200; }
                }
                PropertyAction { target: detailsView; property: "visible"; value: true; }
                PropertyAction { target: summaryView; property: "visible"; value: false; }
                PropertyAction { target: animationRect; property: "visible"; value: false; }
            }
        },
        Transition { from: "details"; to: "summary";
            SequentialAnimation {
                PropertyAction { target: summaryView; property: "visible"; value: true; }

                // How to animate animationRect back down to the correct item?

                PropertyAction { target: detailsView; property: "visible"; value: false; }
            }
        }
    ]

    Rectangle {
        id: animationRect
        z: 1
        color: "gray"
        visible: false

        function positionOverSummary(summaryRect) {
            x = summaryRect.x; y = summaryRect.y;
            width = summaryRect.width; height = summaryRect.height;
        }
    }

    ListModel {
        id: data
        ListElement { summary: "Item 1"; description: "Lorem ipsum..."; }
        ListElement { summary: "Item 2"; description: "Blah blah..."; }
        ListElement { summary: "Item 3"; description: "Hurf burf..."; }
    }

    GridView {
        id: summaryView
        anchors.fill: parent
        cellWidth: 100
        cellHeight: 100

        model: data
        delegate: Rectangle {
            color: "lightgray"
            width: 95; height: 95;

            Text { text: summary; }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var delegateRect = mapToItem(window, x, y);
                    delegateRect.width = width; delegateRect.height = height;

                    animationRect.positionOverSummary(delegateRect);
                    detailsView.positionViewAtIndex(index, ListView.Beginning);
                    window.state = "details";
                }
            }
        }
    }

    ListView {
        id: detailsView
        anchors.fill: parent
        visible: false
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem

        model: data
        delegate: Rectangle {
            color: "gray"
            width: 400; height: 200;

            Column {
                Text { text: summary; }
                Text { text: description; }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // How do I get the coordinates to where animationRect should return?

                    summaryView.positionViewAtIndex(index, GridView.Visible);
                    window.state = "summary";
                }
            }
        }
    }
}
