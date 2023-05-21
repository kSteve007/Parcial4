import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class AddDatospage extends StatefulWidget {
  const AddDatospage({super.key});

  @override
  State<AddDatospage> createState() => _AddDatospageState();
}

class _AddDatospageState extends State<AddDatospage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController lastNameController = TextEditingController(text: "");
  TextEditingController AdressController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            inputname(),
            inputlastname(),
            inpuadress(),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () async {
                  addClientes(nameController.text, lastNameController.text,
                          AdressController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }

  TextField inpuadress() {
    return TextField(
      controller: AdressController,
      decoration: InputDecoration(
        hintText: 'Ingrese la Dirección',
      ),
    );
  }

  TextField inputlastname() {
    return TextField(
      controller: lastNameController,
      decoration: InputDecoration(
        hintText: 'Ingrese el Apellido',
      ),
    );
  }

  TextField inputname() {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'Ingrese el nombre',
      ),
    );
  }
}
