
import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController{

  Timer? counterTimer;
  Timer? counterTimer1;
  Timer? counterTimer2;
  Timer? counterTimer3;
  RxInt i =0.obs;
  RxInt i1 =0.obs;
  RxInt i2 =0.obs;
  RxInt i3 =0.obs;

  void startCounter(int value) {
    const duration = Duration(milliseconds: 1);
    if (counterTimer == null && i.value < value) {
      counterTimer = Timer.periodic(duration, (timer) {
        if (i.value < value) {
          i.value++;
        } else {
          timer.cancel();
          counterTimer = null;
        }
      });
    }
  }
  void startCounter1(int value) {
    const duration = Duration(milliseconds: 1);
    if (counterTimer1 == null && i1.value < value) {
      counterTimer1 = Timer.periodic(duration, (timer) {
        if (i1.value < 300) {
          i1.value++;
        } else {
          timer.cancel();
          counterTimer1 = null;
        }
      });
    }
  }
  void startCounter2(int value) {
    const duration = Duration(milliseconds: 1);
    if (counterTimer2 == null && i2.value < value) {
      counterTimer2 = Timer.periodic(duration, (timer) {
        if (i2.value < value) {
          i2.value++;
        } else {
          timer.cancel();
          counterTimer2 = null;
        }
      });
    }
  }
  void startCounter3(int value) {
    const duration = Duration(milliseconds: 1);
    if (counterTimer3 == null && i3.value < value) {
      counterTimer3 = Timer.periodic(duration, (timer) {
        if (i3.value < value) {
          i3.value++;
        } else {
          timer.cancel();
          counterTimer3 = null;
        }
      });
    }
  }


}