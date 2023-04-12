import 'package:flutter/material.dart';

class JewelryAppUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jewelry Shopping"),
      ),
      body: Container(
        child: Column(
          children: [
            // Jewelry Category Selector
            Container(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // Category Items
                  Container(
                    width: 100,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text("Rings"),
                    ),
                  ),
                  Container(
                    width: 100,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text("Earrings"),
                    ),
                  ),
                  Container(
                    width: 100,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text("Necklaces"),
                    ),
                  ),
                  // Add more categories
                ],
              ),
            ),
            // Jewelry Product Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  // Product Items
                  Container(
                    child: Image.asset('images/gold_necklace.jpg',
                      fit: BoxFit.cover,
                    ),
                    ),

                  Container(
                    child: Image.network(
                      "https://example.com/jewelry2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Image.network(
                      "https://example.com/jewelry3.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Add more products
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
