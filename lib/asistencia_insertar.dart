import 'firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoDatePicker;

class InsertarAsistencia extends StatefulWidget {
  const InsertarAsistencia({Key? key}) : super(key: key);

  @override
  State<InsertarAsistencia> createState() => _InsertarAsistenciaState();
}

class _InsertarAsistenciaState extends State<InsertarAsistencia> {
  TextEditingController horaController = TextEditingController();
  TextEditingController revisorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    horaController.text = now.toString();

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva Asistencia'),),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: horaController,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Fecha y hora:',),
            ),

            TextField(
                controller: revisorController,
                decoration: InputDecoration(
                  labelText: 'Revisor:',)
            ),

            ElevatedButton(onPressed: () async{
              Map<String, dynamic> asistencia = {
                "fecha": horaController.text,
                "revisor":revisorController.text,
              };
              await agregarAsistencia(arguments['asignacionid'],asistencia).then((_){
                Navigator.pop(context);
              });
            }, child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
