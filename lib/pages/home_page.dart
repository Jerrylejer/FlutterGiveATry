import 'package:flutter/material.dart';
import 'package:flutter_examen1/components/video_hero.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;
  void onPressed() {}

  // ###### Logique sidebar menu à développer dans un StatefulWidget ######
  // A ESSAYER => https://docs.flutter.dev/cookbook/design/drawer

  // final int _selectedIndex = 0;

  // static const TextStyle optionStyle =
  //   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Régions',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Paramètres',
  //     style: optionStyle,
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  // ###### Logique sidebar menu à développer dans un StatefulWidget ######

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        // AIDE -> https://api.flutter.dev/flutter/material/AppBar/leading.html
        // Insertion de l'icone menu burger
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: ListView(
        // agencement des sections du body en colonne
        children: <Widget>[
          //Empilez les differentes sections du body - Séparez les avec du padding
          // VIDEO ######################################### VIDEO
          // AIDE => https://www.youtube.com/watch?v=n1Y4HROvFME&t=329s
          const VideoHero(),
          // BANDEAU ######################################### BANDEAU
          // Insertion du bandeau titre de section
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: const Text("I. Nos Régions",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white)),
          ),
          // PARAGRAPHE 1 ############ LOREM IPSUM ################ PARAGRAPHE 1
          // AIDE => https://www.dhiwise.com/post/flutter-lorem-revolutionizing-placeholder-text-in-flutter
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 60),
            child: Text(
              lorem(paragraphs: 1, words: 70),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          // BOUTON ICON + TEXTE ############################################ BOUTON ICON + TEXTE
          // AIDE Icone + texte -> https://www.flutterbeads.com/button-with-icon-and-text-flutter/
          SizedBox(
              width: 200,
              child: ElevatedButton.icon(
                // Renvoyer à la page "Régions" avec onPressed()
                onPressed: onPressed,
                icon: const Icon(Icons.search),
                label: const Text('Rechercher Par Région'),
              )),
          // PARAGRAPHE 2 ############ LOREM IPSUM ################ PARAGRAPHE 2
          // AIDE => https://www.dhiwise.com/post/flutter-lorem-revolutionizing-placeholder-text-in-flutter
          Container(
            padding: const EdgeInsets.fromLTRB(15, 60, 15, 0),
            child: Text(
              lorem(paragraphs: 1, words: 70),
              style: const TextStyle(fontSize: 8, color: Colors.grey),
            ),
          ),
        ],
      ),
      // SIDEBAR ############################################### SIDEBAR
      // AIDE => https://docs.flutter.dev/cookbook/design/drawer
      drawer: Drawer(
        // Add a ListView to the drawer.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('France Data',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  Text(
                    'Atlas de données Françaises',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text('Region'),
              leading: Icon(Icons.map),
              // selected: _selectedIndex == 1,
              // onTap: () {
              //  => Update the state of the app
              //   _onItemTapped(1);
              //  => Then close the drawer
              //   Navigator.pop(context);
              // },
            ),
            ListTile(
              title: Text('Paramètres'),
              leading: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
