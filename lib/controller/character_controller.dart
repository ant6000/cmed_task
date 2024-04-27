import 'dart:convert';
import 'package:cmed_task/model/character_model.dart';
import 'package:cmed_task/repository/fetch_characters.dart';
import 'package:get/get.dart';

class CharacterController extends GetxController {
  final RxList<Characterslist> characters = <Characterslist>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchCharacter();
    super.onInit();
  }

  Future<void> fetchCharacter() async {
    isLoading.toggle();
    try {
      final response = await FetchCharacter.fetchCharacters();
      if (response.statusCode == 200) {
        var jsonList = json.decode(response.body);
        List<Characterslist> plist = jsonList
            .map<Characterslist>((data) => Characterslist.fromJson(data))
            .toList();
        characters.value = plist;
      }
    } catch (e) {
      print('Error fetching trades: $e');
      isLoading.toggle();
    } finally {
      isLoading.toggle();
    }
  }
}
