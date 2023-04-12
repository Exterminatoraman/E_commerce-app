
import 'package:e_commerce_site/list%20class.dart';
import 'homescreeen.dart';
import 'main.dart';
import 'itemlist.dart';
import 'package:flutter/material.dart';
import 'catergorybuilder.dart';
class checkout extends StatelessWidget {
  const checkout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("CHECKOUT")),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: checkoutpg(),
      ),
    );
  }
}
class checkoutpg extends StatefulWidget {
  const checkoutpg({Key? key}) : super(key: key);

  @override
  State<checkoutpg> createState() => _checkoutpgState();
}

class _checkoutpgState extends State<checkoutpg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              child: Image.network(itemList[d].product[ID].pictures.path),
            ),
          ),
              SizedBox(
                width: 100,
                height: 30,
              ),
              Text("Name  =  "+ itemList[d].product[ID].names,
                style: TextStyle(
                  fontSize: 30,
                ),),
              SizedBox(
                height: 20,
              ),
              Text("M.R.P : ₹ "+ itemList[d].product[ID].price,
                style: TextStyle(
              fontSize: 30,
                ),
              ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 30,
              ),
              Text("Weight =  "+ itemList[d].product[ID].weight+" gm",
                style: TextStyle(
                  fontSize: 30,
                ),),
            ],
          ),





        ],
      ),
    );
  }
}
