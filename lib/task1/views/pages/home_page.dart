import 'package:cmed_task/task1/controller/character_controller.dart';
import 'package:cmed_task/task1/views/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CharacterController controller = Get.find<CharacterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.characters.length,
              itemBuilder: (context, index) {
                return CharacterCard(
                  character: controller.characters[index],
                );
              },
            );
          }
        }
      }),
    );
  }
}


// => ListView.builder(
//           itemCount: controller.characters.length,
//           itemBuilder: (context, index) {
//             return CharacterCard(
//               character: controller.characters[index],
//             );
//           },
//         ),