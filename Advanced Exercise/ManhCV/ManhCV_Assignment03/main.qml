import QtQuick 2.6
import QtQuick.Window 2.2


Window {
    id: root
    visible: true
    width:600;height:650
    Rectangle{

        id:recFather
        anchors.fill: root
        width:parent.width;height:parent.height
        ListView{
            id:listView
            anchors.fill: parent
            x:0;y:0
            contentHeight:5*64
            clip:true
            model:contact
            delegate:contactDelegate
            section.property: "charater"
            section.delegate: sectionDelegate
        }
        Component{
            id:contactDelegate
            Item{
                width:ListView.width
                height:50
                Text{
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 10
                    text: name
                    color: "black"
                    font.pixelSize: 30
                }
            }
        }
        Component{
            id: sectionDelegate
            Rectangle{
                width: recFather.width;height:50
                color: "lightsteelblue"
                Text{
                    text:section
                    font.pixelSize: 30
                    anchors.leftMargin: 10
                    anchors.fill: parent
                }
           }
        }
        ListModel{

            id: contact

            ListElement { name: "Tran Hung Anh"; charater: "A"; }
            ListElement { name: "Nguyen Van An"; charater: "A"; }
            ListElement { name: "Duong Nguyet Anh"; charater: "A";}
            ListElement { name: "Tran  Binh"; charater: "B"; }
            ListElement { name: "Nguyen Van Bang"; charater: "B"; }
            ListElement { name: "Tran Hung Cuong"; charater: "C"; }
            ListElement { name: "Cao Chi Cong"; charater: "C"; }
            ListElement { name: "Nguyen Hung Danh"; charater: "D"; }
            ListElement { name: "Nguyen Minh Duyen"; charater: "D"; }
            ListElement { name: "Erik"; charater: "E"; }
            ListElement { name: "Frank"; charater: "F"; }
            ListElement { name: "Tran Hung Giang"; charater: "G"; }
            ListElement { name: "Tran My Hanh"; charater: "H"; }
            ListElement { name: "Duong Van Hoang"; charater: "H"; }
            ListElement { name: "Cao Van Hung"; charater: "H"; }
            ListElement { name: "Incrik"; charater: "I"; }
            ListElement { name: "Frank Joe"; charater: "J"; }
            ListElement { name: "Tran Van Kien"; charater: "K"; }
            ListElement { name: "Tran Hung Lan"; charater: "L"; }
            ListElement { name: "Nguyen Thi Lan"; charater: "L"; }
            ListElement { name: "Tran Hung Manh"; charater: "M"; }
            ListElement { name: "Bui Tat Minh"; charater: "M"; }
            ListElement { name: "Doan Duy Nguyen"; charater: "N"; }
            ListElement { name: "Ohara"; charater: "O"; }
            ListElement { name: "Tran Hung Phong"; charater: "P"; }
            ListElement { name: "Tran Hung Quoc"; charater: "Q"; }
            ListElement { name: "Philip Right"; charater: "R"; }
            ListElement { name: "Tran Hung Son"; charater: "S"; }
            ListElement { name: "Nguyen Van Sang"; charater: "S"; }
            ListElement { name: "Tran Hung Tan"; charater: "T"; }
            ListElement { name: "Do Van Tuan"; charater: "T"; }
            ListElement { name: "Nguyen Ngoc Tuan"; charater: "T"; }
            ListElement { name: "Dinh Cong Uan"; charater: "U"; }
            ListElement { name: "Tran Hung Vuong"; charater: "V"; }
            ListElement { name: "Erik Wang"; charater: "W"; }
            ListElement { name: "Nguyen Hoang Yen"; charater: "Y"; }
            ListElement { name: "Dinh My Xuan"; charater: "X"; }
            ListElement { name: "Wang Ziang"; charater: "Z"; }
        }

        Column{

            spacing: 0
            height: parent.height
            width: 20
            anchors.right: parent.right


            Repeater{
                id:repeater
                model: ["A","B","C","D","E","F","G","H","I","J","K",
                "L","M","N","O","P","Q","R","S","T","U","V","W","Y","X","Z"]
                Rectangle{
                    id: recColumn
                    width:25
                    height: recFather.height/26
                    MouseArea{
                        id:mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: recColumn.color="lightsteelblue"
                        onExited: recColumn.color="white"
                        onClicked: {
//                            listView.y=0;
                            if(modelData==="A")
                                listView.contentY=50*0;
                            if(modelData==="B")
                                listView.contentY=50*4;
                            if(modelData==="C")
                                listView.contentY=50*7;
                            if(modelData==="D")
                                listView.contentY=50*10;
                            if(modelData==="E")
                                listView.contentY=50*13;
                            if(modelData==="F")
                                listView.contentY=50*15;
                            if(modelData==="G")
                                listView.contentY=50*17;
                            if(modelData==="H")
                                listView.contentY=50*19;
                            if(modelData==="I")
                                listView.contentY=50*23;
                            if(modelData==="J")
                                listView.contentY=50*25;
                            if(modelData==="K")
                                listView.contentY=50*27;
                            if(modelData==="L")
                                listView.contentY=50*29;
                            if(modelData==="M")
                                listView.contentY=50*32;
                            if(modelData==="N")
                                listView.contentY=50*35;
                            if(modelData==="O")
                                listView.contentY=50*37;
                            if(modelData==="P")
                                listView.contentY=50*39;
                            if(modelData==="Q")
                                listView.contentY=50*41;
                            if(modelData==="R")
                                listView.contentY=50*43;
                            if(modelData==="S")
                                listView.contentY=50*45;
                            if(modelData==="T")
                                listView.contentY=50*48;
                            if(modelData==="U")
                                listView.contentY=50*52;
                            if(modelData==="V")
                                listView.contentY=50*54;
                            if(modelData==="W")
                                listView.contentY=50*56;
                            if(modelData==="Y")
                                listView.contentY=50*58;
                            if(modelData==="X")
                                listView.contentY=50*60;
                            if(modelData==="Z")
                                listView.contentY=50*62;
                        }
                    }
                    Text{
                        id:textColumn
                        text: modelData
                        font.pixelSize: 15
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
      }
    }
}








