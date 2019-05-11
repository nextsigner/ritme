import QtQuick 2.0
import Qt.labs.folderlistmodel 2.2
Item{
    id:r
    height: flowSil.height
    property bool autoSpeak: false
    property int uSilPlayed: 0
    property int uWordPlayed: 0
    property bool uWordSpace: false
    property int fs: app.fs
    property var arrWords: []
    property color color: 'black'
    property string text: 'null'
    property var mp
    signal hoverWord(string word)
    signal clickedSil(string sil)

    Flow{
        id: flowWords
        width: r.width
        Repeater{
            id: repArrWords
            model: r.arrWords
            Mw{
                w: modelData;fs: r.fs;
                onClicked: {
                    //console.log('--->'+w+' --->>'+flowSil.height)
                    //w='-'+flowSil.height
                    console.log('----<<>>::'+modelData)
                    hoverWord(modelData)
                }
                //onHoverWord: hoverWord(word)
            }
        }
    }
    Text{
        id: txtLog
        width: r.width*0.8
        wrapMode: Text.WrapAnywhere
        font.pixelSize: app.fs
        anchors.centerIn: r
        color: 'red'
    }
    Component.onCompleted: {
        var  a=r.text.split(' ')
        for(var i=0;i<a.length;i++){
            r.arrWords.push(a[i])
            r.arrWords.push('espacio')
        }
        repArrWords.model=r.arrWords
    }
    function showWord(w){
        hoverWord(w)
    }
    function setSil(w){
        clickedSil(w)
    }
    function playNextSil(){
        //var uSil=0
        var cantWords=r.arrWords.length
        console.log('Cants Words: '+cantWords)
        if(!autoSpeak){
            return
        }
        var uWord=r.arrWords[r.uWordPlayed]
        var mSilsUWord
        mSilsUWord=uWord.split('-')


        var sil
        /*if(mSilsUWord.length===1){
            console.log('AAAAAA')
            sil=''+mSilsUWord[0]
        }else{
            console.log('BBBBBB')
            sil=''+mSilsUWord[r.uSilPlayed]
        }*/


        //if(r.uSilPlayed===mSilsUWord.length-1){
        //r.uSilPlayed=0
        sil=''+mSilsUWord[r.uSilPlayed]
        var nextWord=r.arrWords[r.uWordPlayed]
        if(sil==='espacio'||r.uSilPlayed===mSilsUWord.length-1){
            r.uWordPlayed++
            r.uSilPlayed=0
        }else{
            r.uSilPlayed++
        }
        if(mSilsUWord.length===1&&mSilsUWord[0]===' '){
            //r.uSilPlayed=0
            //r.uWordPlayed+=1
            //sil='espacio'
        }else{
            //r.uSilPlayed=0

            //playNextSil()
        }
        console.log('pppppp-->'+sil)
        clickedSil(sil)
        if(uWord===' '){
            //txtLog.text+='3'
            //r.uSilPlayed=0
            //r.uWordPlayed++
            //return
        }else{
            //txtLog.text+='1'+uWord
        }
        //txtLog.text+='X'+sil

        /*if(sil!==' '){
            clickedSil(sil)
            r.uSilPlayed++
        }else{
            r.uSilPlayed=0
            r.uWordPlayed++
            playNextSil()
        }*/


        /*if(){

        }*/
        //for(var i=0;i<cantSil;i++){

        //r.arrSil.push(' ')
        //}
    }
}
