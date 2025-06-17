import 'package:feed_app/stores/PostsStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../models/PostModel.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final PostStore store;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTap;

  const PostCard({
    super.key,
    required this.post,
    required this.store,
    required this.onFavoritePressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      post.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white.withAlpha(170)),
                    ),
                  ],
                ),
              ),
              Observer(
      builder: (_) => IconButton(
        icon: Icon(
          // 6. A LÓGICA AGORA FICA AQUI DENTRO, usando o store diretamente
          store.favoritePostIds.contains(post.id)
              ? Icons.star
              : Icons.star_border,
          color: store.favoritePostIds.contains(post.id)
              ? Theme.of(context).colorScheme.secondary
              : Colors.grey,
        ),
        onPressed: onFavoritePressed,
      ),
    ),
            ],
          ),
        ),
      ),
    );
  }
}