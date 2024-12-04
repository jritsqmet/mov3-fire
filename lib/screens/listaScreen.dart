import 'package:flutter/material.dart';

//FIREBASE
import 'package:firebase_database/firebase_database.dart';

class ListaEstudiantes extends StatelessWidget {
  const ListaEstudiantes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Estudiantes"),
      ),
      body: listaE(context)
    );
  }
}

Future <List <Map <String, dynamic >> > leer() async{
  DatabaseReference starCountRef =   FirebaseDatabase.instance.ref('estudiantes/');
 
  final snapshot = await starCountRef.get();
  final data = snapshot.value;

  if (data != null){
    Map<dynamic, dynamic> mapData = data as Map <dynamic, dynamic>;
    List <Map <String, dynamic>> estudiantesList= [];

    mapData.forEach((key, value){
      estudiantesList.add({
        "cedula": key,
        "nombre": value['nombre'],
        "edad": value['edad'],
        "ciudad": value['ciudad']
      });
    });

    return estudiantesList;
  } else{
    return [];
  }
}

Widget listaE (context){
  return FutureBuilder(future: leer(), builder: (context, snapshot){
    final data = snapshot.data!;
    return ListView.builder( itemCount:  data.length ,itemBuilder: (context, index){
      final item = data[index];
      return ListTile(
        title: Text("${item['cedula']}"),
        subtitle: Text("${item['nombre']}"),
      );
    });
  });
}