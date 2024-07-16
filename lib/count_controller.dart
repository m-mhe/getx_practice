import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

//Pub-Sub method:
/*class CountController {
  RxInt _tapCount = 0.obs;

  RxInt get tapCount {
    return _tapCount;
  }

  void increment() => _tapCount++;

  void decrement() => _tapCount--;
}*/

//GetxBuilder method:
class CountController extends GetxController {
  int _tapCount = 0;

  int get tapCount => _tapCount;

  void increment() {
    _tapCount++;
    update();
  }

  void decrement(){
    _tapCount--;
    update();
  }
}
