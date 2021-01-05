 Rectangle {
     id: rect
     width: 120; height: 200

     Image {
         id: img
         source: "pics/qt.png"
         x: 60 - img.width/2
         y: 0

         SequentialAnimation on y {
             loops: Animation.Infinite
             NumberAnimation { to: 200 - img.height; easing.type: Easing.OutBounce; duration: 2000 }
             PauseAnimation { duration: 1000 }
             NumberAnimation { to: 0; easing.type: Easing.OutQuad; duration: 1000 }
         }
     }
 }
