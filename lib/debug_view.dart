import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmax/api_response.dart';
import 'package:tmax/constants.dart';
import 'package:tmax/details_screen.dart';
import 'package:tmax/post_model.dart';
import 'package:tmax/post_repository.dart';
import 'package:tmax/text_helper.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Posts> posts = [];
  final postRepository = PostsRepository(Dio());
  NetworkState stateOfNetwork = NetworkState.loading;
  String errorMessage = '';

//widget lifecycle
  @override
  void initState() {
    super.initState();
    getPosts();
  }

  getPosts() async {
    final ApiResponse<List<Posts>> apiResponse =
        await postRepository.getPosts();
    if (apiResponse.success) {
      posts = apiResponse.data!;
      stateOfNetwork = NetworkState.success;
      setState(() {});
      return;
    } else {
      errorMessage = apiResponse.message;
      stateOfNetwork = NetworkState.error;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Post App",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
/*
itenery operator
2 + 2 == 4 ? yes : no
*/

      body: stateOfNetwork == NetworkState.loading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : stateOfNetwork == NetworkState.error
              ? Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  ),
                )
              : ListView.builder(
                  itemCount: posts.length,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: TextHelper(
                            text: "${index + 1}",
                            color: Colors.white,
                            size: 12),
                      ),
                      title: TextHelper(
                          text: post.title ?? '',
                          color: Colors.orange,
                          size: 25),
                      subtitle: TextHelper(
                        text: post.body!,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => DetailName(
                                post: post,
                                index: index,
                              ),
                            ));
                      },
                    );
                  },
                ),
    );
  }
}
