import 'package:cmed_task/task1/model/character_model.dart';
import 'package:cmed_task/task1/views/pages/details_page.dart';
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
              height: 100,
              width: 100,
              errorBuilder: (context, error, stackTrace) => Placeholder(
                  fallbackHeight: 100,
                  fallbackWidth: 100,
                  child: Image.asset('images/loading-circles.jpg')),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(character.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                  Text(character.actor, style: const TextStyle(fontSize: 16,overflow: TextOverflow.ellipsis
                  ),overflow: TextOverflow.ellipsis),
                  Text(character.house.toString(),
                      style: const TextStyle(fontSize: 16),overflow: TextOverflow.ellipsis),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
