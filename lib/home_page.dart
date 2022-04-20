import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [SizedBox(height: 140,),
          Center(
            
            child: Text("Welcome Testy Soup",style: TextStyle(fontSize: 30,color: Colors.indigo),),
          ),Image.asset("assets/sup.jpg")
        ],
      ),
    );
  }
}