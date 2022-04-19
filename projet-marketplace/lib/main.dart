import 'package:flutter/material.dart';
import 'user.dart';
import 'product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Marketplace'),
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
User userService = User();
Product productService = Product();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: userService.getAllUsers(),
          // future: productService.getAllProducts(),
          builder: (context, snapchot){
            print(snapchot.data);
            if (snapchot.hasData) {
              return ListView.builder(itemCount: snapchot.data?.length, itemBuilder:(context, i){
                return Card(
                  child: ListTile(
                    title: Text(snapchot.data![i]["name"],
                    style: TextStyle(fontSize: 30.0)),
                    subtitle: Text(snapchot.data![i]["email"], style: TextStyle(fontSize: 30.0))
                  )
                );
                // return Card(
                //   child: ListTile(
                //     title: Text(snapchot.data![i]["label"] + " " + snapchot.data![i]["initial_price"].toString(),
                //     style: TextStyle(fontSize: 30.0)),
                //     subtitle: Text(snapchot.data![i]["description"], style: TextStyle(fontSize: 30.0))
                //   )
                // );
              });
            }else{
              return const Center(
                child: Text("No data found")
              );
            }
          },
        )
      )
    );
  }
}
