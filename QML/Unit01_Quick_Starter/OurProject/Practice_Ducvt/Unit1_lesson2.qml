import QtQuick 2.0

Rectangle{
id:root
width: 360
height: 360
color: "gray"
Column
{

Rectangle {
width: 100
height: 50
color:"blue"
border.color: Qt.lighter(color)
}

Rectangle {
width: 100
height: 50
color:"green"
border.color: Qt.lighter(color)
}
 }
Rectangle{
id:texword
x:100
y:180
width: 150
height: 60
color:"white"
}
//Textinput
TextInput{
anchors.fill: texword
text:"Text word here"
color: "black"
}
}
