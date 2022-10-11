import 'main.dart';
import 'package:flutter/material.dart';
import 'shoe_2.dart';

bool select1 = false;
bool select2 = false;
bool select3 = false;
bool select4 = false;
int c = 0;
List col = ["blue", "black", "red", "green"];
List img = [
  'images/SHOE1.jpg',
  'images/shoe 2.jpg',
  'images/shoes 3.jpg',
  'images/shoes 4.jpg',
  'images/shoes 5.jpg',
  'images/shoes 6.jpg',
  'images/shoes 7.jpg',
  'images/shoes 8.jpg',
];
List SIZE=["6","7","8","8"];
List price = [
  '11999.00',
  '18999.00',
  '7999.00',
  '5999.00',
  '9999.00',
  '13999.00',
  '6999.00',
  '1299.00',
];
int n = d + 1;
int buy = 0;

class shoe1 extends StatelessWidget {
  const shoe1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("SHOE $n")),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: shoe1pg(),
      ),
    );
  }
}

class shoe1pg extends StatefulWidget {
  const shoe1pg({Key? key}) : super(key: key);

  @override
  State<shoe1pg> createState() => _shoe1pgState();
}

class _shoe1pgState extends State<shoe1pg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: Image.asset(img[d]),
            ),
          ),
          Container(
            child: Text(
              "M.R.P : ₹ " + price[d],
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('COLOURS'),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 80,
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      c = 0;
                      setState(() {
                        select1 = !select1;
                      });
                    },
                  ),
                  color: select1 ? Colors.yellow : Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 80,
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      c = 2;
                      setState(() {
                        select2 = !select2;
                      });
                    },
                  ),
                  color: select2 ? Colors.yellow : Colors.black,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 80,
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      c = 2;
                      setState(() {
                        select3 = !select3;
                      });
                    },
                  ),
                  color: select3 ? Colors.yellow : Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 80,
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      c = 3;
                      setState(() {
                        select4 = !select4;
                      });
                    },
                  ),
                  color: select4 ? Colors.yellow : Colors.green,
                  // if(select==true){
                  //   color: Colors.yellow,
                  // }
                  // else{
                  //   color: Colors.white,}
                ),
                // ElevatedButton(
                //   style: ButtonStyle(
                //     overlayColor: MaterialStateProperty.resolveWith<Color?>(
                //           (Set<MaterialState> states) {
                //         if (states.contains(MaterialState.pressed))
                //           return Colors.black;
                //         else if(states.contains(MaterialState.pressed))
                //           return Colors.yellow;
                //       },
                //     ),
                //   ),
                //   onPressed: (){},
                //   child: Container(
                //     color: Colors.yellow,
                //   ),
                // ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("SIZE"),
                SizedBox(
                  width: 45,
                ),
                TextButton(
                  onPressed: () {
                    s = 0;
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      "US 6",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    s = 1;
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      "US 7",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    s = 2;
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      "US 8",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    s = 3;
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      "US 9",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                buy = buy + 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const cart()),
                );
              },
              child: (Container(
                child: Text("Buy"),
              )))
        ],
      ),
    );
  }
}
