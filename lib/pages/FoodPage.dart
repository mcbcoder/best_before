import 'package:best_before/FoodAPI/foodCard.dart';
import 'package:best_before/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:best_before/FoodAPI/testPage.dart';
import 'package:best_before/FoodAPI/Food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
}


class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
    final Stream<QuerySnapshot> _all =
  FirebaseFirestore.instance.collection('all').snapshots();
  List<Object>_allList =[];

    final Stream<QuerySnapshot> _fridge =
  FirebaseFirestore.instance.collection('all').snapshots();
  List<Object>_fridgeList =[];

    final Stream<QuerySnapshot> _freezer =
  FirebaseFirestore.instance.collection('all').snapshots();
  List<Object>_freezerList =[];

    final Stream<QuerySnapshot> _cupboard =
  FirebaseFirestore.instance.collection('all').snapshots();
  List<Object>_cupboardList =[];

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

  Future getAllItemsList() async {  
    var data = await FirebaseFirestore.instance
    .collection('all')
    .orderBy('expiryDate',descending:false)
    .get();

   setState(() {
     _allList = List.from(data.docs.map((doc)=>Food.fromSnapshot(doc)));
   });
  }

  Future getFridgeItemsList() async {  
    var data = await FirebaseFirestore.instance
    .collection('fridge')
    .orderBy('expiryDate',descending:false)
    .get();

   setState(() {
     _fridgeList = List.from(data.docs.map((doc)=>Food.fromSnapshot(doc)));
   });
  }

  Future getFreezerItemsList() async {  
    var data = await FirebaseFirestore.instance
    .collection('freezer')
    .orderBy('expiryDate',descending:false)
    .get();

   setState(() {
     _freezerList = List.from(data.docs.map((doc)=>Food.fromSnapshot(doc)));
   });
  }

  Future getCupboardItemsList() async {  
    var data = await FirebaseFirestore.instance
    .collection('cupboard')
    .orderBy('expiryDate',descending:false)
    .get();

   setState(() {
     _cupboardList = List.from(data.docs.map((doc)=>Food.fromSnapshot(doc)));
   });
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    getAllItemsList();
    getFridgeItemsList();
    getFreezerItemsList();
    getCupboardItemsList();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            //primarySwatch: Colors.teal,

            ),
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: Color.fromRGBO(51, 171, 160, 0.612),
              appBar: AppBar(
                toolbarHeight:0,
                backgroundColor: Colors.white,
                elevation: 5,
                bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Color.fromRGBO(51, 171, 160, 100),
                  indicatorPadding: EdgeInsets.only(left: -20, right: -20),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Color.fromRGBO(51, 171, 160, 100),
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'ALL',
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('FRIDGE'),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('FREEZER'),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('CUPBOARD'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body:
               TabBarView(children: [
                ListView.builder(itemCount:_allList.length,
                itemBuilder: (context,index) {
                  return foodCard(_allList[index] as Food);
                },),
                ListView.builder(itemCount:_fridgeList.length,
                itemBuilder: (context,index) {
                  return foodCard(_fridgeList[index] as Food);
                },),
                ListView.builder(itemCount:_freezerList.length,
                itemBuilder: (context,index) {
                  return foodCard(_freezerList[index] as Food);
                },),
                ListView.builder(itemCount:_cupboardList.length,
                itemBuilder: (context,index) {
                  return foodCard(_cupboardList[index] as Food);
                },),
              ]),
              floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(51, 171, 160, 100),
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanBarcode,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            )),
            );
  }
}
