import QtQuick 2.0

Rectangle{
    height: 1000
    width: 1000

Text {
    x: 200
    y : 90
    id: name
    text: qsTr("Hi . I am LPRCS Kim Huyen . \n Have a good day :) ")
    font.pointSize: 18
    color: "#FF66CC"
}


Image{
source: "cun.jpg"
width: 300
height: 300
x : 500
y : 300
}

}
