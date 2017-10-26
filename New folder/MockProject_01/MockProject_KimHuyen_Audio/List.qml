
import QtQuick 2.6
import QtQuick.Window 2.2


Rectangle {
    id: root
    visible: true

    width: parent.width
    height:parent.height

    property int cout: 0


    ListModel{
        id: dataModel

        ListElement{
            name:" Categories";

        }

        ListElement{
            name:" Update Station List "



        }

        ListElement{
            name:" %95.5%  %Tolent%%%%";


        }

        ListElement{
            name:" %99.7%  %Adult With Code %";


        }

        ListElement{
            name:"%100.3% %Ann Abon Public Radio %";



        }

        ListElement{
            name:"%101.5% % Religius % ";



        }
        ListElement{
            name:"%100.3% %Ann Abon Public Radio %";


        }
        ListElement{
            name:"%100.3% %Ann Abon Public Radio % ";



        }
        ListElement{
            name:"%100.3% %Ann Abon Public Radio % ";



        }
        ListElement{
            name:"%100.3% %Ann Abon Public Radio % ";



        }
        ListElement{
            name:"%100.3% %Ann Abon Public Radio % ";



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
            height: 400
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

