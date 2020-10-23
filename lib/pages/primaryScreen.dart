import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:formulario_basico/proces/persona.dart';
import 'formularioPersona.dart';

class PrimaryScreen extends StatefulWidget {
  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _PrimaryScreenState extends State<PrimaryScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.greenAccent,
          onPressed: () => _createNewProduct(context),
        ),
      ),
    );
  }

//metodo pasar a pantalla de crear un producto
  void _createNewProduct(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              FormularioPersona(Persona(null, '', '', '', ''))),
    );
  }
}
