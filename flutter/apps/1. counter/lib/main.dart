import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? number;

  void _increment() {
    setState(() {
      // if (number != null) {
      //   number = number! + 1;
      // } else {
      //   number = 1;
      // }
      number = number != null ? number! + 1 : 1;
    });
  }

  void _decrement() {
    setState(() {
      number = number != null ? max(number! - 1, 0) : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () => _decrement(),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => _increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number == null ? "Press +" : number.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
