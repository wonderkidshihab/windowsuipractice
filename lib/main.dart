import 'package:code_editor/code_editor.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:windowsuipractice/home_pane.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      themeMode: ThemeMode.dark,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  bool drawerOpended = true;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        selected: currentIndex,
        displayMode: PaneDisplayMode.auto,
        onChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text('Home'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.contact),
            title: const Text('Contacts'),
          ),
          PaneItem(
              icon: const Icon(FluentIcons.message),
              title: const Text('Massages'),
              infoBadge: const InfoBadge(
                source: const Text("1"),
              )),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
          ),
        ],
      ),
      content: NavigationBody(
        index: currentIndex,
        children: const [
          HomePane(),
          Center(
            child: Text('Contacts'),
          ),
          Center(
            child: Text('Massages'),
          ),
          Center(
            child: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
