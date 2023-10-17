// This is an abstraction for a display, which displaces things like results, inputs, properties etc.

import QtQuick 6.2

Item {
    id:displayresult

    property double w: 0
    property double h: 0
    property double xPos: 0
    property double yPos: 0
    property double borderthickness: displaybody.height*0.01
    property string bordercolor: Qt.rgba(0/255, 255/255, 0/255)
    property string displaycolor: Qt.rgba(87/255, 87/255, 87/255, 1.0)
    property string displaytext
    property string displaytextcolor: "white"
    property string displaytextsize: displaybody.height*0.25




    Rectangle{
        id: displaybody
        color: displayresult.displaycolor
        width: displayresult.w
        height: displayresult.h
        x: displayresult.xPos
        y: displayresult.yPos
        radius: displayresult.w*0.10

        border{
            width: displayresult.borderthickness
            color: displayresult.bordercolor
        }

        Text {
            id: displaytexttext
            text: displayresult.displaytext
            anchors.centerIn: parent
            color: displayresult.displaytextcolor
            font.pixelSize: displaytextsize
        }

    }

}
