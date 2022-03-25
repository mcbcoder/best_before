import 'package:best_before/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:firebase_core/firebase_core.dart';

class testPage extends StatefulWidget {
  String barcodeResult;
testPage({required this.barcodeResult});

  @override
  _testPageState createState() => _testPageState(barcodeResult);
  
}

class _testPageState extends State<testPage> {
var expiryDate = '';
int _value = 0; 
String category = '';
DateTime date = DateTime(2022,03,20);
  String barcodeResult;
  _testPageState(this.barcodeResult);

@override
Widget build(BuildContext context) {
  CollectionReference all = FirebaseFirestore.instance.collection('all');
  CollectionReference fridge = FirebaseFirestore.instance.collection('fridge');
  CollectionReference freezer = FirebaseFirestore.instance.collection('freezer');
  CollectionReference cupboard = FirebaseFirestore.instance.collection('cupboard');
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
    backgroundColor: Color.fromARGB(255, 118, 204, 197),
    appBar: AppBar(
        backgroundColor: Colors.teal,
        title:Text('Found Your Item',
        style: TextStyle(
        fontFamily: 'Fredoka',
        fontSize: 25,
        ),
        ),
      ),
    body:Center(
      child: FutureBuilder(
        future: getProduct(),
        initialData: 'Loading...',
        builder: (BuildContext context,AsyncSnapshot<String> _nameStore){
         String _name = _nameStore.data.toString();;
         return new SingleChildScrollView(
           padding: new EdgeInsets.all(8.0),
           child:
           Column(children: [
             new Text( _nameStore.data.toString(),
             style: new TextStyle(
               fontFamily: 'PacificoRegular',
               fontWeight: FontWeight.w500,
               fontSize: 30,
               color: Colors.teal),
               textAlign: TextAlign.center,
             ),
             SizedBox(height:75),
             Text(
               'Expiry Date: ${date.day}/${date.month}/${date.year}',
             style: TextStyle(fontFamily:'Fredoka',fontSize: 28,color: Colors.white)),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text('Change Expiry Date',style:TextStyle(fontFamily:'Fredoka',fontSize: 25)),
              onPressed: () async {
                DateTime? newdate = await showDatePicker(
                  context: context, 
                initialDate: date,
                 firstDate: DateTime(2022),
                  lastDate: DateTime(2040)
                  );
                  setState(() => date =newdate!);
                    },
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),)
                  ),
                  SizedBox(height:60),
                  Text('Storage area:',style:TextStyle(fontFamily:'Fredoka',fontSize: 30,color: Colors.white)),
                  Text("Fridge", style:TextStyle(fontFamily: 'Fredoka',color: Colors.white,fontSize: 25)),
                  Radio(
                    splashRadius: 12,
                    value: 1, 
                    groupValue: _value, 
                    onChanged: (_) {setState(() {_value = 1;});
                    if(_value == 1) {
                      category = 'Fridge';
                      all.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                      fridge.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                    } 
                    else if (_value == 2) {
                      category = 'Freezer';
                      all.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                      freezer.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                    }
                    else (){
                      category = 'Cupboard';
                      all.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                      cupboard.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                    };
                    }),
                  //SizedBox(width:5),
                  Text("Freezer", style:TextStyle(fontFamily: 'Fredoka',color: Colors.white,fontSize: 25)),
                  Radio(
                    value: 2, 
                    groupValue: _value, 
                    onChanged: (_) {setState(() {_value = 2;});
                    if(_value == 1) {
                      category = 'Fridge';
                      all.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                      fridge.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                    } 
                    else if (_value == 2) {
                      category = 'Freezer';
                      all.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                      freezer.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                    }
                    else (){
                      category = 'Cupboard';
                      all.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                      cupboard.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                    };
                    }),
                  //SizedBox(width:5),
                  Text("Cupboard", style:TextStyle(fontFamily: 'Fredoka',color: Colors.white,fontSize: 25)),
                  Radio(
                    value: 3, 
                    groupValue: _value, 
                    onChanged: (_) {setState(() {_value = 3;});
                    if(_value == 1) {
                      category = 'Fridge';
                      all.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                      fridge.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                    } 
                    else if (_value == 2) {
                      category = 'Freezer';
                      all.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                      freezer.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                    }
                    else (){
                      category = 'Cupboard';
                      all.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                      cupboard.add({'productName' : _name.toString(), 'expiryDate' : date}).then((value) => print('User Added'));
                    };
                    }),
                  //SizedBox(width:5),
                
                SizedBox(height:60),
                ElevatedButton(
                  child: Text('ADD ITEM',style:TextStyle(fontFamily:'Fredoka',fontSize: 25)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> MyApp()));},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),)
                  ),

           ],
          )
        );
        }
      ),
      )
    ),
  );
}

Future<String> getProduct() async {
    ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcodeResult,
      fields: [ProductField.NAME]);

  ProductResult result = await OpenFoodAPIClient.getProduct(configuration);

  if(result.status != 1) {
    print("Error retreiving the product : ${result.status}");;
    }

  String? _nameStore = result.product!.productName;
   debugPrint("Test :${_nameStore}");
   return _nameStore.toString();
  }
}

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(MyApp());
}