 Rectangle {
     function calculateMyHeight() {
         return Math.max(otherItem.height, thirdItem.height);
     }
     anchors.centerIn: parent
     width: Math.min(otherItem.width, 10)
     height: calculateMyHeight()
     color: width > 10 ? "blue" : "red"
 }
