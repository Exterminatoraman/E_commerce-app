import 'package:e_commerce_site/homescreeen.dart';
import 'package:e_commerce_site/shoe_2.dart';
import 'package:flutter/material.dart';
import 'shoe_1.dart';
import 'UI.dart';
import 'itembuilder.dart';
import 'catergorybuilder.dart';
import 'inventory.dart';
import 'list class.dart';
import 'main.dart';
int ID=0;
items b=things[d];
int s=0;
class itemlist extends StatelessWidget {

  const itemlist({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
      body: Container(
        height: 2000,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 2000,
            child: Column(
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
                Text("$d"),

                Expanded(
                  child:  GridView.builder
                    (
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3
                      ),
                      itemCount: itemList[d].product.length,
                      itemBuilder: (context, Index) {
                        return Container(
                          child: Column(
                            children: [
                              IconButton(
                                icon: Image.network(itemList[d].product[Index].pictures.path),
                                iconSize: 150,
                                onPressed: () {
                                  ID=Index;
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const inventory()),
                                  );
                                },
                              ),

                              Center(
                                child: Text(itemList[d].product[Index].names,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],



            ),
          ),
        ),
      ),

    );
  }
}


