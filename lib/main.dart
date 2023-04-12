import 'package:e_commerce_site/homescreeen.dart';
import 'package:e_commerce_site/shoe_2.dart';
import 'package:flutter/material.dart';
import 'shoe_1.dart';
import 'UI.dart';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'itembuilder.dart';
import 'catergorybuilder.dart';
import 'inventory.dart';
import 'list class.dart';
int d=0;
int s=0;

Future<List<itemlist1>> callist() async {
  final itemList = await fetchItemList();
  return itemList;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final itemList = await fetchItemList();
  print(itemList[0].product.length);
  runApp(ecom());
}
class ecom extends StatelessWidget {
  const ecom({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      home: h2()
    );
  }
}
class mypage extends StatelessWidget {
  const mypage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BROWSE")),
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  itemadder1()),);

              },
              child: Icon(
                Icons.add,
                size: 26.0,
              ),
            ),
          ),


        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: 2000,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Image.asset('images/SHOE1.jpg'),
                    iconSize: 160,
                    onPressed: () {
                      d=0;
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const shoe1()),
                      );
                    },
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Image.asset('images/shoe 2.jpg'),
                    iconSize: 160,
                    onPressed: () {
                      d=1;
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const shoe1()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Image.asset('images/shoes 3.jpg'),
                    iconSize: 160,
                    onPressed: () {
                      d=2;
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const shoe1()),
                      );
                    },
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Image.asset('images/shoes 4.jpg'),
                    iconSize: 160,
                    onPressed: () {
                      d=3;
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const shoe1()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Image.asset('images/shoes 5.jpg'),
                    iconSize: 160,
                    onPressed: () {
                      d=4;
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const shoe1()),
                      );
                    },
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Image.asset('images/shoes 6.jpg'),
                    iconSize: 160,
                    onPressed: () {
                      d=5;
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const shoe1()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Image.asset('images/shoes 7.jpg'),
                    iconSize: 160,
                    onPressed: () {
                      d=6;
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const shoe1()),
                      );
                    },
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Image.asset('images/shoes 8.jpg'),
                    iconSize: 160,
                    onPressed: () {
                      d=7;
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const shoe1()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}


