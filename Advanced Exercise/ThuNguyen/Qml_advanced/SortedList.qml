import QtQuick 2.4

Rectangle {
    visible: true
    width: parent.width
    height: parent.height
    property var array: [
        ["An","Anh","Anna"],
        ["Ba","Bao","Binh","Bob"],
        ["Charlie"],
        ["David","Dad"],
        ["Eintein","Elite"],
        ["Father","Faraoh"],
        ["G1","G2"],
        ["Hi"],
        ["I"],
        ["Juliet"],
        ["Kim"],
        ["Lan"],
        ["My"],
        ["N"],
        ["Olive"],
        ["P"],
        ["Quy"],
        ["Rob"],
        ["Sam"],
        ["Tom"],
        ["U"],
        ["V"],
        ["W"],
        ["X"],
        ["Y"],
        ["Z"]
    ]
    property var alphabet: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    ListView{
        anchors.fill: parent
        model:26
        delegate: ListDeleagte{
            width: 200
            height: 100
            //color: "lightgrey"
            globalIndex: model.index
        }
    }
}

