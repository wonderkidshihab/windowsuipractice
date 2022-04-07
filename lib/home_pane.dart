import 'package:code_editor/code_editor.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:windowsuipractice/custom_code_editor.dart';

class HomePane extends StatefulWidget {
  const HomePane({Key? key}) : super(key: key);

  @override
  State<HomePane> createState() => _HomePaneState();
}

class _HomePaneState extends State<HomePane> {
  int currentIndex = 0;
  int tabs = 1;
  @override
  Widget build(BuildContext context) {
    return TabView(
      currentIndex: currentIndex,
      onChanged: (index) => setState(() => currentIndex = index),
      onNewPressed: () {
        setState(() => tabs++);
      },
      tabs: List.generate(tabs, (index) {
        return Tab(
          text: Text('Tab $index'),
          closeIcon: FluentIcons.chrome_close,
          onClosed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return ContentDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you want to close this tab?'),
                    actions: [
                      Button(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Button(
                        child: const Text('Close'),
                        onPressed: () {
                          setState(() => tabs--);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          },
        );
      }),
      bodies: List.generate(
        tabs,
        (index) => const CustomCodeEditor(),
      ),
    );
  }
}
