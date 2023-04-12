import 'package:e_commerce_site/homescreeen.dart';
import 'package:e_commerce_site/itemlist.dart';
import 'list class.dart';
import 'main.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import 'catergorybuilder.dart';
List<itemlist1> item=[];
File b=File("");
String p="";
String na="";
String w="";
class itemadder1 extends StatefulWidget {
  const itemadder1({Key? key}) : super(key: key);

  @override
  State<itemadder1> createState() => _itemadderState1();
}

class _itemadderState1 extends State<itemadder1> {
  TextEditingController name=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController weight=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Center(child: Text("ADD ITEM       ")),
        backgroundColor: Colors.deepPurpleAccent,
        ),
       body: Container(
         height: 600,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("  Enter the Product name- ",
                style:TextStyle(
                  fontSize: 20,
                )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0,20),
              child: SizedBox(
                width: 400,
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: name,
                  onTap: (){
                    na=name.text;
                  }
                ),
              ),
            ),
            Text("  Enter the Product price- ",
                style:TextStyle(
                  fontSize: 20,
                )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0,20),
              child: SizedBox(
                width: 400,
                child: TextField(
                    keyboardType: TextInputType.text,
                    controller: price,
                    onTap: (){p=price.text;}

                ),
              ),
            ),
            Text("  Enter the Product weight- ",
                style:TextStyle(
                  fontSize: 20,
                )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0,20),
              child: SizedBox(
                width: 400,
                child: TextField(
                    keyboardType: TextInputType.text,
                    controller: weight,
                    onTap: (){w=weight.text;}
                ),
              ),
            ),
            Text("  Select the product image : ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0,0),
              child: SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: ()
                  {
                    b=getFromGallery(name.text, price.text, weight.text);
                  },
                  child: Text("PICK FROM GALLERY"),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 08, 0,0),
                  child: ElevatedButton(
                      child: (
                          Text("Done")
                      ),
                      onPressed:() async {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const itemlist()),
                        );
                        await uploadList(prod);
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 08, 0,0),
                  child: ElevatedButton(
                      child: (
                          Text("home")
                      ),
                      onPressed:() {
                        setState((){
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const h2()),
                          );
                        });

                      }
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
getFromGallery(na,p,w) async {
  final ImagePicker imgpicker = ImagePicker();
  var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
  if(pickedFile != null){
    final File imageFile = File(pickedFile.path);
    prod[d].product.add(items(imageFile, na, p,w));

    return imageFile;
  }else{
    print("No image is selected.");
  }
}


