import 'package:flutter/material.dart';
import 'package:tmax/post_model.dart';
import 'package:tmax/text_helper.dart';

class DetailName extends StatelessWidget {
  const DetailName({super.key, required this.post, required this.index});
  final Posts post;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              TextHelper(
                text: post.title ?? '',
                color: Colors.black45,
                size: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              TextHelper(
                text: post.body ?? '',
                color: Colors.black,
                size: 25,
              ),
            ]),
            CircleAvatar(
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
