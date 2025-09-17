import 'package:flutter/material.dart';

import 'widgets/app_theme.dart';
import 'widgets/custom_datepicker.dart';
import 'widgets/custom_dropdown.dart';
import 'widgets/custom_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const MyHomePage(title: 'Widget Samples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  DateTime selectedDate = DateTime.now();
  String? selectedDropdownValue;
  final TextEditingController textController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Widget Samples', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              CustomDateSelector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                paymentDate: selectedDate,
                showBorder: false,
              ),
              const SizedBox(height: 20),
              CustomDropdownField(
                showBorder: false,
                value: selectedDropdownValue,
                labelText: 'Select an Option',
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDropdownValue = newValue;
                  });
                },
                validator: (String? value) {
                  if (value == null) {
                    return 'Please select an option';
                  }
                  return null;
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'option1',
                    child: Text('Option 1'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'option2',
                    child: Text('Option 2'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'option3',
                    child: Text('Option 3'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                showBorder: false,
                controller: textController,
                labelText: 'Enter Amount',
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
