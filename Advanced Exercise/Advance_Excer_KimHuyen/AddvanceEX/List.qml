import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Rectangle {
    id: root
    visible: true

    width: parent.width
    height:parent.height

    property int cout: 0


    ListModel{
        id: dataModel

        ListElement{
            name:"1.ABC";
            year:"1990 ,"
            votes:"1234"


        }

        ListElement{
            name:"1. The Showshank Redemption ";
            year:" 1994 ,"
            votes:"678,79"


        }

        ListElement{
            name:"2. The Godfather";
            year:"1975 ,"
            votes:"257,620"


        }

        ListElement{
            name:"3.Taylor Swift";
            year:"1989 ,"
            votes:"1,120,595"


        }

        ListElement{
            name:"4.Justin Bieber";
            year:"1993 ,"
            votes:"9,302,234"


        }

        ListElement{
            name:"5. The Godfather";
            year:"1975 ,"
            votes:"257,620"


        }
        ListElement{
            name:"6. Sir Alex Feguson";
            year:"1947 ,"
            votes:"233,257,620"


        }
        ListElement{
            name:"7. Manchester United ";
            year:"1943 ,"
            votes:"100,257,620"


        }
        ListElement{
            name:"8.  Jongwoong JeJung";
            year:"1986 ,"
            votes:"5,257,620"


        }
        ListElement{
            name:"9. The Godfather";
            year:"1975 ,"
            votes:"257,620"


        }
        ListElement{
            name:"10. The Godfather";
            year:"1975 ,"
            votes:"257,620"


        }

    }


    Flickable{

        id:flickable
        anchors.fill: parent
        contentHeight: listview.height

        clip:true

        onContentYChanged: {
            if(! mou1.drag.active)
            {
                scrollbar.y = flickable.visibleArea.yPosition * flickable.height
            }

        }


        ListView{

            id:listview
            model:dataModel
            x:2
            width:parent.width
            height: 1400
            spacing:4
            clip: true
            delegate: CustomRow{

                width: parent.width
                height: 70
                color: "WhiteSmoke"
                border.color: "gray"
                border.width: 2

            }

        }

    }

    Rectangle {
        id: scrollbar

        anchors.right: parent.right
        // y: flickable.visibleArea.yPosition * flickable.height
        width: 10
     //   height: flickable.visibleArea.heightRatio * flickable.height

        height: 70
        color: "gray"


        MouseArea{
            id:mou1
            anchors.fill:parent
            drag.target: scrollbar
            drag.axis: Drag.YAxis
            drag.minimumY: 0
            drag.maximumY: root.height - root.height/3



        }
        onYChanged:
        {
            if(mou1.drag.active)
            {
                flickable.contentY = scrollbar.y/flickable.height*flickable.contentHeight ;
            }
        }


    }


}

