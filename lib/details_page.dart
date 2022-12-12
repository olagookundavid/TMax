import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {super.key, required this.name, required this.age, required this.about});
  final String name;
  final String age;
  final String about;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/180px-Chelsea_FC.svg.png',
                  scale: 50)),
          const SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Text(
            age,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Text(
            about,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
