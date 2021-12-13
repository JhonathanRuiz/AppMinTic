import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/usuario.dart';

Future<void> getUsers() async {
  List<Usuario> usuariosList = [];
  CollectionReference usuarios =
      FirebaseFirestore.instance.collection("usuarios");

  QuerySnapshot usuariosQuery = await usuarios.get();
  if (usuariosQuery.docs.isNotEmpty) {
    for (var doc in usuariosQuery.docs) {
      print(doc.data());
    }
  }
}

registrarUsuario(Usuario usuario) async {
  try {
    await FirebaseFirestore.instance.collection("usuarios").doc().set({
      "nombre": usuario.nombre,
      "Correo": usuario.correo,
      "telefono": usuario.telefono,
      "Contrasena": usuario.contrasena,
      "Direccion": usuario.direccion,
      "estado": "1"
    });
    return "Registro Exitoso";
  } catch (e) {
    return e;
  }
}
