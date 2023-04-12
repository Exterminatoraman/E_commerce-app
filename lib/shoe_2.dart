
import 'main.dart';
import 'shoe_1.dart';
import 'package:flutter/material.dart';
class cart extends StatelessWidget {
  const cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("CHECKOUT")),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: shoe2pg(),
      ),
    );
  }
}
class shoe2pg extends StatefulWidget {
  const shoe2pg({Key? key}) : super(key: key);

  @override
  State<shoe2pg> createState() => _shoe2pgState();
}

class _shoe2pgState extends State<shoe2pg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:AssetImage(img[d]),
              ),
              Text("M.R.P : ₹ "+ price[d],
                style: TextStyle(
                  fontSize: 30,
                ),
              ),

            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 30,
              ),
              Text("Color =  "+ col[c],
                style: TextStyle(
                  fontSize: 30,
                ),),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 30,
              ),
              Text("Size =  "+ SIZE[s],
                style: TextStyle(
                  fontSize: 30,
                ),),
            ],
          )




        ],
      ),
    );
  }
}
