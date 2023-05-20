import 'package:dam_u4_proyecto2_19400633/firebase_service.dart';
import 'package:flutter/material.dart';
class ActualizarAsignacion extends StatefulWidget {
  const ActualizarAsignacion({Key? key}) : super(key: key);

  @override
  State<ActualizarAsignacion> createState() => _ActualizarAsignacionState();
}

class _ActualizarAsignacionState extends State<ActualizarAsignacion> {


  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    TextEditingController docenteController = TextEditingController(text: arguments['docente']);
    TextEditingController edificioController = TextEditingController(text: arguments['edificio']);
    TextEditingController horarioController = TextEditingController(text: arguments['horario']);
    TextEditingController materiaController = TextEditingController(text: arguments['materia']);
    TextEditingController salonController = TextEditingController(text: arguments['salon']);

    return Scaffold(
      appBar: AppBar(title: const Text('Modificar Asignacion'), backgroundColor: Colors.green,),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
                controller: materiaController,
                decoration: InputDecoration(
                  labelText: 'Materia:',)
            ),

            TextField(
                controller: docenteController,
                decoration: InputDecoration(
                  labelText: 'Docente:',)
            ),

            TextField(
                controller: horarioController,
                decoration: InputDecoration(
                  labelText: 'Horario:',)
            ),

            TextField(
                controller: edificioController,
                decoration: InputDecoration(
                  labelText: 'Edificio:',)
            ),

            TextField(
                controller: salonController,
                decoration: InputDecoration(
                  labelText: 'Salon:',)
            ),

            SizedBox(height: 20,),

            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () async{
                  Map<String, dynamic> asignacion = {
                    "materia": materiaController.text,
                    "docente": docenteController.text,
                    "horario": horarioController.text,
                    "edificio": edificioController.text,
                    "salon": salonController.text,
                  };
                  await actualizarAsignacion(arguments['asignacionid'], asignacion).then((_){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                }, child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
