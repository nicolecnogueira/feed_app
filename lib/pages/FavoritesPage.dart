import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/PostsStore.dart';
import '../widgets/PostCard.dart';
import '../widgets/PostDialog.dart';

class FavoritesPage extends StatelessWidget {
  final PostStore store;
  const FavoritesPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Favoritos"),
      ),
      body: Observer(
        builder: (_) {
          if (store.favoritePosts.isEmpty) {
            return const Center(
              child: Text('Nenhum post favoritado ainda.'),
            );
          }
          return ListView.builder(
            itemCount: store.favoritePosts.length,
            itemBuilder: (context, index) {
              final post = store.favoritePosts[index];

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