// This is an abstraction of a button. It contains mayor properties of a widely used buttonbody
// just like being able to make a signal-slot connection and visual effects when the button is pressed.

import QtQuick 6.2


Item {

    id:basicbutton
    property double w: 0
    property double h: 0
    property double xPos: 0
    property double yPos: 0
    property double borderthickness: buttonbody.height*0.01
    property string normalcolor:Qt.rgba(61/255, 61/255, 61/255, 1.0) // color when button isn't pressed.
    property string onpresscolor: Qt.rgba(87/255, 87/255, 87/255, 1.0) // color while button is being pressed.
    property string bordercolor: Qt.rgba(255/255, 0/255, 0/255, 1.0)
    property string buttontext:"Buttontext"
    property string buttontextcolor: Qt.rgba(255/255, 0/255, 0/255, 1.0)
    property double buttontextsize: buttonbody.height*0.55
    property double buttontextsizeanimation: buttonbody.height*0.40

    signal clicked()
    signal released()


Rectangle{
    id: buttonbody
    width:basicbutton.w
    height:basicbutton.h
    x:basicbutton.xPos
    y:basicbutton.yPos
    color:basicbutton.normalcolor
    radius:basicbutton.w*0.10


    border{
        width:basicbutton.borderthickness
        color:basicbutton.bordercolor

    }

    Text {
        id: buttontext
        anchors.centerIn: parent
        text: basicbutton.buttontext
        color: basicbutton.buttontextcolor
        font.pixelSize: buttontextsize // enables dynamical scaling of buttontextsize.

        PropertyAnimation{

            id:textanimation1
            target: buttontext
            property: "font.pixelSize"
            from: basicbutton.buttontextsize
            to: basicbutton.buttontextsizeanimation
            duration: 300


        }

        PropertyAnimation{

            id:textanimation2
            target: buttontext
            property: "font.pixelSize"
            from: basicbutton.buttontextsizeanimation
            to: basicbutton.buttontextsize
            duration: 300

        }

    }



    MouseArea{
        id:mA
        anchors.fill: buttonbody


        onEntered: {

            buttonbody.color = basicbutton.onpresscolor
            buttontext.color = "white"
            basicbutton.clicked()
            textanimation1.start()


         }

        onReleased: {
            buttonbody.color = normalcolor
            buttontext.color = basicbutton.buttontextcolor
            basicbutton.released()
            textanimation2.start()
        }
    }

  }
}
