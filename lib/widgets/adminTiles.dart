import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/people.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Person> people = Provider.of<List<Person>>(context) ?? [];
    print(people);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: people.map((e) {
            return Container(
              width: 150,
              child: Card(
                child: Wrap(
                  children: [
                    Image.network(e.imageUrl),
                    ListTile(title: Text(e.name)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
