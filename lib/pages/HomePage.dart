import 'package:feed_app/stores/PostsStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../widgets/PostCard.dart';
import '../widgets/PostDialog.dart';

class HomePage extends StatelessWidget {
  final PostStore store;
  const HomePage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading && store.posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: store.posts.length,
            itemBuilder: (context, index) {
              final post = store.posts[index];
              
              return PostCard(
                post: post,
                store: store,
                onFavoritePressed: () {
                  store.toggleFavorite(post.id);
                },
                onTap: () => showPostDetails(context, post),
              );
            },
          );
        },
      ),
    );
  }
}