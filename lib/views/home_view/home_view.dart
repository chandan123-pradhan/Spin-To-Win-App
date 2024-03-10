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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                _incrementCounter();
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple[500],
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(width: 1,color: Colors.blue),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Tap To Spin",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                 // height: 200,
                  width: MediaQuery.of(context).size.width / 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              height: 150.0,
                              // enlargeCenterPage: true,
                              autoPlay: true,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              viewportFraction: 1

                              //autoPlayDuration: Duration(milliseconds: 1500),
                              ),
                          items: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: Colors.red,
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/best-selling-product-social-media-banner-design-template-e7698d7bd09853d43bb5c2668b8fe294_screen.jpg?ts=1661679322'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                             Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: Colors.red,
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b530f7110494491.5feef8228f2b8.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                             Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: Colors.red,
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://www.colorgraphicz.com/wp-content/uploads/2018/05/Banner-Design.jpg'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            // Add more slides as needed
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        elevation: 5,
        child: Container(
          color: Colors.purple[100],
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Balance: ₹540",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: () {
                    // _incrementCounter();
                  },
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.purple[500],
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(width: 1,color: Colors.blue),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Withdraw",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
