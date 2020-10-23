import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:formulario_basico/proces/persona.dart';

class FormularioPersona extends StatefulWidget {
  final Persona persona;
  FormularioPersona(this.persona);
  @override
  _FormularioPersonaState createState() => _FormularioPersonaState();
}

final personaReference = FirebaseDatabase.instance.reference().child('persona');

class _FormularioPersonaState extends State<FormularioPersona> {
  List<Persona> itens;

  TextEditingController nombreController;
  TextEditingController telefonoController;
  TextEditingController correoController;
  TextEditingController direccionController;

  @override
  void initState() {
    super.initState();
    nombreController = new TextEditingController(text: widget.persona.nombres);
    telefonoController =
        new TextEditingController(text: widget.persona.telefono);
    correoController = new TextEditingController(text: widget.persona.correo);
    direccionController =
        new TextEditingController(text: widget.persona.direccion);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'FORMULARIO PERSONA',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.pinkAccent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Center(
                child: Column(
              children: <Widget>[
                TextField(
                  controller: nombreController,
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Nombres completos'),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Divider(),
                TextField(
                  controller: telefonoController,
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Telefono'),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Divider(),
                TextField(
                  controller: correoController,
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Correo'),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Divider(),
                TextField(
                  controller: direccionController,
                  style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Direccion'),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 40,
                  margin: EdgeInsets.only(
                    top: 32,
                  ),
                  color: Colors.blueAccent,
                  child: FlatButton(
                    onPressed: () {
                      personaReference.push().set({
                        'name': nombreController.text,
                        'cellphone': telefonoController.text,
                        'email': correoController.text,
                        'direction': direccionController.text,
                      }).then((_) {});
                      Navigator.pop(context);
                    },
                    child: Text('AGREGAR'),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
