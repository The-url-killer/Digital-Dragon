// ignore_for_file: must_be_immutable

import 'package:digital_dragon_v1/ui/components/character.component.dart';
import 'package:digital_dragon_v1/ui/screens/info/info.screen.dart';
import 'package:flutter/material.dart';

class PetsScreen extends StatefulWidget {
  PetsScreen({Key? key, required this.pets}) : super(key: key);

  List<dynamic> pets;

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.pets
              .map((pet) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Info(character: pet),
                      ),
                    );
                  },
                  child: Character(character: pet)))
              .toList(),
        ));
  }
}
