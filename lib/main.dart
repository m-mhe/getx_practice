import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/count_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter Application',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final CountController _countController = CountController(); //The Pub-Sub Method
  final CountController _countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Counter Application',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Center(
            child: /*Obx((){ //The Pub-Sub Method
          return Text(
            'Total tap: ${_countController.tapCount}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          );
        }),*/
                GetBuilder<CountController>(
          builder: (countController) {
            return Text(
              '${countController.tapCount}',
              style:
                  const TextStyle(fontSize: 200, fontWeight: FontWeight.w500),
            );
          },
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                if (_countController.tapCount > 0) {
                  _countController.decrement();
                }
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: const Icon(Icons.horizontal_rule),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                _countController.increment();
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
