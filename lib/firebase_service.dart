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

  final AsistenciaSnapshot = await db.collectionGroup('asistencia').get();

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

Future<List> consulta1(String Busqueda) async{
  List asistencias = [];

  QuerySnapshot queryAsigDocente = await db.collection('asignacion').where('docente',isEqualTo: Busqueda).get();
  queryAsigDocente.docs.forEach((docAsig) async{
    QuerySnapshot queryAsisDocente = await db.collection('asignacion').doc(docAsig.id).collection('asistencia').get();
    queryAsisDocente.docs.forEach((docAsis){
      final Map<String,dynamic> data = docAsis.data() as Map<String,dynamic>;
      Map<String,dynamic> asistencia = {
        "fecha": data['fecha'],
        "revisor": data['revisor']
      };
      asistencias.add(asistencia);
    });
  });
  await Future.delayed(const Duration(seconds: 1));
  return asistencias;
}


