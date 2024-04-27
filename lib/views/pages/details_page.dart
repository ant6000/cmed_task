import 'package:cmed_task/model/character_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Characterslist character;
  const DetailsPage({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(character.image,width: double.infinity,height: 300,errorBuilder: (context, error, stackTrace) => Placeholder(fallbackHeight: 300,fallbackWidth: double.infinity,child: Image.asset('images/loading.jpg'))),
          Text(character.name,style: const TextStyle(fontSize: 20)),
          Text(character.gender.toString(),style: const TextStyle(fontSize: 20)),
          Text(character.hairColour.toString(),style: const TextStyle(fontSize: 20)),
          Text(character.eyeColour.toString(),style: const TextStyle(fontSize: 20)),
          Text(character.dateOfBirth.toString(),style: const TextStyle(fontSize: 20)),
          Text(character.house.toString(),style: const TextStyle(fontSize: 20)),
          ],
      ),
    );
  }
}
