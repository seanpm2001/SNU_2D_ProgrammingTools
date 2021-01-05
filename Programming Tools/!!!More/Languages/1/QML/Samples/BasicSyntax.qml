 import QtQuick 2.9  // import from Qt 5.9

 Rectangle {
     id: canvas
     width: 250
     height: 200
     color: "blue"

     Image {
         id: logo
         source: "pics/logo.png"
         anchors.centerIn: parent
         x: canvas.height / 5
     }
 }
