import 'package:mobx/mobx.dart';
import '../models/PostModel.dart';
import '../repositories/PostRepository.dart';
part 'PostsStore.g.dart';

class PostStore = _PostStoreBase with _$PostStore;

abstract class _PostStoreBase with Store {
  final PostRepository _repository;

  _PostStoreBase(this._repository);

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Post> posts = ObservableList<Post>();

  @observable
  ObservableList<int> favoritePostIds = ObservableList<int>();

  @action
  Future<void> fetchPosts() async {
    isLoading = true;
    try {
      final postList = await _repository.fetchPosts();
      posts = ObservableList.of(postList);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  void toggleFavorite(int postId) {
    if (favoritePostIds.contains(postId)) {
      favoritePostIds.remove(postId);
    } else {
      favoritePostIds.add(postId);
    }
  }

  @computed
  List<Post> get favoritePosts =>
      posts.where((post) => favoritePostIds.contains(post.id)).toList();

}