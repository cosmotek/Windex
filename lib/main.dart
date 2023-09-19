import 'package:file_picker/file_picker.dart';
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
      title: 'Windex ISO Creator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(238, 46, 36, 1),
          secondary: const Color.fromRGBO(168, 5, 5, 1),
          tertiary: const Color.fromRGBO(8, 58, 129, 1),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Windex ISO Creator'),
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
  PlatformFile? selectedFile;

  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['iso'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = result.files.single;
      });

      print(selectedFile!.name);
      print(selectedFile!.bytes);
      print(selectedFile!.size);
      print(selectedFile!.extension);
      print(selectedFile!.path);
    }
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
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.file_present_rounded),
                  selectedFile != null
                    ? Column(
                        children: [
                          Text(selectedFile!.path!),
                          Text(selectedFile!.size!.toString()),
                          TextButton(
                            onPressed: () async => selectFile(), 
                            child: Text("Change"),
                          ),
                        ],
                      ) 
                    : ElevatedButton(
                      onPressed: () async => selectFile(), 
                      child: const Text("Select ISO File"),
                    )
                ],
              ),
            ), // TODO convert to filename, size and "Select Another" once selected
            const Expanded(
              child: Divider(color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.storage),
                  ElevatedButton(
                      onPressed: null,
                      child: Text(
                          "Select Destination Device")), // TODO convert to drive name, drive size and "Select Another" once selected
                ],
              ),
            ),
            const Expanded(
              child: Divider(color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.electric_bolt),
                  ElevatedButton(onPressed: null, child: Text("Flash!")), // TODO add note that you will need to select partition 2
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
