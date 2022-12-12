import 'package:flutter/material.dart';
import 'package:tmax/details_page.dart';

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
          'My Blog',
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
  static const mylist = [
    {
      'name': 'Chelsea',
      'age': '20',
      'about': 'Chelsea is the best football club in the world,'
    },
    {
      'name': 'Manu',
      'age': '30',
      'about': ' argue with your keyboard alaye, we get mount and thiago '
    },
    {
      'name': 'Arsenal',
      'age': '40',
      'about':
          'and some english bums wey no sabi, since abramovic don commot naso heartbreak'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                //Navigator 1.0
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DetailsPage(
                      name: mylist[index]['name']!,
                      age: mylist[index]['age']!,
                      about: mylist[index]['about']!),
                ));
              },
              tileColor: Colors.blueAccent[200],
              title: Text(mylist[index]['name'] ?? 'this is empty string',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: const Text(
                'click to find out more',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              leading: const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/180px-Chelsea_FC.svg.png',
                      scale: 50)),
            ),
          );
        },
      ),
    );
  }
}



/*
Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            width: 50,
            height: 40,
            color: index < 5
                ? Colors.blue
                : index > 15
                    ? Colors.purple
                    : index > 10
                        ? Colors.pink
                        : Colors.red,
          );
*/