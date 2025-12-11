import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  
  // ⭐ Future que simula cargar datos
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Datos cargados correctamente 🎉";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FutureBuilder Demo")),
      body: FutureBuilder<String>(
        future: fetchData(),

        builder: (context, snapshot) {
          // Mientras el Future está cargando
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Si hubo un error
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          // Si terminó y hay datos
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data!,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }

          // 🔄 Estado por defecto si no hay nada
          return const Center(child: Text("Sin datos"));
        },
      ),
    );
  }
}
