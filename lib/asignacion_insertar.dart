import 'package:dam_u4_proyecto2_19400633/firebase_service.dart';
import 'package:flutter/material.dart';
class InsertarAsignacion extends StatefulWidget {
  const InsertarAsignacion({Key? key}) : super(key: key);

  @override
  State<InsertarAsignacion> createState() => _InsertarAsignacionState();
}

class _InsertarAsignacionState extends State<InsertarAsignacion> {
  TextEditingController docenteController = TextEditingController();
  TextEditingController edificioController = TextEditingController();
  TextEditingController horarioController = TextEditingController();
  TextEditingController materiaController = TextEditingController();
  TextEditingController salonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva Asignacion'), backgroundColor: Colors.green,),
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
              await agregarAsignacion(asignacion).then((_){
                Navigator.pop(context);
              });
            }, child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
