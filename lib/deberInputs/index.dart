import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InputsPage(),
    );
  }
}

class InputsPage extends StatefulWidget {
  const InputsPage({super.key});

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  bool isChecked = false;
  bool isOn = false;
  double sliderValue = 50;

  // This replaces radioValue
  int selectedOption = 1;

  String dropdownValue = "Rojo";

  final TextEditingController textController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("7 tipos de inputs")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("1. TextField"),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: "Nombre",
              ),
            ),
            const SizedBox(height: 20),

            const Text("2. TextFormField"),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 20),

            const Text("3. Checkbox"),
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() => isChecked = value!);
              },
            ),
            const SizedBox(height: 20),

            const Text("4. SegmentedButton (radio moderno)"),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 1, label: Text("Opción 1")),
                ButtonSegment(value: 2, label: Text("Opción 2")),
              ],
              selected: {selectedOption},
              onSelectionChanged: (newSelection) {
                setState(() => selectedOption = newSelection.first);
              },
            ),
            const SizedBox(height: 20),

            const Text("5. Switch"),
            Switch(
              value: isOn,
              onChanged: (value) => setState(() => isOn = value),
            ),
            const SizedBox(height: 20),

            const Text("6. DropdownButton"),
            DropdownButton<String>(
              value: dropdownValue,
              items: ["Rojo", "Azul", "Verde"]
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (value) {
                setState(() => dropdownValue = value!);
              },
            ),
            const SizedBox(height: 20),

            const Text("7. Slider"),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() => sliderValue = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
