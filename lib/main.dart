import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async await examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Async examples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void example1() {
    if (kDebugMode) {
      print('start example 1');
    }
    Future(
      () {
        if (kDebugMode) {
          print('in example 1');
        }
      },
    );
    // for (var i = 0; i < 100; i++) {
    //   print(i);
    // }
    if (kDebugMode) {
      print('end example 1');
    }
  }

  void nuance1() {
    final startTime = DateTime.now().toIso8601String();
    if (kDebugMode) {
      print('start nuance 1 $startTime');
    }
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (kDebugMode) {
          print('in nuance 1 ${DateTime.now().toIso8601String()}');
        }
      },
    );
    for (var i = 0; i < 10000; i++) {
      print(i);
    }
    if (kDebugMode) {
      print('start - end nuance 1 $startTime - ${DateTime.now().toIso8601String()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: example1, child: const Text('Example 1')),
              ElevatedButton(onPressed: nuance1, child: const Text('Nuance 1')),
            ],
          ),
        ),
      ),
    );
  }
}
