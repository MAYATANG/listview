import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("ListView範例"),
    );

    final textWrapper = _TextWrapper(GlobalKey<_TextWrapperState>());

    const items = <String>['第一項', '第二項', '第三項','第四項','第五項','第六項','第七項','第八項'];
    const subtitle =<String>['eins', 'zwei', 'drei','vier','fünf','sechs','sieben','acht',];

    var listView = ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          items[index],
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () => textWrapper.setText("click ${subtitle[index]}"),
      ),
    );

    listView = ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          items[index],
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () => textWrapper.setText("click ${subtitle[index]}"),
        leading: Container(
          child: const Icon(Icons.ac_unit_rounded,),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        ),
        trailing: const Icon(Icons.keyboard_arrow_right),
        subtitle: Text(subtitle[index],style: const TextStyle(fontSize: 14),),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
    
    final widget = Container(
      child: Column(
        children: [
          textWrapper,
          Expanded(
            child: listView,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _TextWrapper extends StatefulWidget {
  final GlobalKey<_TextWrapperState> _key;

  const _TextWrapper(this._key) : super(key: _key);

  @override
  _TextWrapperState createState() => _TextWrapperState();

  setText(String string) {
    _key.currentState?.setText(string);
  }
}

class _TextWrapperState extends State<_TextWrapper> {
  String _str = "";

  @override
  Widget build(BuildContext context) {
    var widget = Text(
      _str,
      style: const TextStyle(fontSize: 20),
    );

    return widget;
  }

  setText(String string) {
    setState(() {
      _str = string;
    });
  }
}
////////////////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final appBar = AppBar(
//       title: const Text("ListView範例"),
//     );
//
//     final textWrapper = _TextWrapper(GlobalKey<_TextWrapperState>());
//
//     const items = <String>["第一項", "第二項", "第三項"];
//     const icons = <String>["assets/1.png", "assets/2.png", "assets/3.png"];
//
//     var listView = ListView(
//       children: ListTile.divideTiles(context: context, tiles: [
//         ListTile(
//           title: const Text(
//             "第一項",
//             style: TextStyle(fontSize: 20),
//           ),
//           onTap: () => textWrapper.setText("點選第一項"),
//         ),
//         ListTile(
//           title: const Text(
//             "第二項",
//             style: TextStyle(fontSize: 20),
//           ),
//           onTap: () => textWrapper.setText("點選第二項"),
//         ),
//         ListTile(
//           title: const Text(
//             "第三項",
//             style: TextStyle(fontSize: 20),
//           ),
//           onTap: () => textWrapper.setText("點選第三項"),
//         ),
//       ],).toList(),);
//
//     listView = ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) => ListTile(
//         title: Text(
//           items[index],
//           style: const TextStyle(fontSize: 20),
//         ),
//         onTap: () => textWrapper.setText("點選${items[index]}"),
//       ),
//     );
//
//     listView = ListView.separated(
//       itemCount: items.length,
//       itemBuilder: (context, index) =>
//       Card(
//           child:ListTile(
//         title: Text(
//           items[index],
//           style: const TextStyle(fontSize: 20),
//         ),
//         onTap: () => textWrapper.setText("點選${items[index]}"),
//         leading: Container(
//           child: Image.asset(icons[index],),
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//         ),
//         trailing: const Icon(Icons.keyboard_arrow_right),
//       ),
//       ),
//       separatorBuilder: (context, index) => const Divider(),
//     );
//
//     listView = ListView.separated(
//       itemCount: items.length,
//       itemBuilder: (context, index) => ListTile(
//         title: Text(
//           items[index],
//           style: const TextStyle(fontSize: 20),
//         ),
//         onTap: () => textWrapper.setText("點選${items[index]}"),
//         leading: Container(
//           child: CircleAvatar(backgroundImage: AssetImage(icons[index],),),
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//         ),
//         subtitle: const Text("項目說明", style: TextStyle(fontSize: 16),),
//         trailing: const Icon(Icons.keyboard_arrow_right),
//       ),
//       separatorBuilder: (context, index) => const Divider(),
//     );
//
//     final widget = Container(
//       child: Column(
//         children: [
//           textWrapper,
//           Expanded(
//             child: listView,
//           ),
//         ],
//       ),
//       margin: const EdgeInsets.symmetric(vertical: 10),
//     );
//
//     final appHomePage = Scaffold(
//       appBar: appBar,
//       body: widget,
//     );
//
//     return appHomePage;
//   }
// }
//
// class _TextWrapper extends StatefulWidget {
//   final GlobalKey<_TextWrapperState> _key;
//
//   const _TextWrapper(this._key) : super(key: _key);
//
//   @override
//   _TextWrapperState createState() => _TextWrapperState();
//
//   setText(String string) {
//     _key.currentState?.setText(string);
//   }
// }
//
// class _TextWrapperState extends State<_TextWrapper> {
//   String _str = "";
//
//   @override
//   Widget build(BuildContext context) {
//     var widget = Text(
//       _str,
//       style: const TextStyle(fontSize: 20),
//     );
//
//     return widget;
//   }
//
//   setText(String string) {
//     setState(() {
//       _str = string;
//     });
//   }
// }
////////////////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final appBar = AppBar(
//       title: const Text("ListView範例"),
//     );
//
//     final textWrapper = _TextWrapper(GlobalKey<_TextWrapperState>());
//
//     const items = <String>["第一項", "第二項", "第三項"];
//     const icons = <String>["assets/1.png", "assets/2.png", "assets/3.png"];
//
//     var listView = ListView(
//       children: ListTile.divideTiles(context: context, tiles: [
//         ListTile(
//           title: const Text(
//             "第一項",
//             style: TextStyle(fontSize: 20),
//           ),
//           onTap: () => textWrapper.setText("點選第一項"),
//         ),
//         ListTile(
//           title: const Text(
//             "第二項",
//             style: TextStyle(fontSize: 20),
//           ),
//           onTap: () => textWrapper.setText("點選第二項"),
//         ),
//         ListTile(
//           title: const Text(
//             "第三項",
//             style: TextStyle(fontSize: 20),
//           ),
//           onTap: () => textWrapper.setText("點選第三項"),
//         ),
//       ],).toList(),);
//
//     listView = ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) => ListTile(
//         title: Text(
//           items[index],
//           style: const TextStyle(fontSize: 20),
//         ),
//         onTap: () => textWrapper.setText("點選${items[index]}"),
//       ),
//     );
//
//     listView = ListView.separated(
//       itemCount: items.length,
//       itemBuilder: (context, index) => ListTile(
//         title: Text(
//           items[index],
//           style: const TextStyle(fontSize: 20),
//         ),
//         onTap: () => textWrapper.setText("點選${items[index]}"),
//         leading: Container(
//           child: Image.asset(icons[index],),
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//         ),
//         trailing: const Icon(Icons.keyboard_arrow_right),
//       ),
//       separatorBuilder: (context, index) => const Divider(),
//     );
//
//     listView = ListView.separated(
//       itemCount: items.length,
//       itemBuilder: (context, index) => ListTile(
//         title: Text(
//           items[index],
//           style: const TextStyle(fontSize: 20),
//         ),
//         onTap: () => textWrapper.setText("點選${items[index]}"),
//         leading: Container(
//           child: CircleAvatar(backgroundImage: AssetImage(icons[index],),),
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//         ),
//         subtitle: const Text("項目說明", style: TextStyle(fontSize: 16),),
//         trailing: const Icon(Icons.keyboard_arrow_right),
//       ),
//       separatorBuilder: (context, index) => const Divider(),
//     );
//
//     final widget = Container(
//       child: Column(
//         children: [
//           textWrapper,
//           Expanded(
//             child: listView,
//           ),
//         ],
//       ),
//       margin: const EdgeInsets.symmetric(vertical: 10),
//     );
//
//     final appHomePage = Scaffold(
//       appBar: appBar,
//       body: widget,
//     );
//
//     return appHomePage;
//   }
// }
//
// class _TextWrapper extends StatefulWidget {
//   final GlobalKey<_TextWrapperState> _key;
//
//   const _TextWrapper(this._key) : super(key: _key);
//
//   @override
//   _TextWrapperState createState() => _TextWrapperState();
//
//   setText(String string) {
//     _key.currentState?.setText(string);
//   }
// }
//
// class _TextWrapperState extends State<_TextWrapper> {
//   String _str = "";
//
//   @override
//   Widget build(BuildContext context) {
//     var widget = Text(
//       _str,
//       style: const TextStyle(fontSize: 20),
//     );
//
//     return widget;
//   }
//
//   setText(String string) {
//     setState(() {
//       _str = string;
//     });
//   }
// }


///////////////////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyStatelessWidget(),
//       ),
//     );
//   }
// }
//
// class CustomListItem extends StatelessWidget {
//   const CustomListItem({
//     Key? key,
//     required this.thumbnail,
//     required this.title,
//     required this.user,
//     required this.viewCount,
//   }) : super(key: key);
//
//   final Widget thumbnail;
//   final String title;
//   final String user;
//   final int viewCount;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             flex: 2,
//             child: thumbnail,
//           ),
//           Expanded(
//             flex: 3,
//             child: _VideoDescription(
//               title: title,
//               user: user,
//               viewCount: viewCount,
//             ),
//           ),
//           const Icon(
//             Icons.more_vert,
//             size: 16.0,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _VideoDescription extends StatelessWidget {
//   const _VideoDescription({
//     Key? key,
//     required this.title,
//     required this.user,
//     required this.viewCount,
//   }) : super(key: key);
//
//   final String title;
//   final String user;
//   final int viewCount;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: const TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 14.0,
//             ),
//           ),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
//           Text(
//             user,
//             style: const TextStyle(fontSize: 10.0),
//           ),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
//           Text(
//             '$viewCount views',
//             style: const TextStyle(fontSize: 10.0),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8.0),
//       itemExtent: 106.0,
//       children: <CustomListItem>[
//         CustomListItem(
//           user: 'Me',
//           viewCount: 999000,
//           thumbnail: Container(
//             decoration: const BoxDecoration(color: Colors.blue),
//           ),
//           title: 'First',
//         ),
//         CustomListItem(
//           user: 'You',
//           viewCount: 884000,
//           thumbnail: Container(
//             decoration: const BoxDecoration(color: Colors.yellow),
//           ),
//           title: 'Second',
//         ),
//       ],
//     );
//   }
// }

///////////////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     MyApp(
//       items: List<String>.generate(10, (i) => '項目 $i'),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   final List<String> items;
//
//   const MyApp({Key? key, required this.items}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     const title = 'Long List';
//
//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(title),
//         ),
//         body: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(items[index]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final List<String> entries = <String>['A', 'B', 'C'];
//     final List<int> colorCodes = <int>[600, 500, 100];
//
//     return ListView.separated(
//       padding: const EdgeInsets.all(8),
//       itemCount: entries.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           height: 50,
//           color: Colors.amber[colorCodes[index]],
//           child: Center(child: Text('Entry ${entries[index]}')),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) => const Divider(),
//     );
//   }
// }

///////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final List<String> entries = <String>['A', 'B', 'C'];
//     final List<int> colorCodes = <int>[600, 500, 100];
//
//     return ListView.builder(
//         padding: const EdgeInsets.all(8),
//         itemCount: entries.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             height: 50,
//             color: Colors.amber[colorCodes[index]],
//             child: Center(child: Text('Entry ${entries[index]}')),
//           );
//         }
//     );
//   }
// }
///////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//       return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: MyHomePage(),
//       );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         Container(
//           height: 50,
//           color: Colors.amber[600],
//           child: const Center(child: Text('Entry A')),
//         ),
//         Container(
//           height: 50,
//           color: Colors.amber[500],
//           child: const Center(child: Text('Entry B')),
//         ),
//         Container(
//           height: 50,
//           color: Colors.amber[100],
//           child: const Center(child: Text('Entry C')),
//         ),
//       ],
//     );
//   }
// }