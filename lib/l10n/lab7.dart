import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 7',
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: CardsScreen(onLocaleChange: _changeLanguage),
    );
  }
}

class CardItem {
  final String title;
  final String subtitle;
  bool isLiked;

  CardItem({required this.title, required this.subtitle, this.isLiked = false});
}

class CardsScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const CardsScreen({super.key, required this.onLocaleChange});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final List<CardItem> items = [
    CardItem(title: 'Flutter', subtitle: 'Build beautiful apps'),
    CardItem(title: 'Dart', subtitle: 'The language behind Flutter'),
    CardItem(title: 'Mobile', subtitle: 'iOS and Android'),
  ];

  @override
  void initState() {
    super.initState();
    _loadLikes();
  }

  Future<void> _loadLikes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < items.length; i++) {
        items[i].isLiked = prefs.getBool('like_$i') ?? false;
      }
    });
  }

  Future<void> _toggleLike(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      items[index].isLiked = !items[index].isLiked;
      prefs.setBool('like_$index', items[index].isLiked);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              if (Localizations.localeOf(context).languageCode == 'en') {
                widget.onLocaleChange(const Locale('ar'));
              } else {
                widget.onLocaleChange(const Locale('en'));
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item.subtitle),
              trailing: IconButton(
                icon: Icon(
                  item.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: item.isLiked ? Colors.red : Colors.grey,
                ),
                onPressed: () => _toggleLike(index),
              ),
            ),
          );
        },
      ),
    );
  }
}