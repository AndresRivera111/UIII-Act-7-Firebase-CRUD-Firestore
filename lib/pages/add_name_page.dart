import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_services.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  final TextEditingController idMarcaController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController sucursalController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController distribuidoresController = TextEditingController();
  final TextEditingController tipoProductoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Marca'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(controller: idMarcaController, decoration: const InputDecoration(labelText: 'ID Marca')),
            TextField(controller: nombreController, decoration: const InputDecoration(labelText: 'Nombre')),
            TextField(controller: sucursalController, decoration: const InputDecoration(labelText: 'Sucursal')),
            TextField(controller: correoController, decoration: const InputDecoration(labelText: 'Correo Electrónico')),
            TextField(controller: telefonoController, decoration: const InputDecoration(labelText: 'Teléfono')),
            TextField(controller: distribuidoresController, decoration: const InputDecoration(labelText: 'Distribuidores')),
            TextField(controller: tipoProductoController, decoration: const InputDecoration(labelText: 'Tipo de Producto')),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await addMarca({
                  'id_marca': idMarcaController.text,
                  'nombre': nombreController.text,
                  'sucursal': sucursalController.text,
                  'correo': correoController.text,
                  'telefono': telefonoController.text,
                  'distribuidores': distribuidoresController.text,
                  'tipo_producto': tipoProductoController.text,
                });
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
