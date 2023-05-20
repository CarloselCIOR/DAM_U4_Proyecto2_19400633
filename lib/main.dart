
import 'package:dam_u4_proyecto2_19400633/asistencia_insertar.dart';
import 'package:dam_u4_proyecto2_19400633/consultas.dart';
import 'package:dam_u4_proyecto2_19400633/verAsistencia.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'asignacion_actualizar.dart';
import 'asignacion_insertar.dart';
import 'firebase_options.dart';
import 'principal.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Proyecto 2',
      initialRoute: '/',
      routes: {
        '/': (context) => Principal(),
        '/insertarAsignacion': (context) => InsertarAsignacion(),
        '/actualizarAsignacion' : (context) => ActualizarAsignacion(),
        '/verAsistencias' : (context) => verAsistencia(),
        '/insertarAsistencia' : (context) => InsertarAsistencia(),
        '/consutlas': (context) => Consultas(),
        /*'/verBfecha':(context) => VerBitacorasFecha(),
        '/vehiculoUso': (context) => VehiculoEnUso()*/
      },
    );
  }
}
