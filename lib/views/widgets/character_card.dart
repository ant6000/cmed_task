import 'package:cmed_task/model/character_model.dart';
import 'package:cmed_task/views/pages/details_page.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final Characterslist character;
  const CharacterCard({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(character: character)));
      },
      child: Card(
        child: Row(
          children: [
            Image.network(
              character.image,
              height: 200,
              width: 200,
              errorBuilder: (context, error, stackTrace) => Placeholder(fallbackHeight: 200,fallbackWidth: 200,child: Image.asset('images/loading.jpg')),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text(character.actor,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(character.house.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
