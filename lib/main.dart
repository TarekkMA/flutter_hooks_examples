import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_examples/use_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterNotifer>(
      create: (_) => CounterNotifer(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterNotifer = useProvider<CounterNotifer>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Hooks with Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterNotifer.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: counterNotifer.inc,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: counterNotifer.dec,
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

class CounterNotifer extends ValueNotifier<int> {
  CounterNotifer() : super(0);

  void inc() => value++;
  void dec() => value--;
}
