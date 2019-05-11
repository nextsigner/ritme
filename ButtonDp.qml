import QtQuick 2.0
import QtMultimedia 5.0
Item {
    id: r
    width: app.fs*2
    height: width
    clip: true
    property int fs: r.width*0.2
    property string text
    property color backgroudColor: app.c3
    property color fontColor: app.c2
    property alias t: l.text
    property int numero
    MediaPlayer {
        id: mediaPlayer
        volume: appSettings.volume
        source: 'file://'+app.qlandPath+'/original_samples_v1/'+r.text+'.wav'
    }
    Rectangle{
        id: xR1
        color: 'transparent'
        border.width: app.fs*0.1
        border.color: r.fontColor
        radius: app.fs*0.2
        width: r.width
        height: r.height
        Rectangle{
            id: b1
            opacity: 0.0
            width: parent.width-parent.border.width
            height: parent.height-parent.border.width
            radius: parent.radius
            anchors.centerIn: parent
            color: app.c2
            SequentialAnimation{
                id: anB1
                running: false
                NumberAnimation {
                    target: b1
                    property: "opacity"
                    duration: mediaPlayer.duration
                    from: 1.0
                    to: 0.0
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
    Text {
        id: a
        text:(''+r.text).replace(/-/g,' ')
        width: r.width-app.fs
        font.pixelSize: r.fs*0.8
        color: r.fontColor
        anchors.centerIn: parent
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: l
        width: r.width-app.fs
        font.pixelSize: r.width*0.25
        color: 'red'
        anchors.top: parent.top
        anchors.topMargin: app.fs*0.1
        anchors.right: parent.right
        anchors.rightMargin: app.fs*0.1
        visible: Qt.platform.os!=='android'
    }
    Text {
        id: txtNumero
        width: app.fs
        font.pixelSize: r.width*0.25
        anchors.top: parent.top
        anchors.topMargin: app.fs*0.1
        anchors.left: parent.left
        anchors.leftMargin: app.fs*0.1
        color: app.c1
        text: parseInt(r.numero)
    }
    MouseArea{
        id: maBX
        hoverEnabled: true
        anchors.fill: r
        property bool p: false
        onPressed: {
            p=true
            mediaPlayer.seek(0)
            mediaPlayer.play()
            anB1.restart()
        }
        onReleased: {
            p=false
        }
    }
    function play(){
        mediaPlayer.seek(0)
        mediaPlayer.play()
        anB1.restart()
    }
}
