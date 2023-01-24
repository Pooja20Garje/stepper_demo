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

      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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


  int _activeStepIndex = 0;

  List<Step> stepList() => [
    Step(
        state:
        _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 0,
        title: Text('Mobile no'),
        content: PageOne()),
    Step(
        state:
        _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: Text('Sevekari'),
        content: PageTwo()),
    Step(
        state:
        _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: Text('Kendra'),
        content: Center(child: Text("Kendra"))),
    Step(
        state:
        _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 3,
        title: Text('Type'),
        content: Center(child: Text("Type"))),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("title"),
      ),
      body: Stepper(
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: <Widget>[
              TextButton(
                onPressed: details.onStepContinue,
                child: (_activeStepIndex == 0)
                    ? const Text('SEARCH')
                    : const Text('NEXT'),
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: const Text('CANCEL'),
              ),
            ],
          );
        },
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            _activeStepIndex += 1;
          }
          setState(() {});
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          _activeStepIndex -= 1;
          setState(() {});
        },
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



  Widget PageOne() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Mobile No',
            hintText: 'Enter Mobile No'),
      ),
    );
  }

  Widget PageTwo() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password', hintText: 'Enter secure password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password', hintText: 'Enter secure password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password', hintText: 'Enter secure password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password', hintText: 'Enter secure password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ],
        ));
  }
}
