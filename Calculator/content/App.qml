// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

// Written by Ahmet Kagan Dogan in September-Oktober 2023

// This is a calculator app for the deployment on a smartphone. It should contain in its vertical layout
// (When user holds phone vertically) the mayor 4 calculation methods and an easy way to enter the
// calculation as well as a nice way to view the result.

import QtQuick 6.2
import QtQuick.Window
import ahmet.AdCalculator


Window {

    color: "black"

    visible: true
    property double verticaldistance: (width/height)*0.02
    // This is for the calculation from width percentage to height percentage because we use 2% of
    // width-screen as horizontal distance of the buttons, but if we also want equal space between
    // the buttons vertically, we must also use 2% of the width of the screen. The problem is,
    // we now need a conversion of the 2% from width-screen to a percentage of the height of the screen
    // because we use percentages of width/height screen to place the elements like buttons in the
    // place we want, but since we need to know the exact percentages for that, we must now how much
    // 2% of the width of the screen actually is in percentage of the height of the screen, so
    // that we can still place everthing according to our wishes wie precision. For example,
    // if we have a phone that is double in height compared to width, than our term (width/height)
    // is now the factor 1/2. That means that if we want to know what 2% (0.02) of the width is
    // in a percentage of the height, we fill in 1/2 and multiply by 0.01, which give 0.01, or 1 %.
    // This is also logically verifiable, if height is double the size of width , then 2 % of the width
    // must equal 1% of the height. And because we don't know the ratio in beforehand, we use
    // (width/height) as the factor to tell us the 2% size in height of the screen and accoridng to
    // that we position our elements on the screen.

    property string inputtext
    property string operationtyp: ""
    property bool zerominuscheck: true

    Ad_Button{

        id:plusminus
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.03
        yPos: parent.height*(0.90-verticaldistance)

        buttontext: "+/-"

        onClicked: {

           if(inputtext.startsWith("-")){

               inputtext = inputtext.substring(1) // deletes the char on the chosen place in a string

           }
           else{

               inputtext= "-" + inputtext // strings/chars can be added via the plus-operation

           }

           inputdisplay.displaytext = inputtext
        }


    }

    Ad_Button{

        id:zero
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.27
        yPos: parent.height*(0.90-verticaldistance)

        buttontext: "0"

        onClicked: {
            // with string += "char" we can extend a string by a char to e.g. show the subsequent inputs

            inputtext +="0"

            inputdisplay.displaytext = inputtext

        }
    }

    Ad_Button{

        id:komma
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.51
        yPos: parent.height*(0.90-verticaldistance)

        buttontext: ","

        onClicked: {

            // indexOf is a method in qml that searches a string for a specific char or understring
            // (a series of chars). If the method finds the char(s) searched, it will give the positon
            // in the string (e.g. 1,2,3 or...) but if not, then it will return -1. This will here trigger
            // the command to put a "," to the string but not if there is already one.
            if(inputtext.indexOf(",") === -1){

                inputtext += ","
                inputdisplay.displaytext = inputtext

            }
        }

    }

    Ad_Button{

        id:equals
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.75
        yPos: parent.height*(0.90-verticaldistance)
        bordercolor: Qt.rgba(0/255, 255/255, 0/255)
        buttontextcolor: "white"

        buttontext: "="

        onClicked: {

            plus.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            minus.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            multiply.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            divide.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)


            if(operationtyp != ""){
            resultdisplay.displaytext = AdCalculator.calculate(inputdisplay.displaytext,resultdisplay.displaytext,operationtyp)
            inputtext = ""
            inputdisplay.displaytext = inputtext
            }
        }
    }

    Ad_Button{

        id:one
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.03
        yPos: parent.height*(0.80-2*verticaldistance)

        buttontext: "1"

        onClicked: {

            inputtext += "1"
            inputdisplay.displaytext = inputtext

        }
    }

    Ad_Button{

       id:two
       w:parent.width*0.22
       h:parent.height*0.10
       xPos: parent.width*0.27
       yPos: parent.height*(0.80-2*verticaldistance)

       buttontext: "2"

       onClicked: {

           inputtext += "2"
           inputdisplay.displaytext = inputtext

       }

    }

    Ad_Button{

        id:three
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.51
        yPos: parent.height*(0.80-2*verticaldistance)

        buttontext: "3"

        onClicked: {

            inputtext += "3"
            inputdisplay.displaytext = inputtext

        }

    }

    Ad_Button{

        id:plus
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.75
        yPos: parent.height*(0.80-2*verticaldistance)

        buttontext: "+"

        onClicked: {

            operationtyp = "+"
            plus.bordercolor = Qt.rgba(191/255,62/255,255/255,1.0)
            minus.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            multiply.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            divide.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)


            if (inputdisplay.displaytext ==""){


            }
            else if(inputdisplay.displaytext !=""){
                resultdisplay.displaytext = AdCalculator.calculate(inputdisplay.displaytext,resultdisplay.displaytext,"+")
                inputtext = ""
                inputdisplay.displaytext = inputtext
            }
        }

    }

    Ad_Button{

        id:four
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.03
        yPos: parent.height*(0.70-3*verticaldistance)

        buttontext: "4"

        onClicked: {

            inputtext += "4"
            inputdisplay.displaytext = inputtext

        }

    }

    Ad_Button{

        id:five
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.27
        yPos: parent.height*(0.70-3*verticaldistance)

        buttontext: "5"

        onClicked: {

            inputtext += "5"
            inputdisplay.displaytext = inputtext

        }

    }

    Ad_Button{

        id:six
        w:parent.width*0.22
        h:parent.height*0.10
        xPos: parent.width*0.51
        yPos: parent.height*(0.70-3*verticaldistance)

        buttontext: "6"

        onClicked: {

            inputtext += "6"
            inputdisplay.displaytext = inputtext

        }

    }

    Ad_Button{

        id:minus
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.75
        yPos:parent.height*(0.70-3*verticaldistance)

        buttontext: "-"

        onClicked: {
            operationtyp = "-"
            plus.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            minus.bordercolor = Qt.rgba(191/255,62/255,255/255,1.0)
            multiply.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            divide.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            if(resultdisplay.displaytext==""){

                resultdisplay.displaytext = inputdisplay.displaytext
                inputtext =""
                inputdisplay.displaytext =""
            }
            else if(resultdisplay.displaytext !=""){
                resultdisplay.displaytext = AdCalculator.calculate(inputdisplay.displaytext,resultdisplay.displaytext,"-")
                inputtext = ""
                inputdisplay.displaytext = inputtext

        }
        }


    }

    Ad_Button{

        id:seven
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.03
        yPos:parent.height*(0.60-4*verticaldistance)

        buttontext: "7"

        onClicked: {

            inputtext += "7"
            inputdisplay.displaytext = inputtext

        }

    }

    Ad_Button{

        id:eight
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.27
        yPos:parent.height*(0.60-4*verticaldistance)

        buttontext: "8"

        onClicked: {

            inputtext += "8"
            inputdisplay.displaytext = inputtext

        }

    }

    Ad_Button{

        id:nine
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.51
        yPos:parent.height*(0.60-4*verticaldistance)

        buttontext: "9"

        onClicked: {

            inputtext += "9"
            inputdisplay.displaytext = inputtext

        }

    }

    Ad_Button{

        id:multiply
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.75
        yPos:parent.height*(0.60-4*verticaldistance)

        buttontext: "×"

        onClicked: {

            plus.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            minus.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            multiply.bordercolor = Qt.rgba(191/255,62/255,255/255,1.0)
            divide.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)

            operationtyp = "*"
            if(resultdisplay.displaytext==""){

                resultdisplay.displaytext = inputdisplay.displaytext
                inputtext =""
                inputdisplay.displaytext =""
            }
            else if(resultdisplay.displaytext !=""){

                if (inputdisplay.displaytext==""){


                }
                else if(inputdisplay.displaytext !="") {
                    resultdisplay.displaytext = AdCalculator.calculate(inputdisplay.displaytext,resultdisplay.displaytext,"*")
                    inputtext = ""
                    inputdisplay.displaytext = inputtext
                }
            }

        }

    }

    Ad_Button{

        id:reciprocal
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.03
        yPos:parent.height*(0.50-5*verticaldistance)

        buttontext: "1/x"

        onClicked: {

            if(resultdisplay.displaytext !="" &&inputdisplay.displaytext ==""){

                resultdisplay.displaytext = AdCalculator.calculate(resultdisplay.displaytext,"0","rep")

            }
            else if(inputdisplay.displaytext !=""){

                resultdisplay.displaytext = AdCalculator.calculate(inputdisplay.displaytext,"0","rep")
                inputtext =""
                inputdisplay.displaytext = inputtext

            }

        }

    }

    Ad_Button{

        id:square
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.27
        yPos:parent.height*(0.50-5*verticaldistance)

        buttontext: "x²"

        onClicked: {

            if(resultdisplay.displaytext !="" &&inputdisplay.displaytext ==""){

                resultdisplay.displaytext = AdCalculator.calculate(resultdisplay.displaytext,"0","sq")

            }
            else if(inputdisplay.displaytext !=""){

                resultdisplay.displaytext = AdCalculator.calculate(inputdisplay.displaytext,"0","sq")
                inputtext =""
                inputdisplay.displaytext = inputtext

            }

        }
    }

    Ad_Button{

        id:root
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.51
        yPos:parent.height*(0.50-5*verticaldistance)

        buttontext: "√x"

        onClicked: {

            if(resultdisplay.displaytext !="" &&inputdisplay.displaytext ==""){

                resultdisplay.displaytext = AdCalculator.calculate(resultdisplay.displaytext,"0","rt")

            }
            else if(inputdisplay.displaytext !=""){

                resultdisplay.displaytext = AdCalculator.calculate(inputdisplay.displaytext,"0","rt")
                inputtext =""
                inputdisplay.displaytext = inputtext

            }

        }

    }

    Ad_Button{

        id:divide
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.75
        yPos:parent.height*(0.50-5*verticaldistance)

        buttontext: "÷"

        onClicked: {

            plus.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            minus.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            multiply.bordercolor = Qt.rgba(255/255, 0/255, 0/255, 1.0)
            divide.bordercolor = Qt.rgba(191/255,62/255,255/255,1.0)

            operationtyp = "/"
            if(resultdisplay.displaytext==""){

            resultdisplay.displaytext = inputdisplay.displaytext
            inputtext =""
            inputdisplay.displaytext =""
            }
            else if(resultdisplay.displaytext !=""){

                if(inputdisplay.displaytext ==""){

                }
                else if (inputdisplay.displaytext !=""){

                    resultdisplay.displaytext = AdCalculator.calculate(inputdisplay.displaytext,resultdisplay.displaytext,"/")
                    inputtext = ""
                    inputdisplay.displaytext = inputtext
                }
            }
        }

    }

    Ad_Button{

        id:percent
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.03
        yPos:parent.height*(0.40-6*verticaldistance)

        buttontext: "%"

        onClicked: {

            operationtyp = "per"

            if(inputdisplay.displaytext ==""){


            }
            else if (inputdisplay.displaytext !=""){
                if(resultdisplay.displaytext==""){

                    resultdisplay.displaytext = inputdisplay.displaytext
                    inputtext =""
                    inputdisplay.displaytext =""
                }
                else if(resultdisplay.displaytext !=""){

                    if (inputdisplay.displaytext==""){


                    }
                    else if(inputdisplay.displaytext !="") {
                        resultdisplay.displaytext = AdCalculator.calculate(inputdisplay.displaytext,resultdisplay.displaytext,"per")
                        inputtext = ""
                        inputdisplay.displaytext = inputtext
                    }
                }
            }
        }

    }

    Ad_Button{

        id:clearentry
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.27
        yPos:parent.height*(0.40-6*verticaldistance)

        buttontext: "CE"

        onClicked: {

            inputtext = ""
            inputdisplay.displaytext = inputtext

        }
    }

    Ad_Button{

        id:clearall
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.51
        yPos:parent.height*(0.40-6*verticaldistance)

        buttontext: "C"

        onClicked: {

            inputtext =""
            inputdisplay.displaytext = inputtext
            resultdisplay.displaytext = ""

        }
    }

    Ad_Button{

        id:backspace
        w:parent.width*0.22
        h:parent.height*0.10
        xPos:parent.width*0.75
        yPos:parent.height*(0.40-6*verticaldistance)

        buttontext: "\u232b"

        onClicked: {
            // allows to delete the last char of a string
            inputtext = inputtext.slice(0, inputtext.length - 1)
            inputdisplay.displaytext = inputtext
        }

    }

    Ad_Display{

        id:resultdisplay
        w:parent.width*0.94
        h:parent.height*0.14
        xPos:parent.width*0.03
        yPos:parent.height*0.18

    }

    Ad_Display{

        id:inputdisplay
        w:parent.width*0.94
        h:parent.height*0.14
        xPos:parent.width*0.03
        yPos:parent.height*0.02
        bordercolor: Qt.rgba(255/255, 0/255, 0/255, 1.0)
        displaycolor: Qt.rgba(61/255, 61/255, 61/255, 1.0)


    }
}



