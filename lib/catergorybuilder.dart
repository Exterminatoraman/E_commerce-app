import 'dart:convert';

import 'package:e_commerce_site/homescreeen.dart';
import 'package:e_commerce_site/itembuilder.dart';
import 'package:e_commerce_site/itemlist.dart';
import 'list class.dart';
import 'main.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce_site/shoe_1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
List<File> pictures2=[];
List<String> names2 =[];
List<items> things=[];
List<itemlist1> prod=[];

String nam="";
File pi=File('a.text');

adder1(String name) async{
  names2.add(name);
}

class itemadder2 extends StatefulWidget {
  const itemadder2({Key? key}) : super(key: key);

  @override
  State<itemadder2> createState() => _itemadderState2();
}

class _itemadderState2 extends State<itemadder2> {
  TextEditingController name2=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        width: 400,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 08, 0,20),
                  child: SizedBox(

                    width: 300,
                    child: TextField(
                        keyboardType: TextInputType.text,
                        controller: name2,
                        onTap: (){nam=name2.text;},
                        decoration: InputDecoration(
                            labelText: "Enter the product name",
                            labelStyle: TextStyle(
                              fontSize: 30,
                              color: Colors.black
                            )
                        ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text("Select the product image : ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0,0),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: ()
                      {
                        pi=getFromGallery(name2.text);
                      },
                      child: Text("PICK FROM GALLERY"),
                    ),
                  ),
                ),

              ],

            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 08, 0,0),
              child: ElevatedButton(
                  child: (
                      Text("Done")
                  ),
                  onPressed:() {
                    setState(() async {
                      await uploadList(prod);
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const h2()),
                      );

                      names2.add(name2.text);
                      things.add(name2.text as items);
                      prod.add(itemlist1(name2.text,pi));
                    });
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
}
getFromGallery(String nam) async {

  final ImagePicker imgpicker = ImagePicker();
  var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
  if(pickedFile != null){
    final File imageFile = File(pickedFile.path);
    pictures2.add(imageFile);
    prod.add(itemlist1(nam, imageFile));
    return imageFile;
  }else{
    print("No image is selected.");
  }


}