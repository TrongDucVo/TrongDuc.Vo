import QtQuick 2.0

Rectangle {
id: root
width: 400; height: 400

BrightSquare{
    width:200
    height:200
    anchors.top: parent.top
    anchors.left: parent.left


Row {
id: row
anchors.centerIn: parent
spacing: 20
BlueSquare { }
GreenSquare { }
RedSquare { }
}


}

DarkSquare {
    width:200
    height:200
    anchors.top : parent.top
    anchors.right: parent.right
Grid {
id: grid
rows: 2
columns: 2
anchors.centerIn: parent
spacing: 8
RedSquare { }
RedSquare { }
RedSquare { }
RedSquare { }
}

}
DarkSquare {
    width:200
    height:200
    anchors.bottom : parent.bottom
    anchors.left: parent.left
Flow {
anchors.fill: parent
anchors.margins: 40
spacing: 40
RedSquare { }
BlueSquare { }
GreenSquare { }
}


}
BrightSquare{
    width: 200;
    height: 200
    anchors.bottom : parent.bottom
    anchors.right: parent.right
    GreenSquare
    {id:square
        x:8;y:8
    }


focus :true
Keys.onLeftPressed: square.x -=8
Keys.onRightPressed: square.x +=8
Keys.onUpPressed: square.y -=8
Keys.onDownPressed: square.y +=8
Keys.onPressed:
{
    switch(event.key)
    {case Qt.Key_Plus:
        square.scale +=0.2
        break;
      case Qt.Key_Minus:
          square.scale -=0.2
          break;
      }
}


}
}
