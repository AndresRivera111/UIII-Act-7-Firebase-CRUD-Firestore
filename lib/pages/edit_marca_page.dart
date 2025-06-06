import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_services.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  final TextEditingController idMarcaController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController sucursalController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController distribuidoresController = TextEditingController();
  final TextEditingController tipoProductoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    // Asignar valores a los controladores solo una vez
    idMarcaController.text = arguments['id_marca'] ?? '';
    nombreController.text = arguments['nombre'] ?? '';
    sucursalController.text = arguments['sucursal'] ?? '';
    correoController.text = arguments['correo'] ?? '';
    telefonoController.text = arguments['telefono'] ?? '';
    distribuidoresController.text = arguments['distribuidores'] ?? '';
    tipoProductoController.text = arguments['tipo_producto'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Marca'),
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
                await updateMarca(arguments['uid'], {
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
              child: const Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
