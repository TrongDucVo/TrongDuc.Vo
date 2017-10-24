import QtQuick 2.0

Rectangle{
    id: recCalendar
    width: 400
    height: 600
    // LeftCalendar
    PathViewCalendar{

    }
    //RightCalendar
    GridViewCalendar{
        y:250
    }

}
