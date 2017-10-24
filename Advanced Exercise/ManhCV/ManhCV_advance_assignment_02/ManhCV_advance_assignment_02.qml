import QtQuick 2.6
import QtQuick.Window 2.2


Item{
    id:root
    width:1000;height:600
    Rectangle{
        id:display
        width: 200;height:50
        visible: true
        border.color: "black"
        anchors.centerIn: root
        MouseArea{
            anchors.fill: parent
            onClicked: {
                display.visible=false
                flickablearea.visible=true
            }
        }
        Text{
            text: "Display Longtext"
            font.pixelSize: 20
            anchors.centerIn: display
        }
    }
    Flickable{
        id:flickablearea
        visible: false
        anchors.fill: root
        flickableDirection: Flickable.VerticalFlick
        contentHeight: content.height;contentWidth: content.width
        clip:true
        onFlickEnded: {
            timer1.running=true
            khung.visible=true
        }


        Text{
            id:content
            font.pixelSize: 25
            width:flickablearea.width
            clip:true
            wrapMode: Text.WordWrap
            text: qsTr("                Falling prices unlikely to boost growth in Vietnam’s auto market
        Despite massive discounts buyers are waiting for import tariffs to be abolished at the start of 2018.


        Nguyen Hoang Ha felt excited to be checking out a new Honda CRV at a showroom in Hanoi’s
        Hoang Mai District.
        Despite planning to replace his old Huyndai amid sharp cuts to car prices, the 38-year-old
        banker decided to delay ordering a new vehicle just for now because he expects prices to
        fall even further in the coming months.
        Prices of many vehicles have been slashed from 2.5-15 percent since the beginning of this year
        and the Honda CRV and Audi TT have experienced some of the biggest price drops.
        Some car dealerships have offered discounts of up to $10.000 to try and boost sales amid a
        gloomy
        market, but potential buyers are waiting for lower tariffs that will take affect in 2018.
        “Automobile prices have declined steadily in recent months. I don’t want to buy a car today and
        see the price slashed by tens of millions of dong tomorrow,” he said, picking up brochures from
        a salesman.
        Like many potential buyers, Ha wants to wait for better prices when the import tariff on cars is
        abolished under the ASEAN Trade in Goods Agreement in 2018. The current import tax is 30 percent.
        Over 21,200 vehicles were sold in September, down 4 percent from August and by 20 percent from the
        same month last year, according to a new report from the Vietnam Automobile Manufacturers’
        Association.
        The figure includes SUVs, passenger cars and commercial vehicles.

        Severe blows to car dealerships

        Falling sales have forced Nguyen Trong Hiep, a salesman at an Audi showroom in Hanoi, to change his
        sales
        approach. Instead of waiting for customers to visit his showroom, Hiep is contacting potential buyers
        to
        promote his products.
        This drop in sales has hit Hiep and his colleagues, and many of them have quit due to low pay checks.
        Some car dealerships have also been struggling. The owner of a showroom in Hanoi’s Long Bien District
        said
        his firm had suffered losses due to low sales. If the situation does not improve in the next six months
        he will have to close the business and find a new job.
        His firm has halved its sales force this year.
        “The situation has never been as bad as this before, he said. We can’t make enough to pay the interest
        on a
        bank loan of over VND4 billion ($181,000) we used to upgrade our showroom late last year, not to mention
        the
        monthly rent of nearly $10,000.”
        Some small and medium-sized car dealerships have even announced they are selling their showrooms, but that
        it is difficult for them to find buyers in the current market.

        Domestic auto manufacturers are also bracing for tough times.

        During the first half of this year, Truong Hai Auto that assembles Mazda and Kia models posted VND25.5
        trillion
        ($1.12 billion) in sales, down 6 percent on-year, with pre-tax profit falling 36 percent to VND2.4 trillion.
        Its market share slipped 3.4 percentage points to 38.1 percent in the same period, according to the Nikkei
        Asian Review.
        Industry insiders have said it will be difficult for the automobile market to notch up growth of 10 percent
        in 2017
        target set by the VAMA earlier this year.
        Facing the prospect of competing with imported cars, some some domestic makers plan to narrow production
        in Vietnam
        and import more cars.
        More than 58 percent of cars imported into Vietnam in the first six months of this year came from Southeast
        Asian countries,
        according to the Vietnam General Customs Department.
        A representative of Toyota Vietnam said her firm had anticipated market fluctuations and planned to cut its
        assembling operations
        while focusing on producing only some models in Vietnam.
        Like Ha, many potential buyers have been following news on the car market. However, they are only interested
        in price and not what enterprises plan to do in terms of strengthening imports or narrowing production.
        “The only thing I want to know is where the bottom price is, Ha said. I don’t want to lose thousands of dollars
        overnight because of a price drop.
        ")
        }


        MouseArea{
            id:mousearea
            anchors.fill: parent

            onPressed:    {

               khung.visible=true
//                timer1.start()
            }
            onPressAndHold:     {
               timer1.running=false
                khung.visible=true
            }
            onReleased: {
                timer1.start()
            }

        }

    }

    Rectangle{
        id: khung
        visible: false
        anchors.right: parent.right
        width:20;height:parent.height
        color:"lightgrey"
        Rectangle{
            id:scroll
            property int  yscrollmax: flickablearea.height-scroll.height
            y:flickablearea.visibleArea.yPosition*flickablearea.height
            //property int truc_y: flickablearea.visibleArea.yPosition*(1-flickablearea.visibleArea.heightRatio)
            width:parent.width;height: flickablearea.visibleArea.heightRatio*flickablearea.height
            anchors.right: khung.right
            color: "lightsteelblue"

            MouseArea{
                id: mouse_scroll
                anchors.fill: scroll
                drag.minimumY: 0;drag.maximumY: scroll.yscrollmax
                onPositionChanged:  {
                    drag.target=scroll
                    Drag.axis=drag.YAxis
                    flickablearea.contentY=scroll.y/scroll.yscrollmax*(content.height-root.height)
                }

            }
        }
    }
    Timer{
        id:timer1
        interval:2500
        running:false;repeat:true
        onTriggered: {
            khung.visible=false
        }
    }

}




