import QtQuick
import QtQuick.Controls
import KadranProject 1.0

Rectangle {
    width: 640
    height: 480
    color: "black"

    property real speedValue: 0   // km/h
    property real fuelValue: 0    // % (reset to 0)
    property bool rightSignalOn: false
    property bool signalBlinkState: false

    // Blink timer for turn signal
    Timer {
        id: blinkTimer
        interval: 1000 // 1 second
        running: rightSignalOn
        repeat: true
        onTriggered: signalBlinkState = !signalBlinkState
    }

    // === Right Panel (Gauges area) ===
    Rectangle {
        id: rightPanel
        width: parent.width * 0.9
        height: parent.height
        color: "black"
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        Row {
            anchors.centerIn: parent
            spacing: 20

            // --- Speed Gauge ---
            Rectangle {
                id: speed
                width: rightPanel.width * 0.55
                height: width
                color: "black"

                // Green turn signal indicator - now anchored to speed gauge
                Rectangle {
                    id: rightSignal
                    width: 40
                    height: 20
                    color: rightSignalOn ? (signalBlinkState ? "lime" : "#004400") : "#004400"
                    radius: 5
                    anchors {
                        bottom: parent.top
                        bottomMargin: 10
                        horizontalCenter: parent.horizontalCenter
                        horizontalCenterOffset: width * 0.5
                    }

                    Text {
                        text: "->"
                        color: "white"
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }

                    Behavior on color {
                        ColorAnimation { duration: 200 }
                    }
                }

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0,0,width,height)
                        ctx.lineWidth = width * 0.015

                        ctx.beginPath()
                        ctx.strokeStyle = "cyan"
                        ctx.arc(width/2, height/2, width*0.4, Math.PI * 0.75, Math.PI * 2.25)
                        ctx.stroke()

                        ctx.fillStyle = "cyan"
                        ctx.font = "bold " + (width*0.07) + "px sans-serif"
                        let numbers = ["0","20","40","60","80","100","120","140","160","180","200"]
                        for (let i=0; i<numbers.length; i++) {
                            let angle = Math.PI * (0.75 + (i*(1.5/(numbers.length-1))))
                            let x = width/2 + Math.cos(angle)*width*0.34 - width*0.04
                            let y = height/2 + Math.sin(angle)*width*0.34 + width*0.025
                            ctx.fillText(numbers[i], x, y)
                        }

                        ctx.font = "bold " + (width*0.06) + "px sans-serif"
                        ctx.fillText("Km/h", width/2 - width*0.12, height/2 + width*0.04)
                    }
                }

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0,0,width,height)
                        ctx.fillStyle = "red"
                        var minAngle = 135
                        var maxAngle = 405
                        // Needle starts at 0 (reset position)
                        var angle = (minAngle + (speedValue/200)*(maxAngle-minAngle)) * Math.PI/180

                        ctx.save()
                        ctx.translate(width/2, height/2)
                        ctx.rotate(angle)

                        ctx.beginPath()
                        ctx.moveTo(0,0)
                        ctx.lineTo(-width*0.014, height*0.057)
                        ctx.lineTo(0,-width*0.43)
                        ctx.lineTo(width*0.014, height*0.057)
                        ctx.closePath()
                        ctx.fill()

                        ctx.restore()
                    }
                }
            }

            // --- Fuel Gauge ---
            Rectangle {
                width: rightPanel.width * 0.35
                height: width
                color: "black"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0,0,width,height)
                        ctx.lineWidth = width * 0.08
                        ctx.lineCap = "round"

                        // Reversed color order (green on top)
                        ctx.beginPath()
                        ctx.strokeStyle = "lime"
                        ctx.arc(width/2, height/2, width*0.4, Math.PI*1.5, Math.PI*1.35)
                        ctx.stroke()

                        ctx.beginPath()
                        ctx.strokeStyle = "yellow"
                        ctx.arc(width/2, height/2, width*0.4, Math.PI*1.35, Math.PI*1.2)
                        ctx.stroke()

                        ctx.beginPath()
                        ctx.strokeStyle = "red"
                        ctx.arc(width/2, height/2, width*0.4, Math.PI*1.2, Math.PI*0.75)
                        ctx.stroke()

                        ctx.fillStyle = "cyan"
                        ctx.font = "bold " + (width*0.12) + "px sans-serif"
                        ctx.fillText("F", width*0.72, height*0.28)  // Top (green)
                        ctx.fillText("E", width*0.72, height*0.85)  // Bottom (red)
                    }
                }

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0,0,width,height)
                        ctx.fillStyle = "white"

                        // Adjusted angles for reversed gauge
                        var minAngle = 270  // Top (F)
                        var maxAngle = 135  // Bottom (E)
                        var angle = (minAngle + ((100 - fuelValue)/100)*(maxAngle-minAngle)) * Math.PI/180

                        ctx.save()
                        ctx.translate(width/2, height/2)
                        ctx.rotate(angle)

                        ctx.beginPath()
                        ctx.moveTo(0,0)
                        ctx.lineTo(-width*0.01, height*0.05)
                        ctx.lineTo(0,-width*0.38)
                        ctx.lineTo(width*0.01, height*0.05)
                        ctx.closePath()
                        ctx.fill()

                        ctx.restore()
                    }
                }
            }
        }
    }

    // === Control Panel ===
    Column {
        spacing: 10
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20

        // Turn signal toggle
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Text { text: "Right Signal:"; color: "white" }
            Switch {
                checked: rightSignalOn
                onCheckedChanged: {
                    rightSignalOn = checked
                    if (checked) signalBlinkState = true
                }
            }
        }

        // Speed control
        Row {
            spacing: 5
            Text { text: "Speed:"; color: "white" }
            Slider {
                from: 0; to: 200
                value: speedValue
                onValueChanged: speedValue = value
                width: 100
            }
            Text { text: Math.round(speedValue) + " km/h"; color: "white" }
        }

        // Fuel control
        Row {
            spacing: 5
            Text { text: "Fuel:"; color: "white" }
            Slider {
                from: 0; to: 100
                value: fuelValue
                onValueChanged: fuelValue = value
                width: 100
            }
            Text { text: Math.round(fuelValue) + " %"; color: "white" }
        }
    }
}
