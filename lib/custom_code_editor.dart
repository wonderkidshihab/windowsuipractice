import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';

class CustomCodeEditor extends StatefulWidget {
  const CustomCodeEditor({Key? key}) : super(key: key);

  @override
  State<CustomCodeEditor> createState() => _CustomCodeEditorState();
}

class _CustomCodeEditorState extends State<CustomCodeEditor> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Card(
        child: CodeEditor(
          model: EditorModel(
            styleOptions: EditorModelStyleOptions(),
            files: [
              FileEditor(language: "html", name: "index.html", code: """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h1>Hello World</h1>
    <h1>Hello World</h1>
    <h1>Hello World</h1>
    <h1>Hello World</h1>
    <h1>Hello World</h1>
</body>
</html>
        """),
              FileEditor(language: "css", name: "style.css", code: """
body {
    background-color: #f0f0f0;
}
        """),
            ],
          ),
        ),
      ),
    );
  }
}
