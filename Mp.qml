import QtQuick 2.0
import QtMultimedia 5.0
import Qt.labs.folderlistmodel 2.2
Item{
    id:r
    height: app.fs*4
    property alias mp: mediaPlayer
    property var arrSil:[]
    signal playSilFinished
    MediaPlayer {
        id: mediaPlayer
        property bool p
        property bool paused
        volume: appSettings.volume
        onStopped: {
            playSilFinished()
        }
        onPositionChanged:{
            /*if(position!==0&&position>0&&position===duration){
                console.log('p-->'+position+' d-->'+duration)
                playSilFinished()
            }*/
        }
    }

    Row{
        id: rowWordMp
        anchors.centerIn: r
        Repeater{
            id: repPWord
            model: r.arrSil
            Rectangle{
                width: wt.contentWidth
                height: wt.contentHeight
                color: activa?app.c2:app.c1
                border.width: 0
                border.color: 'red'
                property bool activa: false
                Text{
                    id: wt
                    font.pixelSize: app.fs*3
                    color: activa?app.c1:app.c2
                    anchors.centerIn: parent
                    text: modelData
                }
            }
        }
    }
    function setWord(w){
        r.arrSil=w.split('-')
    }
    function setSil(s){
        mediaPlayer.source='./sils/nextsigner/'+(''+s).toLowerCase()+'.wav'
        mediaPlayer.play()
        for(var i=0;i<rowWordMp.children.length-1;i++){
            rowWordMp.children[i].activa=rowWordMp.children[i].children[0].text===s
            if(rowWordMp.children[i].children[0].text===s){
                rowWordMp.children[i].border.width=4
            }else{
                rowWordMp.children[i].border.width=0
            }
        }
    }
}
