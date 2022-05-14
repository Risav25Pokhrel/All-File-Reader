import 'package:all_file_reader/download.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "all_file_reader",
    home: logic(),
  ));
}

class logic extends StatefulWidget {
  const logic({Key? key}) : super(key: key);

  @override
  State<logic> createState() => _logicState();
}

class _logicState extends State<logic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 32,
                width: 30,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();

                    if (result == null) return;

                    final file = result.files.first;
                    openfile(file);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.file_open,
                      ),
                      Text("OPEN THE FILE FROM DEVICE    "),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

void openfile(PlatformFile file) {
  OpenFile.open(file.path!);
}
