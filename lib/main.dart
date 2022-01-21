import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _videoPath = "No video";
  XFile? _videoFile;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input Path
            Text("Video Path: $_videoPath"),

            const SizedBox(height: 10),

            // Button (open video)
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                _videoFile = await picker.pickVideo(source: ImageSource.gallery);
                setState(() {
                  _videoPath = _videoFile?.path ?? "Path Not Available";
                });
                debugPrint(_videoPath);
              },
              child: const Text("Load video"),
            ),

            const SizedBox(height: 10),

            // TextField
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Enter Split Count",
              ),
            ),

            const SizedBox(height: 10),

            // Button (Split)
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () async {
                debugPrint(_controller.text);
                int? splitCount = int.tryParse(_controller.text);
                final bytes = await _videoFile?.readAsBytes();
                for (int i = 0; i < splitCount!; i++){

                }

              },
              child: const Text("Split video"),
            ),

            const SizedBox(height: 20),

            // Output
            const Text("Some output"),
          ],
        ),
      ),
    );
  }
}
