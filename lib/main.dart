import 'package:flutter/material.dart';

import 'pages/FoodPage.dart';
import 'pages/ShoppingPage.dart';
import 'pages/AddPage.dart';
import 'pages/RecipePage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {
 int _selectedPage =0;
 final _pageOptions= [
     FoodPage(),
     RecipePage(),
     AddPage(),
    ShoppingPage(),
  ];

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Best B4',
        theme: ThemeData(
         primarySwatch: Colors.teal,),
         home: Scaffold (
           appBar: AppBar(
            title:Text('BestB4'),
            backgroundColor: Colors.teal,
            elevation: 20,
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () => {},),
              IconButton(
                icon: Icon(Icons.qr_code_2_rounded),
                tooltip: 'Search',
                onPressed: () => {},)
                ],
              leading: Icon(Icons.menu),
              //ONPRESSED MENU OPEN
              ),
            body: _pageOptions[_selectedPage],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.teal,
              selectedItemColor: Colors.white,
              iconSize: 40,
              selectedFontSize: 15,
              unselectedFontSize: 15,
              currentIndex:_selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage  = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon:Icon(Icons.restaurant_rounded),label: 'Food',backgroundColor: Colors.teal), //, title:Text('Food')
                BottomNavigationBarItem(
                  icon:Icon(Icons.menu_book_rounded),label:'Recipes',backgroundColor: Colors.teal),//, title:Text('Recipes')
                BottomNavigationBarItem(
                  icon:Icon(Icons.add_outlined),label:'Add',backgroundColor: Colors.teal),//, title:Text('Add')
                 BottomNavigationBarItem(
                  icon:Icon(Icons.shopping_cart_rounded),label:'Shopping',backgroundColor: Colors.teal),//,title:Text('Shopping')
              ],
          ),
      ),
      );
  }}




//  class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);


// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//  }
// }
  