import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:switch_theme_app/services/theme_service.dart';
import 'package:switch_theme_app/views/colors_view.dart';
import 'package:switch_theme_app/deberInputs/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final bool themeStatus = themeMode.value == 'light';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Switch Theme',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ColorsView()),
                  );
                },
                child: const Text('Go to colors view'),
              ),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const InputsPage()),
                  );
                },
                child: const Text('Go to inputs view'),
              ),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const InputsPage()),
                  );
                },
                child: const Text('Go to inputs view deber Nathan'),
              ),
              const SizedBox(height: 20),

              // ⭐ LOTTIE BIEN COLOCADO
              Lottie.network(
                "https://lottie.host/874e0a25-3052-49d1-83eb-0437964d1800/VaN3h8MhiG.json",
                height: 150,
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeMode.value = themeStatus ? 'dark' : 'light';
        },
        tooltip: 'Switch theme',
        child: Icon(
          themeStatus ? Icons.sunny : Icons.mode_night_outlined,
        ),
      ),
    );
  }
}
