var silMsLocation='./'
var jsonSil=''
var silabas=[];

function setDataSils(){
    if(unik.fileExist(silMsLocation+'/samples.txt')){
        console.log('Cargando samples: '+silMsLocation+'/samples.txt')
        var s=''+unik.getFile(silMsLocation+'/samples.txt')
        app.arraySilabas=s.split('\n')
        s=''+unik.getFile(silMsLocation+'/mssils.txt')
        app.arrayMsSils=s.split('\n')
        setSil()
    }else{
        console.log('Error! al cargar samples: '+silMsLocation+'/samples.txt')
    }
}

function setSil(){
    var data=''
    jsonSil=''
    console.log('Cantidad de Silabas: '+silabas.length)

    if(!unik.fileExist(silMsLocation)){
        unik.mkdir(silMsLocation)
    }
    for(var i=0; i<app.arraySilabas.length;i++){
        if(app.arrayMsSils[i]){
            var m0=(''+app.arrayMsSils[i]).split(' ')
            data+='"'+app.arraySilabas[i]+'":['+m0[0]+',   '+m0[1]+']'
        }else{
            data+='"'+app.arraySilabas[i]+'":[-1,   -1]'
        }
        //if(i!==app.arraySilabas.length-1){
            data+=',   '
        //}
        data+='\n'
    }
    data+='"|":[0,   10]'
    data+='\n'
    jsonSil+='{\n'
    jsonSil+=data
    jsonSil+='}\n'
    try {
            app.jsonSilabas=JSON.parse(jsonSil);
        } catch(e) {
            console.log('Error al crear app.jsonSilabas!')
        }

    //unik.setFile('jsonSil.json', jsonSil)
}



function setJsonSilFromMsData(arrayMsData){
    var data=''
    console.log('Cantidad de Silabas: '+silabas.length)
    console.log('Cantidad de MsData: '+arrayMsData.length)

    for(var i=0; i<silabas.length;i++){

        if(arrayMsData[i+1][0]){
            var ms=arrayMsData[i][1]+' '+arrayMsData[i+1][0]
            unik.setFile(silMsLocation+'/'+silabas[i], ms)
        }else{
            console.log(':::'+i)
        }
    }
}
