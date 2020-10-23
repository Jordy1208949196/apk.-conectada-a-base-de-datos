import 'package:firebase_database/firebase_database.dart';

class Persona {
  String id_persona;
  String nombres;
  String telefono;
  String correo;
  String direccion;

  Persona(this.id_persona, this.nombres, this.telefono, this.correo,
      this.direccion);

  String get id => id_persona;
  String get name => nombres;
  String get cellphone => telefono;
  String get email => correo;
  String get direction => direccion;

  Persona.fromSnapShot(DataSnapshot snapshot) {
    id_persona = snapshot.key;
    nombres = snapshot.value['name'];
    telefono = snapshot.value['cellphone'];
    correo = snapshot.value['email'];
    direccion = snapshot.value['direction'];
  }
}
