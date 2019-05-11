import QtQuick 2.0
import QtMultimedia 5.0
import 'PlaySil.js' as PlaySil

Rectangle {
    id: r
    color: "transparent"
    width: app.an
    height: app.fs*2
    property url source: mediaPlayer.source
    property alias mp: mediaPlayer
    property var mMsSil: []
    property var arrayWord: []
    property int uNumSilPlay: 0
    property int reduccion: 0
    property string carPrev: '~'
    property var arraySilsTodo:[]
    onArrayWordChanged: {
        if(arrayWord.length===0){
            r.carPrev='~'
        }
    }
    MediaPlayer {
        id: mediaPlayer
        property bool p
        property bool paused
        property int to: 0
        volume: appSettings.volume
        source: 'samples.wav'
        onPlaying: {
            tstop.running=true
            p=true
            paused=false
        }
        onPaused: {
            p=false
            paused=true
        }
        onStopped: {
            p=false
            paused=false
        }
        onStatusChanged: {
            if(status===MediaPlayer.EndOfMedia){
                //app.verAyuda=true
            }
        }
    }
    Timer{
        id: tstop
        repeat: true
        running: false
        interval: 1
        onTriggered: {
            if(mediaPlayer.position>=mediaPlayer.to){
                tstop.running=false
                mediaPlayer.stop()
                if(uNumSilPlay!==arrayWord.length-1){
                    uNumSilPlay++
                    playSil(arrayWord[uNumSilPlay])
                }else{
                    uNumSilPlay=0
                }
            }
        }
    }
    Timer{
        id: tSpace
        repeat: false
        running: false
        interval: 600
        onTriggered: {
            if(mediaPlayer.position>=mediaPlayer.to){
                tstop.running=false
                mediaPlayer.stop()
                if(uNumSilPlay!==arrayWord.length-1){
                    uNumSilPlay++
                    playSil(arrayWord[uNumSilPlay])

                }else{
                    uNumSilPlay=0
                }
            }
        }
    }
    Timer{
        id: tSetSilsTodo
        repeat: false
        running: false
        interval: 3000
        onTriggered: {
            if(mediaPlayer.position>=mediaPlayer.to){
                tstop.running=false
                mediaPlayer.stop()
                if(uNumSilPlay!==arrayWord.length-1){
                    uNumSilPlay++
                    playSil(arrayWord[uNumSilPlay])

                }else{
                    uNumSilPlay=0
                }
            }
        }
    }
    Component.onCompleted: {
            r.arraySilsTodo=(''+unik.getFile('sils-todo')).split('\n')
    }

    function playSil(s){
        if(typeof s === 'string'){
            if(app.arraySilabas.indexOf(s)<0){
                if(s==='|'){
                    mediaPlayer.seek(app.jsonSilabas['|'][0]+r.reduccion)
                    mediaPlayer.to=app.jsonSilabas['|'][1]-r.reduccion
                }else{
                    console.log('PS0: ['+s+']')
                    return
                }
            }else{
                var ns=''+s
                if(s[0]==='r'&&s.length===2&&r.carPrev==='|'){
                                ns='r'+s
                 }
                console.log('NS: '+ns+' CARPREV: '+r.carPrev)
                mediaPlayer.seek(app.jsonSilabas[ns][0]+r.reduccion)
                mediaPlayer.to=app.jsonSilabas[ns][1]-r.reduccion
            }
        }else{
            console.log('PS2: '+s)
            var ss=app.arraySilabas[getNumSil(s)]
            console.log('SS: '+ss)
            mediaPlayer.seek(app.jsonSilabas[ss][0]+r.reduccion)
            mediaPlayer.to=app.jsonSilabas[ss][1]-r.reduccion
        }
        if(s==='|'){
              r.carPrev='|'
         }else{
               r.carPrev='@'
        }
        tstop.running=true
        mediaPlayer.play()
    }
    function getNumSil(s){
        var n=-1
        for(var i=0;i<app.arraySilabas.length;i++){
            if(s===app.arraySilabas[i]){
                return i;
            }
        }
        return n;
    }   
}
