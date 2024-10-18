import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  GiphyGif? _gif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gif?.title ?? 'Giphy Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: _gif == null
              ? Text(
                  'Pick A Gif',
                  style: TextStyle(fontSize: 30.0),
                )
              : GiphyImage.original(gif: _gif!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.search),
        onPressed: () async {
          GiphyGif? gif = await GiphyPicker.pickGif(
            context: context,
            fullScreenDialog: false,
            showPreviewPage: true,
            apiKey: 'XFIOPi0wndzrjY9ocf8BNJIBrqxx7fL7',
          );
          if (gif != null) {
            setState(() {
              _gif = gif;
            });
          }
        },
      ),
    );
  }
}
