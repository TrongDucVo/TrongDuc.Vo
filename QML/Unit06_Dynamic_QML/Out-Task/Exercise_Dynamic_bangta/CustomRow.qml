import QtQuick 2.0
Item{
Rectangle{
    id: rect

    width: 100; height: 40
   anchors.centerIn: parent
    color: "lightyellow"
    border.color: "blue"
    Text {
        id: txt
         width: 40; height: 40
         anchors.centerIn: parent
        text: model.name
          color: "black"
    }
}

}
