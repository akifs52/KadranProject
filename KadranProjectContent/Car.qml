import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import KadranProject 1.0
import Generated.QtQuick3D.Node2012_lamborghini_aventador
import QtQuick3D 6.7
import QtQuick3D.Helpers

Rectangle {
    id: rectangle
    color: "#aeacac"
    width: 640
    height: 480

    property bool leftDoorOpen: false
    property bool rightDoorOpen: false
    property real wheelRotation: 0
    property bool wheelsSpinning: false

    // Orijinal pozisyon & rotasyon saklama
    property var leftDoorOriginalRotation: []
    property var leftDoorOriginalY: []
    property var rightDoorOriginalRotation: []
    property var rightDoorOriginalY: []

    // Node bulma fonksiyonunu güncelledik
    function findDoorNodes(side) {
        var nodes = []
        if (side === "left") {
            // Sol kapı için tüm ilgili node'ları ekleyin
            var leftDoor = findNode(lambo, "LOD_A_DOOR_LEFT_mm_ext_25")
            if (leftDoor) nodes.push(leftDoor)
            leftDoor = findNode(lambo, "LOD_A_DOOR_LEFT_mm_misc_29")
            if (leftDoor) nodes.push(leftDoor)
            leftDoor = findNode(lambo, "LOD_A_DOOR_LEFT_mm_cab_43")
            if (leftDoor) nodes.push(leftDoor)
        } else if (side === "right") {
            // Sağ kapı için tüm ilgili node'ları ekleyin
            var rightDoor = findNode(lambo, "LOD_A_DOOR_RIGHT_mm_ext_19")
            if (rightDoor) nodes.push(rightDoor)
            rightDoor = findNode(lambo, "LOD_A_DOOR_RIGHT_mm_misc_6")
            if (rightDoor) nodes.push(rightDoor)
            rightDoor = findNode(lambo, "LOD_A_DOOR_RIGHT_mm_cab_5")
            if (rightDoor) nodes.push(rightDoor)
        }
        console.log("Found", side, "door nodes:", nodes.length)
        return nodes
    }

    function findNode(parent, name) {
        if (!parent) return null
        if (parent.objectName === name) return parent
        for (var i = 0; i < parent.children.length; i++) {
            var child = parent.children[i]
            var found = findNode(child, name)
            if (found) return found
        }
        return null
    }

    // Orijinal değerleri kaydet
    function cacheDoorDefaults() {
        var leftNodes = findDoorNodes("left")
        leftDoorOriginalRotation = leftNodes.map(n => Qt.vector3d(n.eulerRotation.x, n.eulerRotation.y, n.eulerRotation.z))
        leftDoorOriginalY = leftNodes.map(n => n.y)

        var rightNodes = findDoorNodes("right")
        rightDoorOriginalRotation = rightNodes.map(n => Qt.vector3d(n.eulerRotation.x, n.eulerRotation.y, n.eulerRotation.z))
        rightDoorOriginalY = rightNodes.map(n => n.y)
    }

    View3D {
        id: view3D
        anchors.fill: parent
        environment: sceneEnvironment

        SceneEnvironment {
            id: sceneEnvironment
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.MSAA
        }

        Node {
            id: scene
            DirectionalLight {
                brightness: 0.8
                eulerRotation: Qt.vector3d(-90, 0, 0)
            }

            PerspectiveCamera {
                id: sceneCamera
                x: 0
                y: 250
                z: -600
                eulerRotation.x: -15
                eulerRotation.y: 180
            }

            Node2012_lamborghini_aventador {
                id: lambo
                scale: Qt.vector3d(100, 100, 100)
                eulerRotation: Qt.vector3d(-10, 0, 0)
                x: 0
                y: 50
                z: 0
            }

            Model {
                id: road
                source: "#Cube"
                y: -5
                scale: Qt.vector3d(20, 1, 500)
                materials: roadMaterial
                eulerRotation: Qt.vector3d(
                    lambo.eulerRotation.x,
                    lambo.eulerRotation.y,
                    lambo.eulerRotation.z
                )

                Node {
                    id: middleLine
                    y: 0
                    property real lineLength: 5
                    property real gapLength: 7
                    property real lineWidth: 0.5
                    property real lineHeight: 0.05
                    property int lineCount: 50
                    property real totalLength: (lineLength + gapLength) * lineCount

                    Repeater3D {
                        model: middleLine.lineCount
                        Model {
                            source: "#Cube"
                            materials: [ yellowMaterial ]
                            x: 0
                            y: 0
                            z: index * (middleLine.lineLength + middleLine.gapLength) - middleLine.totalLength/2
                            scale: Qt.vector3d(middleLine.lineWidth, middleLine.lineHeight, middleLine.lineLength)
                        }
                    }
                }
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            property real lastX: 0
            property real lastY: 0
            property real velX: 0
            property real velY: 0
            property bool dragging: false

            onPressed: {
                lastX = mouse.x
                lastY = mouse.y
                dragging = true
                velX = 0
                velY = 0
            }

            onReleased: dragging = false

            onPositionChanged: {
                if (mouse.buttons & Qt.LeftButton) {
                    let dx = mouse.x - lastX
                    let dy = mouse.y - lastY
                    lambo.eulerRotation.y += dx * 0.5
                    lambo.eulerRotation.x += dy * 0.5
                    velX = dx * 0.5
                    velY = dy * 0.5
                    lastX = mouse.x
                    lastY = mouse.y
                }
            }
        }

        WheelHandler {
            id: wheelHandler
            target: sceneCamera
            property real zoomSpeed: 10
            onWheel: {
                sceneCamera.z += wheel.angleDelta.y > 0 ? -zoomSpeed : zoomSpeed
            }
        }

        Timer {
            id: inertiaTimer
            interval: 16
            running: true
            repeat: true
            onTriggered: {
                if (!mouseArea.dragging) {
                    mouseArea.velX *= 0.95
                    mouseArea.velY *= 0.95
                    lambo.eulerRotation.y += mouseArea.velX
                    lambo.eulerRotation.x += mouseArea.velY
                    if (Math.abs(mouseArea.velX) < 0.01 &&
                        Math.abs(mouseArea.velY) < 0.01) {
                        mouseArea.velX = 0
                        mouseArea.velY = 0
                    }
                }
            }
        }
    }

    RowLayout {
        id: controlButtonsRow
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 10
        }
        width: Math.min(parent.width * 0.9, 600)
        height: 50
        spacing: 5

        Button {
            text: leftDoorOpen ? "Close Left Door" : "Open Left Door"
            Layout.fillWidth: true
            Layout.preferredWidth: 200
            onClicked: {
                leftDoorOpen = !leftDoorOpen
                console.log("Left door button clicked, open state:", leftDoorOpen)
                leftDoorAnimation.start()
            }
        }

        Button {
            text: rightDoorOpen ? "Close Right Door" : "Open Right Door"
            Layout.fillWidth: true
            Layout.preferredWidth: 200
            onClicked: {
                rightDoorOpen = !rightDoorOpen
                console.log("Right door button clicked, open state:", rightDoorOpen)
                rightDoorAnimation.start()
            }
        }

        Button {
            text: wheelsSpinning ? "Stop Wheels" : "Spin Wheels"
            Layout.fillWidth: true
            Layout.preferredWidth: 200
            onClicked: {
                wheelsSpinning = !wheelsSpinning
                wheelAnimation.running = wheelsSpinning
            }
        }
    }

    // Başlangıçta pivot ayarı + değer saklama
    Component.onCompleted: {
        var leftNodes = findDoorNodes("left")
        leftNodes.forEach(n => { n.pivot = Qt.vector3d(0, 0, 0) }) // menteşe tarafı (sol)
        var rightNodes = findDoorNodes("right")
        rightNodes.forEach(n => { n.pivot = Qt.vector3d(0, 0, 0) })  // menteşe tarafı (sağ)
        cacheDoorDefaults()
    }

    // --- Sol kapı animasyonu ---
    ParallelAnimation {
        id: leftDoorAnimation

        // Rotasyon animasyonları
        SequentialAnimation {
            PropertyAnimation {
                targets: findDoorNodes("left")
                property: "eulerRotation.x"
                to: leftDoorOpen
                    ? leftDoorOriginalRotation[0].x - 70
                    : leftDoorOriginalRotation[0].x
                duration: 1000
                easing.type: Easing.OutBack
            }
        }

        // Y ekseni animasyonları (kapı yukarı kalkma)
        SequentialAnimation {
            PropertyAnimation {
                targets: findDoorNodes("left")
                property: "y"
                to: leftDoorOpen
                    ? leftDoorOriginalY[0] + 15
                    : leftDoorOriginalY[0]
                duration: 1000
                easing.type: Easing.OutQuad
            }
        }
    }

    // --- Sağ kapı animasyonu ---
    ParallelAnimation {
        id: rightDoorAnimation

        // Rotasyon animasyonları
        SequentialAnimation {
            PropertyAnimation {
                targets: findDoorNodes("right")
                property: "eulerRotation.x"
                to: rightDoorOpen
                    ? rightDoorOriginalRotation[0].x + 70
                    : rightDoorOriginalRotation[0].x
                duration: 1000
                easing.type: Easing.OutBack
            }
        }

        // Y ekseni animasyonları (kapı yukarı kalkma)
        SequentialAnimation {
            PropertyAnimation {
                targets: findDoorNodes("right")
                property: "y"
                to: rightDoorOpen
                    ? rightDoorOriginalY[0] + 15
                    : rightDoorOriginalY[0]
                duration: 1000
                easing.type: Easing.OutQuad
            }
        }
    }

    NumberAnimation {
        id: wheelAnimation
        target: rectangle
        property: "wheelRotation"
        from: 0
        to: 360
        duration: 1000
        loops: Animation.Infinite
        running: false
        onRunningChanged: {
            if (running) {
                wheelRotation = 0
            }
        }
    }

    onWheelRotationChanged: {
        if (lambo) {
            var frontLeftWheel = findNode(lambo, "LOD_A_WHEEL_mm_wheel_8")
            var frontRightWheel = findNode(lambo, "LOD_A_WHEEL_mm_wheel.003_0")
            var rearLeftWheel = findNode(lambo, "LOD_A_WHEEL_mm_wheel.001_2")
            var rearRightWheel = findNode(lambo, "LOD_A_WHEEL_mm_wheel.002_1")

            if (frontLeftWheel) frontLeftWheel.eulerRotation.x = wheelRotation
            if (frontRightWheel) frontRightWheel.eulerRotation.x = wheelRotation
            if (rearLeftWheel) rearLeftWheel.eulerRotation.x = wheelRotation
            if (rearRightWheel) rearRightWheel.eulerRotation.x = wheelRotation
        }
    }

    Item {
        id: __materialLibrary__
        DefaultMaterial {
            id: roadMaterial
            diffuseColor: "#222222"
            specularAmount: 0.1
            specularRoughness: 0.9
        }

        DefaultMaterial {
            id: yellowMaterial
            diffuseColor: "#FFFF00"
            specularAmount: 0.3
            specularRoughness: 0.7
        }
    }
}
/*##^##
Designer {
    D{i:0;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
D{i:3;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
