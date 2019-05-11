import QtQuick 2.0
Rectangle{
    id: r
    property string sils
    width: row.width
    height: app.fs
    color: 'transparent'
    border.color: 'red'
    border.width: 2
    Row{
        id: row
        spacing: app.fs*0.5
        Repeater{
            id: rep2
            Text {
                id: fff
                text: '---'+modelData+'XXX'
                font.pixelSize: 30
                color: 'white'
            }
            //                                BotonUX{
            //                                    id: botSil
            //                                    text: modelData
            //                                    backgroudColor: parseInt(app.jsonSilabas[modelData][0])===-1?'red':app.c3
            //                                    fontColor: parseInt(app.jsonSilabas[modelData][0])===-1?'yellow':app.c2
            //                                    speed: 250
            //                                    clip: false
            //                                    visible: modelData!=='|'&&modelData!==''
            //                                    onClick: {
            //                                        r.uSilPlayed=modelData
            //                                        tReqAbierto.v++
            //                                        tReqAbierto.restart()
            //                                        focus= true
            //                                        ms.arrayWord=[]
            //                                        ms.playSil(modelData)
            //                                    }
            //                                    Timer{
            //                                        id: tReqAbierto
            //                                        running: false
            //                                        repeat: false
            //                                        interval: 500
            //                                        property int v: 0
            //                                        onTriggered: {
            //                                            if(v>=2){
            //                                                parent.abierto=!parent.abierto
            //                                            }
            //                                            v=0
            //                                        }
            //                                    }
            //                                    property bool abierto: false
            //                                    focus: true
            //                                    Keys.onSpacePressed: {
            //                                        r.addSilFail(modelData)
            //                                    }
            //                                    Keys.onRightPressed: {
            //                                        ms.mp.stop()
            //                                    }
            //                                    Keys.onLeftPressed: {
            //                                        ms.mp.stop()
            //                                    }
            //                                    Keys.onUpPressed: {
            //                                        ms.mp.stop()
            //                                    }
            //                                    Keys.onDownPressed: {
            //                                        ms.mp.stop()
            //                                    }
            //                                    Keys.onReturnPressed:  {
            //                                        ms.mp.play()
            //                                    }
            //                                    Rectangle{
            //                                        id: rect
            //                                        width: parent.width
            //                                        height: parent.height
            //                                        color: 'transparent'
            //                                        border.width: 4
            //                                        border.color: 'yellow'
            //                                        anchors.centerIn: parent
            //                                        visible: parent.abierto
            //                                    }
            //                                    Component.onCompleted: {
            //                                        if((''+modelData).indexOf('!')>0){
            //                                            c1='red'
            //                                            c2='yellow'
            //                                            parent.visible=false
            //                                        }
            //                                    }
            //                                }
        }
        Component.onCompleted: {
            rep2.model=r.sils.split('|')
            console.log('AAAA'+sils)
        }
    }
}
