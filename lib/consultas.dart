import 'package:flutter/material.dart';
import 'firebase_service.dart';

class Consultas extends StatefulWidget {
  const Consultas({Key? key}) : super(key: key);

  @override
  State<Consultas> createState() => _ConsultasState();
}

enum Option {
  ConsultaCero,
  ConsultaUno,
  ConsultaDos,
  ConsultaTres,
  ConsultaCuatro,
}

class _ConsultasState extends State<Consultas> {
  Option _selectedOption = Option.ConsultaCero;
  final BusquedaController = TextEditingController();

  void _onOptionSelected(Option? option) {
    if (option != null) {
      setState(() {
        _selectedOption = option;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: BusquedaController,
                decoration: InputDecoration(
                  hintText: 'Busqueda...',
                ),
              ),
            ),
          ),
          DropdownButton(
            value: _selectedOption,
            onChanged: (Option? value) {
              _onOptionSelected(value);
            },
            items: [
              DropdownMenuItem(
                  value: Option.ConsultaCero,
                  child: Text("Seleccione")
              ),
              DropdownMenuItem(
                value: Option.ConsultaUno,
                child: Text("1. Doc - Asistencia"),
              ),
              DropdownMenuItem(
                value: Option.ConsultaDos,
                child: Text("2. NO LA HICE"),
              ),
              DropdownMenuItem(
                value: Option.ConsultaTres,
                child: Text("3. NO LA HICE"),
              ),
              DropdownMenuItem(
                value: Option.ConsultaCuatro,
                child: Text("4. Rev- Asistencia"),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: _buildBody(),
      ),
    );
  }
  Widget _buildBody() {
    switch (_selectedOption) {
      case Option.ConsultaCero:
        return Text("Selecciona una consulta");
      case Option.ConsultaUno:
        return Text("asd");



    /////////////////////////////////////////////////////////////////////////////////////////////////
      case Option.ConsultaDos:
        return Text("No la hice pipipii");
    /////////////////////////////////////////////////////////////////////////////////////////////////
      case Option.ConsultaTres:
        return Text("No la hice ppiipi");
    /////////////////////////////////////////////////////////////////////////////////////////////////
      case Option.ConsultaCuatro:
        return FutureBuilder(
            future: consulta4(BusquedaController.text),
            builder: ((context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      child: ListTile(
                        //leading: ,
                        title: Text("Revisor: ${snapshot.data?[index]['revisor']}"),
                        subtitle: Text("Fecha: ${snapshot.data?[index]['fecha']}"),
                        trailing:Icon(Icons.person),
                      ),
                    );
                  },);
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        );
      default:
        return Container();
    }
  }
}

