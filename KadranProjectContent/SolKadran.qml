import QtQuick
import KadranProject 1.0
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: 640
    height: 400
    visible: true
    color: "black"

    property real rpmValue: 0     // 0 - 8 arası
    property real tempValue: 50   // 50 - 130 arası
    property bool leftSignalOn: false
    property bool signalBlinkState: false

    // Blink timer for turn signal
    Timer {
        id: blinkTimer
        interval: 1000 // 1 second
        running: leftSignalOn
        repeat: true
        onTriggered: signalBlinkState = !signalBlinkState
    }


    // === Sol Panel (Göstergelerin bulunduğu alan) ===
    Rectangle {
        id: leftPanel
        width: parent.width * 0.9   // sol alan genişliği
        height: parent.height
        color: "black"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0


        Row {
            id: gaugesRow
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            // ==== Sıcaklık Göstergesi ====
            Rectangle {
                id: tempGauge
                width: leftPanel.width * 0.4
                height: width
                anchors.verticalCenter: parent.verticalCenter
                color:"black"
                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        ctx.lineWidth = width * 0.08

                        ctx.beginPath(); ctx.strokeStyle = "yellow"; ctx.arc(width/2, height/2, width*0.4, Math.PI * 0.75, Math.PI * 1.05); ctx.stroke()
                        ctx.beginPath(); ctx.strokeStyle = "green"; ctx.arc(width/2, height/2, width*0.4, Math.PI * 1.05, Math.PI * 1.25); ctx.stroke()
                        ctx.beginPath(); ctx.strokeStyle = "red"; ctx.arc(width/2, height/2, width*0.4, Math.PI * 1.25, Math.PI * 1.4); ctx.stroke()

                        ctx.fillStyle = "cyan"; ctx.font = "bold " + (width*0.15) + "px sans-serif"
                        ctx.fillText("50", width*0.15, height*0.85)
                        ctx.fillText("90", width*0.35, height*0.3)
                        ctx.fillText("130", width*0.77, height*0.25)
                    }
                }

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        ctx.fillStyle = "red"
                        var minAngle = 135
                        var maxAngle = -30
                        var t = (tempValue - 50) / (130 - 50)
                        var angle = (minAngle + (maxAngle - minAngle) * t) * Math.PI / 180

                        ctx.save()
                        ctx.translate(width/2, height/2)
                        ctx.rotate(angle)

                        ctx.beginPath()
                        ctx.moveTo(0,0)
                        ctx.lineTo(-width*0.02, height*0.07)
                        ctx.lineTo(0,-width*0.43)
                        ctx.lineTo(width*0.02, height*0.07)
                        ctx.closePath()
                        ctx.fill()

                        ctx.restore()
                    }
                }
            }

            // ==== Devir Göstergesi ====
            Rectangle {
                id: rpmGauge
                width: leftPanel.width * 0.6
                color: "black"
                height: width
                anchors.verticalCenter: parent.verticalCenter

                // Green turn signal indicator - anchored to rpm gauge
                Rectangle {
                    id: rightSignal
                    width: 40
                    height: 20
                    color: leftSignalOn ? (signalBlinkState ? "lime" : "#004400") : "#004400"
                    radius: 5
                    anchors {
                        bottom: rpmGauge.top  // rpmGauge'ın hemen üstüne
                        bottomMargin: 0       // Üstten biraz boşluk (isteğe göre ayarlayın)
                        horizontalCenter: rpmGauge.horizontalCenter
                        horizontalCenterOffset: -10  // Sağa kaydırmak için pozitif değer
                    }

                    Text {
                        text: "<-"
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

                        ctx.beginPath(); ctx.strokeStyle = "cyan"; ctx.arc(width/2, height/2, width*0.4, Math.PI * 0.75, Math.PI * 2.25); ctx.stroke()
                        ctx.beginPath(); ctx.strokeStyle = "yellow"; ctx.arc(width/2, height/2, width*0.4, Math.PI * 2.1, Math.PI * 2.2); ctx.stroke()
                        ctx.beginPath(); ctx.strokeStyle = "red"; ctx.arc(width/2, height/2, width*0.4, Math.PI * 2.2, Math.PI * 2.4); ctx.stroke()

                        ctx.fillStyle = "cyan"; ctx.font = "bold " + (width*0.07) + "px sans-serif"
                        let numbers = ["0","1","2","3","4","5","6","7","8"]
                        for (let i=0; i<=8; i++) {
                            let angle = Math.PI * (0.75 + (i*(1.5/8)))
                            let x = width/2 + Math.cos(angle)*width*0.34 - width*0.025
                            let y = height/2 + Math.sin(angle)*width*0.34 + width*0.025
                            ctx.fillText(numbers[i], x, y)
                        }

                        ctx.font = "bold " + (width*0.06) + "px sans-serif"
                        ctx.fillText("X1000", width/2 - width*0.13, height/2 - width*0.03)
                        ctx.fillText("min⁻¹", width/2 - width*0.1, height/2 + width*0.04)
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
                        var angle = (minAngle + (rpmValue/8)*(maxAngle-minAngle)) * Math.PI/180

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
        }

        RowLayout {
            id: controlBar
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: Math.min(parent.width - 20, 600)  // Maksimum 600 piksel veya parent genişliği-20
            height: 40  // Sabit yükseklik
            spacing: 0

            // Uyarı ikonları - Sabit boyutlu
            Row {
                id: warningIcons
                spacing: 15
                Layout.alignment: Qt.AlignVCenter
                Layout.maximumWidth: 150  // Maksimum genişlik sınırı

                Rectangle {
                    width: 20; height: 10; color: "red"
                    Layout.alignment: Qt.AlignVCenter
                }
                Rectangle {
                    width: 15; height: 15; radius: 7.5; color: "red"
                    Layout.alignment: Qt.AlignVCenter
                }
                Rectangle {
                    width: 20; height: 15; color: "red"
                    Layout.alignment: Qt.AlignVCenter
                }
            }

            // Sinyal kontrolü - Sabit boyutlu
            Row {
                spacing: 5
                Layout.alignment: Qt.AlignVCenter
                Layout.maximumWidth: 150

                Text {
                    text: "Left Signal:"
                    color: "white"
                    font.pixelSize: 12
                    Layout.maximumWidth: 60
                }
                Switch {
                            checked: leftSignalOn
                            onCheckedChanged: {
                                leftSignalOn = checked
                                if (checked) signalBlinkState = true
                            }
                            Layout.preferredWidth: 50
                }
            }
        }
    }
}
