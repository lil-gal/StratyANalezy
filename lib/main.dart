import 'package:flutter/material.dart';

import 'package:nalezy/pages/chat.dart';
import 'package:nalezy/pages/createPost.dart';

import 'package:nalezy/widget/on_hover_button.dart';
import 'package:nalezy/widget/on_hover_icon_button.dart';

import 'package:nalezy/widget/footer.dart';

//-----PAGES-----------------------------
import 'package:nalezy/pages/chats.dart';
import 'package:nalezy/pages/home.dart';

import 'package:nalezy/themes/main_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Straty a Nalezy',
      theme: AppTheme.lightTheme,
      
      debugShowCheckedModeBanner: false,


      initialRoute: '/home',
      //home: const MyHomePage(title: 'Straty a Nalezy'),
      routes: {
          '/home': (context) => const HomePage(title: 'Straty a Nalezy'),
          '/map': (context) => const Placeholder(),
          '/add': (context) => CreatePostPage(title: 'Create a Post'),
          '/chats': (context) => const ChatsPage(title: 'Chats'),
          '/chat' : (context) => const ChatPage(title: 'Chat'),
          '/settings': (context) => const Placeholder(),
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: AppTheme.normal,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
        
      ),
      body: Center(
      
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [

            ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/chats');
              },
              child: const Text('Go to Chats Page'),
            ),

            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            OnHoverButton(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: AppTheme.normal,
                    width: 2.5,
                  ),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(0.0),
                ),
                onPressed: _resetCounter,
                child: HoverIconButton(
                  icon: Icon(Icons.refresh, size: 16,),
                  onPressed: (){
                    // Handle reply button press
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer()
    );
  }
}
