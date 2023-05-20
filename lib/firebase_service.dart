import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getAsignacion() async{
  List asignaciones = [];
  CollectionReference coleccionAsignaciones = db.collection('asignacion');
  QuerySnapshot queryAsignaciones = await coleccionAsignaciones.orderBy('horario', descending: true).get();
  queryAsignaciones.docs.forEach((documento){
    final Map<String,dynamic> data = documento.data() as Map<String,dynamic>;
    final asignacion = {
      "docente": data['docente'],
      "edificio" : data['edificio'],
      "horario" : data['horario'],
      "materia": data['materia'],
      "salon": data['salon'],
      "asignacionid" : documento.id
    };
    asignaciones.add(asignacion);
  });
  //await Future.delayed(const Duration(seconds:1));
  return asignaciones;
}

Future<void> agregarAsignacion(Map<String, dynamic> datosAsignacion) async {
  CollectionReference coleccionAsiganciones = db.collection('asignacion');
  await coleccionAsiganciones.add(datosAsignacion);
}

Future<void> actualizarAsignacion(String id, Map<String, dynamic> datosAsignacion) async {
  CollectionReference coleccionAsiganciones = db.collection('asignacion');
  await coleccionAsiganciones.doc(id).update(datosAsignacion);
}

Future<void> eliminarAsignacion(String id) async{
  await db.collection('asignacion').doc(id).delete();
}

Future<List> getAsistencias(String idAsistencias) async{
  List asistencias = [];
  CollectionReference asignacionesReference = db.collection('asignacion');
  DocumentReference asignacionReference = asignacionesReference.doc(idAsistencias);
  CollectionReference asistenciaReference = asignacionReference.collection('asistencia');
  QuerySnapshot querySnapshot = await asistenciaReference.orderBy('fecha', descending: true).get();
  querySnapshot.docs.forEach((documento){
    final Map<String,dynamic> asistenciaData = documento.data() as Map<String,dynamic>;
    final asistencia = {
      "fecha": asistenciaData['fecha'],
      "revisor": asistenciaData['revisor'],
      "asistenciaid":documento.id
    };
    asistencias.add(asistencia);
  });
  return asistencias;
}

Future<void> agregarAsistencia(String idAsistencia, Map<String, dynamic> asistencia) async {
  CollectionReference coleccionAsignacion = db.collection('asignacion');
  DocumentReference docAsignacion = coleccionAsignacion.doc(idAsistencia);
  CollectionReference asistenciasCollection = docAsignacion.collection('asistencia');
  await asistenciasCollection.add(asistencia);
}

Future<List> consulta4(String Busqueda) async{
  List asistencias = [];

  final AsistenciaSnapshot = await db.collectionGroup('asistencia').orderBy('revisor')
      .startAt([Busqueda])
      .endAt([Busqueda + '\uf8ff'])
      .where('revisor', isGreaterThanOrEqualTo: Busqueda)
      .where('revisor', isLessThan: Busqueda + 'z')
      .get();

  for(var doc in AsistenciaSnapshot.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    String revisordata = data['revisor'];
    if(revisordata == Busqueda){
      final asistencia = {
        'fecha': data['fecha'],
        'revisor': data['revisor'],
        "id": doc.id,
      };
      asistencias.add(asistencia);
    }

  }
  return asistencias;
}

/*
Future<List> buscarBitacora(String fecha) async{
  List bitacoras = [];
  QuerySnapshot querySnapshot = await db.collectionGroup('BITACORA').where('fecha',isEqualTo: fecha).get();
  querySnapshot.docs.forEach((documento){
    final Map<String,dynamic> bitacoraData = documento.data() as Map<String,dynamic>;
    final bitacora = {
      "fecha": bitacoraData['fecha'],
      "evento": bitacoraData['evento'],
      "recursos": bitacoraData['recursos'],
      "verifico": bitacoraData['verifico'],
      "fechaverificacion": bitacoraData['fechaverificacion'],
      "bid":documento.id
    };
    bitacoras.add(bitacora);
  });
  await Future.delayed(const Duration(seconds:1));
  return bitacoras;
}

Future<List> buscarVehiculosUso() async{
  List vehiculos = [];
  //QuerySnapshot querySnapshot = await db.collection('vehiculo').where('/BITACORA.fechaverificacion',isEqualTo:"12/12/2020").get();
  QuerySnapshot querySnapshot = await db.collectionGroup('BITACORA').where('fechaverificacion',isEqualTo: "").get();
  querySnapshot.docs.forEach((documento){
    DocumentReference autoPadre = documento.reference.parent.parent as DocumentReference<Object?>;
    autoPadre.get().then((autodoc) {
      final Map<String,dynamic> data = autodoc.data() as Map<String,dynamic>;
      final auto = {
        "placa": data['placa'],
        "tipo" : data['tipo'],
        "numeroserie": data['numeroserie'],
        "combustible": data['combustible'],
        "tanque" : data['tanque'],
        "trabajador" : data['trabajador'],
        "depto": data['depto'],
        "resguardadopor":data['resguardadopor'],
        "aid" : autodoc.id
      };
      vehiculos.add(auto);
    });
  });
  await Future.delayed(const Duration(seconds:1));
  return vehiculos;
}*/
