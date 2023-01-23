import 'package:flutter/material.dart';
import 'package:tmax/post_model.dart';
import 'package:tmax/post_repository.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Posts> posts = [];
  final postRepository = PostsRepository();
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
          "Debugging",
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
                  child: Text(errorMessage),
                )
              : ListView.builder(
                  itemCount: posts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: Text(post.title ?? ""),
                      subtitle: Column(
                        children: [
                          Text(post.body ?? ""),
                          Text("${post.userId}"),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
