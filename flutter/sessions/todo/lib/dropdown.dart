import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  String value = "Value";

  @override
  void initState() {
    super.initState();
    _controller.text = "EUR";
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: DropdownMenu(
                controller: _controller,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: "USD",
                    label: "USD",
                  ),
                  DropdownMenuEntry(
                    value: "EGP",
                    label: "EGP",
                  ),
                  DropdownMenuEntry(
                    value: "EUR",
                    label: "EUR",
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => press(),
              child: const Text("Press ME"),
            ),
          ],
        ),
      ),
    );
  }

  void press() {
    String text = _controller.text;
    setState(() {
      value = text;
    });
  }
}
