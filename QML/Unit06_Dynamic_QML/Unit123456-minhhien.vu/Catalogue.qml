import QtQuick 2.0
import QtQuick.Window 2.2

Window {
    id: win3
    width: 800
    height: 534
    title: ""
    visible: true
    Rectangle{
        id: rec_2
        width: 200
        height: 400
        x: 550
        y: 50
        border.color: "black"
        ListModel{
            id: dataModel
            ListElement{name:"Timer"; url: "CounterTimer.qml"}
            ListElement{name:"Date"; url: "CurrentDate.qml"}
            ListElement{name:"Score Board"; url: "ScoreBoard.qml"}

        }
        ListView{
            id: listView
            x: 40
            y: 1
            model:dataModel
            height: rec_2.height
            width: rec_2.width
            spacing: 2
            delegate: ListComponent{
                onSignal_load: {
                    loader5.source = model.url
                }
            }
            header: Rectangle{
                width: 100
                height: 50
                x: 10

                y: 1
                Text {
                    id: header
                    font.pointSize: 15
                    text: "Catalogue"
                }
            }
        }
    }
    Rectangle{
        id: rec_1
        x: 50
        y: 50
        width: 450
        height: 400
        border.color: "black"
        Loader{
            id: loader5
            focus: true
        }
    }

}
