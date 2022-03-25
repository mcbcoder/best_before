import 'package:best_before/ShoppingList/toDos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/FoodPage.dart';
import 'pages/RecipePage.dart';
import 'pages/ShoppingPage.dart';

import 'package:flutter/services.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:best_before/FoodAPI/testPage.dart';


Future<void> main()async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),);
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {
  String result= "Scan an item!";

  Future _scanBarcode() async{
    try{
      ScanResult scanResult = await BarcodeScanner.scan();
      String barcodeResult = scanResult.rawContent;
      ProductResult productResult = await OpenFoodAPIClient.getProductRaw(barcodeResult, OpenFoodFactsLanguage.ENGLISH);
      
      setState(() {
        result = barcodeResult;
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=> testPage(barcodeResult:barcodeResult)));
      });

    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState((){
        result = "CAMERA PERMISSION WAS DENIED. \n EDIT THIS IN YOUR SETTINGS";
      });
    }else {
      setState(() {
        result = "404 ERROR UNKNOWN $ex";
      });
    }
  } on FormatException {
    setState(() {
      result = "SCAN AN ITEM";
    });
  } catch (ex){
    setState(() {
        result = "404 ERROR UNKNOWN $ex";
      });
    }
  }


 int _selectedPage =0;
 final _pageOptions= [
    FoodPage(),
    RecipePage(),
    ShoppingPage(),
  ];

  

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create:(context) => TodosProvider(),
    child: MaterialApp(
      //title: 'Best B4',
        theme: ThemeData(
         primarySwatch: Colors.teal,),
         debugShowCheckedModeBanner: false,
         home: Scaffold (
           appBar: AppBar(
            title:Text(
              'BestB4',
              style: TextStyle(
                  fontFamily: 'PacificoRegular',
                  fontSize: 30,
              ),
            ),
            backgroundColor: Colors.teal,
            elevation: 20,
            actions: [
              IconButton(
                icon: Icon(Icons.camera_alt),
                tooltip: 'Add item',
                onPressed:_scanBarcode,
                // (){
                //    Navigator.push(
                //      context, 
                //      MaterialPageRoute(builder: (context) => BarcodePage()));
              
              )
              ],
              //ONPRESSED MENU OPEN
           ),
            body:_pageOptions[_selectedPage],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.teal,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
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
                  icon:Icon(Icons.restaurant_rounded),
                  label: 'Food',
                  ), //, title:Text('Food')
                BottomNavigationBarItem(
                  icon:Icon(Icons.menu_book_rounded),
                  label:'Recipes',
                  ),//, title:Text('Recipes')
                 BottomNavigationBarItem(
                  icon:Icon(Icons.shopping_cart_rounded),
                  label:'Shopping',
                  ),//,title:Text('Shopping')
              ],
          ),
      ),
      )); 
  }
  
class NavigationDrawer extends StatelessWidget{
    final padding = EdgeInsets.symmetric(horizontal:20);
    @override
        Widget build(BuildContext context) {
        return Drawer(
          child: Container(
            color: Colors.teal,
            child:ListView(
              children: <Widget>[
                const SizedBox(height: 48),
                buildMenuItem(
                  text: 'Food',
                  icon: Icons.restaurant_rounded,
                )
              ]
            )
          )
        );
      }
}
    Widget buildMenuItem({
       required String text,
       IconData? icon,
    }) {
      final color = Colors.white;
      return ListTile(
      leading: Icon(icon,color: color),
      title: Text(text,style: TextStyle(color: color)),
      hoverColor: Colors.tealAccent,
      onTap: () {}

      );
    }