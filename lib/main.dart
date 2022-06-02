// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_with_nodejs_express/model/data_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter with Nodejs Express'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DataModel dataModel;
  late List<DataModel> listDataModel;

  @override
  void initState() {
    super.initState();
    getData();
    addDataToModel();
  }

  Future getData() async {
    var request =
        http.Request('GET', Uri.parse('http://192.168.1.43:3000/posts'));
    request.body = '''''';
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var b = await response.stream.bytesToString();
      print(b);
      return b;
    } else {
      print(response.reasonPhrase);
    }
  }

  addDataToModel() async {
    var result = await getData();
    listDataModel = dataModelFromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Text('test');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (var element in listDataModel) {
            print(element.title);
          }
        },
      ),
    );
  }
}
