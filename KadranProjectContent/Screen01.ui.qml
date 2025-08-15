import QtQuick
import QtQuick.Controls
import KadranProject

Rectangle {
    id: rectangle
    width: 640
    height: 480
    color: Constants.backgroundColor

    // Sol Frame (Ekranın %30'u)
    Rectangle{
        id: frame2
        width: parent.width * 0.33
        color: black
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        SolKadran{
            id:solkadran
            anchors{
                fill: parent
            }
        }

    }

    // Orta Car (Kalan alanı doldurur)
    Car {
        id: car
        anchors {
            left: frame2.right
            right: frame1.left
            top: parent.top
            bottom: parent.bottom
        }
    }

    // Sağ Frame (Ekranın %30'u)
    Rectangle {
        id: frame1
        color:"black"
        width: parent.width * 0.33
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        SagKadran {
            id: sagKadran
            anchors{
                fill:parent
            }
        }
    }
}
