import 'firebase_service.dart';
import 'package:flutter/material.dart';

class verAsistencia extends StatefulWidget {
  const verAsistencia({Key? key}) : super(key: key);

  @override
  State<verAsistencia> createState() => _verAsistenciaState();
}

class _verAsistenciaState extends State<verAsistencia> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text('Asistencias',),centerTitle: true, backgroundColor: Colors.green,),
      body: FutureBuilder(
          future: getAsistencias(arguments['asignacionid']),
          builder: (context,snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: const Icon(Icons.check_box),
                      title: Text(snapshot.data?[index]['fecha']),
                      subtitle: Text(snapshot.data?[index]['revisor']),
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
          await Navigator.pushNamed(context, '/insertarAsistencia',arguments: {
            "asignacionid" : arguments['asignacionid']
          });
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
