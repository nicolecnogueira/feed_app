import 'package:dio/dio.dart';
import 'package:feed_app/repositories/PostRepository.dart';
import 'package:feed_app/stores/PostsStore.dart';
import 'package:flutter/material.dart';
import 'pages/FavoritesPage.dart';
import 'pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color corFundo = Color.fromARGB(255, 23, 23, 23);
    const Color corSuperficie = Color.fromARGB(255, 39, 39, 39);
    const Color corPrimaria = Color.fromARGB(255, 3, 206, 186);
    const Color corSecundaria = Color.fromARGB(255, 242, 212, 94);
    const Color corErro = Color.fromARGB(255, 226, 101, 124);
    return MaterialApp(
      title: 'Feed App',
      theme: ThemeData(
        scaffoldBackgroundColor: corFundo,

        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: corPrimaria,
          onPrimary: Colors.black,
          secondary: corSecundaria,
          onSecondary: Colors.black,
          error: corErro,
          onError: Colors.black,
          surface: corSuperficie,
          onSurface: Colors.white,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: corSuperficie,
          elevation: 2,
        ),

        cardTheme: CardTheme(
          color: corSuperficie,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),

        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: corSuperficie,
          indicatorColor: corPrimaria,
          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(color: corPrimaria, fontWeight: FontWeight.bold);
            }
            return TextStyle(color: Colors.white.withAlpha(170));
          }),
        ),

        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PostStore store;
  int selectedPage = 0;

  @override
  void initState() {
    super.initState();
    store = PostStore(PostRepository(Dio()));
    store.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(store: store),
      FavoritesPage(store: store),
    ];

    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPage,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.star_border),
            selectedIcon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
