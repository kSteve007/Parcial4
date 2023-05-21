import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parcial 04 UTEC'),
      ),
      body: FutureBuilder(
          future: getClientes(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Nombre: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: snapshot.data?[index]['sNombreCliente'] +
                                ' ' +
                                snapshot.data?[index]['sApellidoCliente'],
                            style: TextStyle(fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: ' Dirección: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: snapshot.data?[index]['sDireccionCliente'],
                            style: TextStyle(fontWeight: FontWeight.normal))
                      ]));
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
