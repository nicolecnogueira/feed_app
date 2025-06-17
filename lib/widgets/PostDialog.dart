import 'package:flutter/material.dart';
import '../models/PostModel.dart';

class PostDetailsDialogContent extends StatelessWidget {
  final Post post;

  const PostDetailsDialogContent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),
          Divider(color: Theme.of(context).colorScheme.primary.withAlpha(200)),
          const SizedBox(height: 12),

          SizedBox(
            child: SingleChildScrollView(
              child: Text(
                post.body,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.white.withAlpha(200),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

Future<void> showPostDetails(BuildContext context, Post post) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: PostDetailsDialogContent(post: post),
      );
    },
  );
}
