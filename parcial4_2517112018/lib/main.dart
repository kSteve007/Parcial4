import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:parcial4_2517112018/pages/add_datos.dart';
import 'package:parcial4_2517112018/pages/delete_datos.dart';
import 'package:parcial4_2517112018/pages/edit_datos.dart';
import 'package:parcial4_2517112018/pages/home_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial 04 UTEC',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddDatospage(),
        '/edit': (context) => const EditDatospage(),
        '/delete': (context) => const DeleteDatospage(),
      },
    );
  }
}
