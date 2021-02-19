import 'package:flutter/material.dart';
import '../widgets/journal_scaffold.dart';

class JournalEntriesScreen extends StatefulWidget {
  static const routeKey = 'journal_entries';

  @override
  _JournalEntriesScreenState createState() => _JournalEntriesScreenState();
}

class _JournalEntriesScreenState extends State<JournalEntriesScreen> {
  final items = List<Map>.generate(10000, (i) {
    return {
      'title': 'Journal Entry $i',
      'subtitle': 'Subtitle text for $i',
    };
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount: /*number of items in the list, if known*/,
      itemBuilder: (context, index) {
        return ListTile(
          leading: FlutterLogo(),
          trailing: Icon(Icons.more_horiz),
          title: Text('Journal Entry ${items[index]['title']}'),
          subtitle: Text('Example subtitle ${items[index]['subtitle']}'),
          //onTap: () {Navigator.of(context).pushNamed(/*route name here*/)},
        );
      },
    );
  }
}


/*

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: Text('${desserts.length} Desserts')),
            body: DessertsScreen(desserts: desserts),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  addDessert('New Cake! ${desserts.length}');
                },
                child: Icon(Icons.cake))));
  }

  void addDessert(String name) {
    // DONE
    setState(() {
      desserts.add(name);
    });
  }
}

class DessertsScreen extends StatefulWidget {
  final List<String> desserts;

  DessertsScreen({this.desserts});

  @override
  DessertsScreenState createState() => DessertsScreenState(desserts: desserts);
}

class DessertsScreenState extends State<DessertsScreen> {
  final List<String> desserts;

  DessertsScreenState({this.desserts});

  @override
  Widget build(BuildContext context) {
    // DONE
    return ListView.builder(
        itemCount: desserts.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: FlutterLogo(),
              trailing: Icon(Icons.cake),
              title: Text(desserts[index]),
              subtitle: Text('Mmmm delicious!'));
        });
  }
}
*/