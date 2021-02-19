import 'imports.dart';
import './screens/journal_entries.dart';
import 'package:journal/widgets/journal_entry_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String themeStatus;
  @override
  void initState() {
    super.initState();
    initThemeStatus();
  }

  void initThemeStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    themeStatus = prefs.getString(themeStatus);
    setState(() {
      currentTheme.currentTheme();
      if (prefs.getString('themeStatus') == null) {
        themeStatus = "Dark Mode";
        currentTheme.setLightMode();
      } else {
        themeStatus = prefs.getString('themeStatus');
        if (themeStatus == 'Dark Mode')
          currentTheme.setLightMode();
        else {
          currentTheme.setDarkMode();
        }
      }
    });
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: currentTheme.currentTheme(),
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Journal'),
              actions: <Widget>[
                themeStatus == null
                    ? CircularProgressIndicator()
                    : PopupMenuButton<String>(
                        onSelected: handleClick,
                        itemBuilder: (BuildContext context) {
                          return {'$themeStatus    '}.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
              ],
            ),
            body: JournalEntriesScreen()));
  }

  void handleClick(String value) async {
    setState(() {
      //change the name on the settings button to change theme
      if (themeStatus == 'Dark Mode')
        themeStatus = 'Light Mode';
      else if (themeStatus == 'Light Mode') themeStatus = 'Dark Mode';
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeStatus', themeStatus);

    currentTheme.switchTheme(); //switch the theme
  }
}
