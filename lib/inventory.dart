import 'package:e_commerce_site/Checkout.dart';
import 'list class.dart';
import 'itemlist.dart';
import 'homescreeen.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'catergorybuilder.dart';
import 'shoe_2.dart';
import 'itembuilder.dart';
class inventory extends StatelessWidget {
  const inventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(itemList[d].product[ID].names)),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: inventory2(),
      ),
    );
  }
}
class inventory2 extends StatelessWidget {
  const inventory2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: Image.network(itemList[d].product[ID].pictures.path),
            ),
          ),
          Container(
            child: Text(
              "M.R.P : ₹ " + itemList[d].product[ID].price,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Container(
            child: Text(
              "Weight : " + itemList[d].product[ID].weight+" gm",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const checkout()),
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

// class inventory1 extends StatefulWidget {
//   const inventory1({Key? key}) : super(key: key);
//   @override
//   State<inventory1> createState() => _inventory1State();
// }
//
// class _inventory1State extends State<inventory1> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Center(
//             child: Container(
//               height: 300,
//               width: 300,
//               child: Image.network(itemList[d].product[ID].pictures.path),
//             ),
//           ),
//           Container(
//             child: Text(
//               "M.R.P : ₹ " + itemList[d].product[ID].price,
//               style: TextStyle(
//                 fontSize: 25,
//               ),
//             ),
//           ),
//           Container(
//             child: Text(
//               "Weight : " + prod[d].product[ID].weight+" gm",
//               style: TextStyle(
//                 fontSize: 25,
//               ),
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const checkout()),
//                 );
//               },
//               child: (Container(
//                 child: Text("Buy"),
//               )))
//         ],
//       ),
//     );
//
//   }
// }
