import 'package:dam_u4_proyecto2_19400633/consultas.dart';
import 'package:dam_u4_proyecto2_19400633/verAsignaciones.dart';
import 'package:flutter/material.dart';
import 'verAsignaciones.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _indice = 0;

  void _cambiarIndice(int indice) {
    setState(() {
      _indice = indice;
    });
  }
  final List<Widget> _paginas = [
    Asignaciones(),
    Consultas()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: "Asignacion"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label:"Consultas"),

        ],
        showUnselectedLabels: false,
        iconSize: 30,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        currentIndex: _indice,
        onTap: _cambiarIndice,
      ),
    );
  }
}
