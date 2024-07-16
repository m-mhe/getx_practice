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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter Application',
      home: const Home(),
      initialBinding: ControllerBinder(),
    );
  }
}

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(CountController());
  }

}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final CountController _countController = CountController(); //The Pub-Sub Method
  //final CountController _countController = Get.put(CountController());
  //final CountController _countController = Get.find<CountController>(); //In this program we did this without creating instance like this

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
                if (Get.find<CountController>().tapCount > 0) {
                  Get.find<CountController>()
                      .decrement(); //Also we could do this by creating an instance.
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
                Get.find<CountController>()
                    .increment(); //Also we could do this by creating an instance.
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
