import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  static const methodChannel = const MethodChannel('com.zzb');
  static const eventChannel = EventChannel('com.zzb.event');

  String _batteryLevel = 'Unknown battery level.';
  String _token = '-1';
  String _event = 'null';

  // Native call flutter method
  Future<void> handleCallFromNative(MethodCall call) async {
    switch(call.method) {
      case "didRecieveTranscript":
        setTokenData();
      break;
      case "didRecieveTranscript2": {
        final String token = call.arguments;
        setTokenData2(token);
      }
      break;
    }
  }

  eventResultsHandler(dynamic event) {
    final String normalizedEvent = event.toLowerCase();

    setState(() {
      _event = normalizedEvent;
    });
  }

  eventResultErrorHandler(dynamic error) => print('Received error: ${error.message}');

  void initEventHandler() {
    eventChannel.receiveBroadcastStream().listen(eventResultsHandler, onError: eventResultErrorHandler);
  }

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

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      // Flutter call native method
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<void> getToken() async {
    String token;
    try {
      // Flutter call native method
      final String result = await methodChannel.invokeMethod('getToken', ["989898"]);
      token = result;
    } on PlatformException catch(e) {
      token = "000000";
    }

    setState(() {
      _token = token;
    });
  }

  void setTokenData() {
    setState(() {
      _token = "didRecieveTranscript_98";
    });
  }

  void setTokenData2(String token) {
    setState(() {
      _token = "didRecieveTranscript_" + token;
    });
  }

  @override
  Widget build(BuildContext context) {
    methodChannel.setMethodCallHandler(this.handleCallFromNative);
    initEventHandler();

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$_batteryLevel',
            ),
            Text(
              'token: $_token',
            ),
            Text(
              'event: $_event',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getToken,//_getBatteryLevel,//_incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
