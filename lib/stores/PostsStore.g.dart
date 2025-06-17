// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostsStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostStore on _PostStoreBase, Store {
  Computed<List<Post>>? _$favoritePostsComputed;

  @override
  List<Post> get favoritePosts => (_$favoritePostsComputed ??=
          Computed<List<Post>>(() => super.favoritePosts,
              name: '_PostStoreBase.favoritePosts'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_PostStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$postsAtom = Atom(name: '_PostStoreBase.posts', context: context);

  @override
  ObservableList<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$favoritePostIdsAtom =
      Atom(name: '_PostStoreBase.favoritePostIds', context: context);

  @override
  ObservableList<int> get favoritePostIds {
    _$favoritePostIdsAtom.reportRead();
    return super.favoritePostIds;
  }

  @override
  set favoritePostIds(ObservableList<int> value) {
    _$favoritePostIdsAtom.reportWrite(value, super.favoritePostIds, () {
      super.favoritePostIds = value;
    });
  }

  late final _$fetchPostsAsyncAction =
      AsyncAction('_PostStoreBase.fetchPosts', context: context);

  @override
  Future<void> fetchPosts() {
    return _$fetchPostsAsyncAction.run(() => super.fetchPosts());
  }

  late final _$_PostStoreBaseActionController =
      ActionController(name: '_PostStoreBase', context: context);

  @override
  void toggleFavorite(int postId) {
    final _$actionInfo = _$_PostStoreBaseActionController.startAction(
        name: '_PostStoreBase.toggleFavorite');
    try {
      return super.toggleFavorite(postId);
    } finally {
      _$_PostStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
posts: ${posts},
favoritePostIds: ${favoritePostIds},
favoritePosts: ${favoritePosts}
    ''';
  }
}
