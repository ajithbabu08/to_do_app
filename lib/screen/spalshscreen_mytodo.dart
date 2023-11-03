import 'dart:async';
import 'package:flutter/material.dart';
import 'homepage.dart';

class todoSplash extends StatefulWidget {

  @override
  State<todoSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<todoSplash> {

  @override
  void initState() {
    Timer(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>homepageTodo()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.white,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.note_alt_outlined,size: 100,),
              Text("To Do",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 30),),
            ],
          ),
        ),
      ),
    );
  }
}

