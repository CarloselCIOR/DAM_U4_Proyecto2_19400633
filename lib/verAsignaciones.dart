import 'package:flutter/material.dart';
import 'firebase_service.dart';

class Asignaciones extends StatefulWidget {
  const Asignaciones({Key? key}) : super(key: key);

  @override
  State<Asignaciones> createState() => _AsignacionesState();
}

class _AsignacionesState extends State<Asignaciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tec Asistencia'),centerTitle: true, backgroundColor: Colors.green,),
      body: FutureBuilder(
          future: getAsignacion(),
          builder: (context,snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.margin),
                      title: Text(snapshot.data?[index]['materia']),
                      subtitle: Text(snapshot.data?[index]['edificio'] + " - " + snapshot.data?[index]['salon'] + "\n" + snapshot.data?[index]['docente']),
                      trailing: Text(snapshot.data?[index]['horario']),
                      onTap: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('¿Que desea hacer con la materia "${snapshot.data?[index]['materia']}"?'),
                            actions: [
                              TextButton(
                                child: const Text('Eliminar'),
                                onPressed: () {
                                  showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(title: Text('¿Esta seguro que desea eliminarlo?'),
                                      actions: [
                                        TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Cancelar')),
                                        TextButton(onPressed: (){
                                          eliminarAsignacion(snapshot.data?[index]['asignacionid']);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          setState(() {});
                                        }, child: const Text('Eliminar'))
                                      ],);
                                  });
                                },
                              ),
                              TextButton(
                                child: const Text('Actualizar'),
                                onPressed: () async{
                                  await Navigator.pushNamed(context,'/actualizarAsignacion',arguments:{
                                    "docente": snapshot.data?[index]['docente'],
                                    "edificio" : snapshot.data?[index]['edificio'],
                                    "horario": snapshot.data?[index]['horario'],
                                    "materia": snapshot.data?[index]['materia'],
                                    "salon" : snapshot.data?[index]['salon'],
                                    "asignacionid":snapshot.data?[index]['asignacionid']
                                  });
                                  setState(() {});
                                },
                              ),
                              TextButton(
                                child: const Text('Ver Asistencias'),
                                onPressed: () async{
                                  await Navigator.pushNamed(context, '/verAsistencias',arguments: {
                                    "asignacionid":snapshot.data?[index]['asignacionid'],
                                    "fecha":snapshot.data?[index]['fecha'],
                                    "revisor":snapshot.data?[index]['revisor']
                                  });
                                },
                              ),
                            ],
                          );
                        });
                      },
                    );
                  }
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.pushNamed(context, '/insertarAsignacion');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),

    );;
  }
}
