import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Spin The Wheel',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    size: 25,
                    color: Colors.black,
                  )
                ],
              ))
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 300,
            child: FortuneWheel(
              animateFirst: false,
              indicators: [
                FortuneIndicator(
                    child: Image.asset(
                  'assets/drop_icon.png',
                  height: 60,
                  width: 60,
                ))
              ],
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
                    child: Text(
                      "₹${i * 5}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow),
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
          SizedBox(
            height: 60,
          ),
          Container(
        //    height: 120,
            width: MediaQuery.of(context).size.width / 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        height: 100.0,
                        // enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        viewportFraction: 1

                        //autoPlayDuration: Duration(milliseconds: 1500),
                        ),
                    items: [
                      Container(
                        color: Colors.red,
                        child: Center(child: Text('Slide 1')),
                      ),
                      Container(
                        color: Colors.green,
                        child: Center(child: Text('Slide 2')),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Center(child: Text('Slide 3')),
                      ),
                      // Add more slides as needed
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              height:
                  10), // Add some space between CarouselSlider and indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.radio_button_checked, color: Colors.red),
              Icon(Icons.radio_button_checked, color: Colors.green),
              Icon(Icons.radio_button_checked, color: Colors.blue),
              // Add more icons for additional slides
            ],
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        color: Colors.purple[100],
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  _incrementCounter();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.purple[500],
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(width: 1,color: Colors.blue),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Tap To Spin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
