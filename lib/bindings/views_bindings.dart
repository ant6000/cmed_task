import 'package:cmed_task/controller/character_controller.dart';
import 'package:get/get.dart';

class CharacterBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CharacterController());
  }
}