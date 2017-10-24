import QtQuick 2.4
import QtQuick.Window 2.2

Item{
    id:root
    visible: true
    width: 500
    height: 700

    property int count: 0

    Rectangle{
        id:rec
        anchors.horizontalCenter: parent.horizontalCenter
        height: 100
        color: "red"
        anchors.top: parent.top
        Text{
            text:"LONG TEXT WITH SCROLL BAR"
            color: "green"
            font.bold: true
            anchors.centerIn:parent
            font.pointSize: 18

        }

    }


    Rectangle{

        width: parent.width
        height: root.height - 100
        anchors.top: rec.bottom



        Flickable{
            id:flickable
            anchors.fill: parent
            contentHeight: txt1.height
            clip:true

            onContentYChanged: {
                if(! mou1.drag.active)
                {
                    scrollbar.y = flickable.visibleArea.yPosition * flickable.height
                }


            }
            onFlickEnded: {
            timer.running = true

            }

            Text {
                id: txt1
                width: parent.width
                wrapMode: Text.WordWrap

                text: qsTr("\n          Đất nước
                                          \n\n                               Nguyễn Đình Thi

            Ngâm thơ
            Sáng mát trong như sáng năm xưa
            Gió thổi mùa thu hương cốm mới
            Tôi nhớ những ngày thu đã xa
            Sáng chớm lạnh trong lòng Hà Nội
            Những phố dài xao xác hơi may
            Người ra đi đầu không ngoảnh lại
            Sau lưng thềm nắng lá rơi đầy.

            Mùa thu nay khác rồi
            Tôi đứng vui nghe giữa núi đồi
            Gió thổi rừng tre phấp phới
            Trời thu thay áo mới
            Trong biếc nói cười thiết tha!
            Trời xanh đây là của chúng ta
            Núi rừng đây là của chúng ta
            Những cánh đồng thơm mát
            Những ngả đường bát ngát
            Những dòng sông đỏ nặng phù sa

            Nước chúng ta
            Nước những người chưa bao giờ khuất
            Ðêm đêm rì rầm trong tiếng đất
            Những buổi ngày xưa vọng nói về!
            Ôi những cánh đồng quê chảy máu
            Dây thép gai đâm nát trời chiều
            Những đêm dài hành quân nung nấu
            Bỗng bồn chồn nhớ mắt người yêu.
            Từ những năm đau thương chiến đấu
            Ðã ngời lên nét mặt quê hương
            Từ gốc lúa bờ tre hồn hậu
            Ðã bật lên những tiếng căm hờn

            Bát cơm chan đầy nước mắt
            Bay còn giằng khỏi miệng ta
            Thằng giặc Tây, thằng chúa đất
            Ðứa đè cổ, đứa lột da...

            Xiềng xích chúng bay không khoá được
            Trời đầy chim và đất đầy hoa
            Súng đạn chúng bay không bắn được
            Lòng dân ta yêu nước thương nhà!

            Khói nhà máy cuộn trong sương núi
            Kèn gọi quân văng vẳng cánh đồng
            Ôm đất nước những người áo vải
            Ðã đứng lên thành những anh hùng.

            Ngày nắng đốt theo đêm mưa dội
            Mỗi bước đường mỗi bước hy sinh
            Trán cháy rực nghĩ trời đất mới
            Lòng ta bát ngát ánh bình minh.

            Súng nổ rung trời giận dữ
            Người lên như nước vỡ bờ
            Nước Việt Nam từ máu lửa
            Rũ bùn đứng dậy sáng loà.


")


                font.pointSize:16

                MouseArea{
                anchors.fill: parent
                    onClicked: {

                        scrollbar.visible = true
                        timer.running = true
                    }



                }

            }
        }


        Rectangle {
            id: scrollbar
            anchors.right: parent.right
            visible: false
            width: 10
            height: flickable.visibleArea.heightRatio * flickable.height

            color: "gray"

            MouseArea{
                id:mou1
                anchors.fill:parent
                drag.target: scrollbar
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY:  root.height

                onReleased: {

                   visible =  true
                    timer.restart()

                }


            }

            onYChanged:
            {
                visible = true
                if(mou1.drag.active)
                {
                    flickable.contentY = scrollbar.y/flickable.height*flickable.contentHeight ;
                    timer.running = false ;

                }
            }



        }



    }


    Timer{
        id:timer
        interval: 2000
      running :false
      repeat: false
        onTriggered: {

                scrollbar.visible = false





        }


    }




}



