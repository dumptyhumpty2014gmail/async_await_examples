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

  void example2() {
    final startTime = DateTime.now().toIso8601String();
    if (kDebugMode) {
      print('start example 2 $startTime');
    }
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (kDebugMode) {
          print('in example 2 ${DateTime.now().toIso8601String()}');
        }
        for (var i = 0; i < 100; i++) {}
      },
    ).then((value) => print('callback example 2')).catchError(
      (e) {
        if (kDebugMode) {
          print(e);
        }
      },
    );
    if (kDebugMode) {
      print('end example 2 $startTime - ${DateTime.now().toIso8601String()}');
    }
  }

  void example3() {
    final startTime = DateTime.now().toIso8601String();
    if (kDebugMode) {
      print('start example 3 $startTime');
    }
    asyncFunc3();
    if (kDebugMode) {
      print('end example 2 $startTime - ${DateTime.now().toIso8601String()}');
    }
  }

  Future<void> asyncFunc3() async {
    final value = await mainFunc3();
    callBack3(value);
    //mainFunc3().then(callBack3);
  }

  Future<bool> mainFunc3() async {
    if (kDebugMode) {
      print('in example 3 ${DateTime.now().toIso8601String()}');
    }
    for (var i = 0; i < 100; i++) {}
    return true;
  }

  void callBack3(bool value) {
    if (kDebugMode) {
      print('callback example 3 $value');
    }
  }

  String extValue = 'init';

  void example4() {
    if (kDebugMode) {
      print('start4 extValue=$extValue');
    }
    asyncFunc4();
    if (kDebugMode) {
      print('end4 extValue=$extValue');
    }
  }

  Future<void> asyncFunc4() async {
    await mainFunc4();
    if (kDebugMode) {
      print('in asyncFunc4 $extValue');
    }
    callBack4();
    if (kDebugMode) {
      print('after callBack4 $extValue');
    }
  }

  Future<void> mainFunc4() async {
    extValue = 'in mainFunc4';
    Future(() {
      extValue = 'in Future 4';
    });
  }

  void callBack4() {
    extValue = 'in callBack4';
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
              ElevatedButton(onPressed: example3, child: const Text('Example 3')),
              ElevatedButton(onPressed: example4, child: const Text('Example 4')),
            ],
          ),
        ),
      ),
    );
  }
}
