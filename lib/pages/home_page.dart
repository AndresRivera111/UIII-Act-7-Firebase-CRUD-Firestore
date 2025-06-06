import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crud Firebase Rivera: Marcas',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: getMarcas(),
        builder: ((context, snapchot) {
          if (snapchot.hasData) {
            return ListView.builder(
              itemCount: snapchot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) async {
                    await deleteMarca(snapchot.data?[index]['uid']);
                    snapchot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;
                    result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Estas seguro de eliminar a ${snapchot.data?[index]['nombre']}',
                          ),
                          actions: [
                            // Suggested code may be subject to a license. Learn more: ~LicenseLog:1590466695.
                            // Suggested code may be subject to a license. Learn more: ~LicenseLog:2594502320.
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(context, false);
                              },
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(context, true);
                              },
                              child: const Text('Aceptar'),
                            ),
                          ],
                        );
                      },
                    );
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  direction: DismissDirection.endToStart,
                  key: Key(snapchot.data?[index]['uid']),
                  child: ListTile(
                    title: Text(snapchot.data?[index]['nombre']),
                    onTap: () async {
                      final marca = snapchot.data?[index];

                      await Navigator.pushNamed(
                        context,
                        '/edit',
                        arguments: {
                          'uid': marca['uid'],
                          'id_marca': marca['id_marca'],
                          'nombre': marca['nombre'],
                          'sucursal': marca['sucursal'],
                          'correo': marca['correo'],
                          'telefono': marca['telefono'],
                          'distribuidores': marca['distribuidores'],
                          'tipo_producto': marca['tipo_producto'],
                        },
                      );

                      setState(() {});
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
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
