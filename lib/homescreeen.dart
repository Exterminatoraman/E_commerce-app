import 'package:e_commerce_site/homescreeen.dart';
import 'package:e_commerce_site/list%20class.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'shoe_2.dart';
import 'shoe_1.dart';
import 'itembuilder.dart';
import 'catergorybuilder.dart';
import 'itemlist.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

final storage = FirebaseStorage.instance;
List<itemlist1> itemList=[];


class h2 extends StatefulWidget {
  const h2({Key? key}) : super(key: key);

  @override
  State<h2> createState() => _h2State();
}

class _h2State extends State<h2> {

  @override
  void initState() {
    super.initState();
    getItemList();
  }

  Future<void> getItemList() async {
    List<itemlist1> fetchedItemList = await fetchItemList();
    setState(() {
      itemList = fetchedItemList;
    });
  }

  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Center(child: Text("BROWSE")),
            backgroundColor: Colors.deepPurpleAccent,
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  itemadder2()),);
                  },
                  child: Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                ),
              ),
            ],
          ),
          body:SizedBox(
            height:3000,
            child: SingleChildScrollView(
              child: GridView.builder
                (    shrinkWrap: true,
                  physics: ClampingScrollPhysics(),

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2
                  ),

                  itemCount: itemList.length,
                  itemBuilder: (context, Index) {
                    return Container(
                      height: 100,

                      child: Column(
                        children: [
                          IconButton(
                            icon: Image.network(itemList[Index].pic.path,
                              fit: BoxFit.fitHeight,),
                            iconSize: 150,
                            onPressed: () {
                              print(itemList);
                              d=Index;
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const itemlist()),
                              );
                            },
                          ),

                          Center(
                            child: Text(itemList[Index].name,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ),


    );
  }
}
// class homescreen extends StatelessWidget {
//
//   const homescreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(
//         title: Center(child: Text("BROWSE")),
//     backgroundColor: Colors.deepPurpleAccent,
//           actions: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(right: 20.0),
//               child: GestureDetector(
//                 onTap: () {
//
//                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  itemadder2()),);
//                 },
//                 child: Icon(
//                   Icons.add,
//                   size: 26.0,
//                 ),
//               ),
//             ),
//           ],
//     ),
//       body:SizedBox(
//         height:3000,
//         child: SingleChildScrollView(
//         child: SizedBox(
//           height: 2000,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//
//                     icon:Image.asset('images/gold_necklace.jpg'),
//                     iconSize: 120,
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const mypage()),
//                       );
//                       Border.all(
//                         width: 1,
//                         color: Colors.blue,
//                         style: BorderStyle.solid,
//                       );
//                   },
//                   ),
//                   IconButton(
//                     icon:Image.asset('images/GOLD_CHAIN.jpeg'),
//                     iconSize: 120,
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const mypage()),
//                       );
//                       Border.all(
//                         width: 1,
//                         color: Colors.blue,
//                         style: BorderStyle.solid,
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon:Image.asset('images/goldring.jpeg'),
//                     iconSize: 120,
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const mypage()),
//                       );
//                       Border.all(
//                         width: 1,
//                         color: Colors.blue,
//                         style: BorderStyle.solid,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text('  Gold Necklace',
//                   style:TextStyle(
//                     fontSize: 15,
//                   ),
//                     ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Text('        Gold Chains',
//                     style:TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 40,
//                   ),
//                   Text('     Gold Rings',
//                     style:TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child:  GridView.builder
//                   (
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 2,
//                         mainAxisSpacing: 2
//                     ),
//
//                     itemCount: pictures2.length,
//                     itemBuilder: (context, Index) {
//                       return Container(
//                         height: 100,
//
//                         child: Column(
//                           children: [
//                             IconButton(
//                               icon: Image.network(itemList[Index].pic.uri.toString(),
//                               fit: BoxFit.fitHeight,),
//                               iconSize: 150,
//                               onPressed: () {
//                                 d=Index;
//                                 Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) => const itemlist()),
//                                 );
//                               },
//                             ),
//
//                             Center(
//                               child: Text(itemList[Index].name,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                 ),
//               )
//             ],
//           ),
//         ),
//         ),
//       ),
//     );
//   }
// }
