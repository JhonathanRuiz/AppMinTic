import 'package:appmintic/dictionary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Buscar extends StatefulWidget {
  final String searchWord;
  Buscar(this.searchWord);
  @override
  BuscarApp createState() => BuscarApp();
}

//
class BuscarApp extends State<Buscar> {
  @override
  Widget build(BuildContext context) {
    ///++++++++++++++++++++++++++++
    return Scaffold(
      appBar: AppBar(
        title: Text("Busqueda"),
        backgroundColor: primary,
      ),
      body: Container(
        child: Center(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("tiendas").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              // print(widget.searchWord);
              return ListView.builder(
                itemCount: snapshot.data!.docs.length, // define las iteraciones
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data!.docs[index]
                      .get("nombre")
                      .toString()
                      .toUpperCase()
                      .contains(widget.searchWord.toUpperCase())) {
                    return Card(
                      margin: const EdgeInsets.all(15),
                      borderOnForeground: false,
                      child: InkWell(
                        onTap: () {
                          debugPrint('Card tapped.');
                        },
                        child: SizedBox(
                          width: 250,
                          height: 160,
                          child: Stack(children: <Widget>[
                            Positioned.fill(
                                child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(snapshot
                                        .data!.docs[index]
                                        .get("imagen")),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(1.0),
                                        BlendMode.softLight),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                            )),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(paddingInk),
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data!.docs[index].get("nombre"),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]
                                          .get("descripcion"),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    );
                  } else {
                    return new Card();
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
