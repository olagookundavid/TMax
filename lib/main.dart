import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tmax',
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My CV',
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: const MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://dailypost.ng/wp-content/uploads/2020/12/thomas-tuchel-psg-nimes-ligue-1-23022019_176shaei6syn8135ytru7snvnt.jpg'),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * (1 / 5),
              child: const Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://dailypost.ng/wp-content/uploads/2020/12/thomas-tuchel-psg-nimes-ligue-1-23022019_176shaei6syn8135ytru7snvnt.jpg')),
            ),
            const Text('THIS IS THOMAS TUCHEL',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
            const Text('THIS IS THOMAS TUCHEL',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
                Text('+234 7085569828',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}
