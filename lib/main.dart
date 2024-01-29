import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: const MyHomePage(title: 'Spin To Win'),
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
  StreamController<int> controller = StreamController<int>();

  void _incrementCounter() {
     //
    var rendomval = Fortune.randomInt(0, 5);
    print(rendomval);
    controller.add(rendomval);
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
        backgroundColor: Colors.yellow,
        elevation: 0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            height: 300,
            child: FortuneWheel(
              animateFirst: false,
              
              
              curve: Curves.easeOutQuint,
              physics: CircularPanPhysics(
                duration: Duration(seconds: 1),
                curve: Curves.decelerate,
              ),
              onFling: () {
                controller.add(1);
              },
              selected: controller.stream,
              items: [
                for (int i = 0; i < 5; i++)
                  FortuneItem(
                    child: Text("₹${i * 5}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow
                    ),
                    ),
                    style: FortuneItemStyle(

                      color: i % 2 == 0
                          ? Colors.green
                          : Colors.red, // <-- custom circle slice fill color
                      borderColor:
                          Colors.black, // <-- custom circle slice stroke color
                      borderWidth: 1, // <-- custom circle slice stroke width
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: (){
              _incrementCounter();
            },
            child: Container(
              width: MediaQuery.of(context).size.width/1,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1,color: Colors.blue),
              ),
              alignment: Alignment.center,
              child: Text("Tap To Earn",
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
