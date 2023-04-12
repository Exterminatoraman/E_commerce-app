import 'dart:convert';
import 'dart:typed_data';
import 'package:e_commerce_site/itembuilder.dart';
import 'package:e_commerce_site/list%20class.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class items{
  File pictures;
  String names;
  String price;
  String weight;
  items(this.pictures,this.names,this.price,this.weight);
  Map<String, dynamic> toJson() => {'pictures':pictures,'names': names, 'price': price,'weight':weight};
  factory items.fromJson(Map<String, dynamic> json) {
    return items(
      json['pictures'] as File,
      json['names'] as String,
      json['price'] as String,
      json['weight'] as String,
    );
  }
  @override
  String toString() {
    return 'Item{pic:$pictures, name: $names, price: $price, weight: $weight}';
  }
}
class itemlist1{
  String name;
  List<items> product=[];
  File pic;
  itemlist1(this.name,this.pic);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'product': product.map((c) => c.toJson()).toList()};
    }
  factory itemlist1.fromJson(Map<String, dynamic> json) {
    final String name = json['name'];
    final File pic=json['pic'];
    final List product = (json['product'] as List<dynamic>)
        .map((e) => items.fromJson(e as Map<String, dynamic>))
        .toList();
    List<items> itemList=product.map((item) => items.fromJson(item)).toList();
    return itemlist1(name, pic)..product = itemList;
  }
  @override
  String toString() {
    return 'Item{name: $name, pic:$pic,product: $product,  }';
  }
  }
Future<void> uploadList(List<itemlist1> itemList) async {
  final storage = FirebaseStorage.instance;

  for (final item in itemList) {
    // Create a reference to the folder for this item
    final itemFolder = storage.ref().child('items/${item.name}');

    // Upload the picture for this item
    final picName = '${item.name}.jpg';
    final picRef = itemFolder.child(picName);
    final picUploadTask = picRef.putFile(item.pic);
    final nameRef = itemFolder.child('${item.name}.txt');
    final foldernameupload = nameRef.putString(item.name);
    await foldernameupload.whenComplete(() {});
    await picUploadTask.whenComplete(() {});

    // Upload the info for each product in this item's product list
    for (final product in item.product) {
      // Create a reference to the folder for this product
      final productFolder = itemFolder.child(product.names);

      // Upload the picture for this product
      final productPicName = '${product.names}.jpg';
      final productPicRef = productFolder.child(productPicName);
      final productPicUploadTask = productPicRef.putFile(product.pictures);
      await productPicUploadTask.whenComplete(() {});
      final nameref = productFolder.child('${product.names}.txt');
      final nameuploadTask = nameref.putString(product.names);
      await nameuploadTask.whenComplete(() {});
      // Upload the price and weight info for this product
      final priceRef = productFolder.child('price.txt');
      final priceUploadTask = priceRef.putString(product.price);
      await priceUploadTask.whenComplete(() {});
      final weightRef = productFolder.child('weight.txt');
      final weightUploadTask = weightRef.putString(product.weight);
      await weightUploadTask.whenComplete(() {});
    }
  }
}

// Future<List<itemlist1>> fetchItemList() async {
//   final storage = FirebaseStorage.instance;
//   final itemsRef = storage.ref().child('items/');
//   final itemsList = await itemsRef.listAll();
//   final subfolders = itemsList.prefixes; // filter out subfolders
//   final itemList = <itemlist1>[];
//   for (final folder in subfolders) {
//
//     final subfolderItems = await folder.listAll();
//     print('Fetched ${subfolderItems.items.length} itemees ');
//     for (final prodetail in subfolderItems.items ){
//       final itemData = await prodetail.getMetadata();
//       final itemName = itemData.name;
//       print('Fetching data for item: $itemName');
//
//     }
// //create a new for loop to access the different subfolders
//     final folderlist = subfolderItems.prefixes; // filter out subfolders
//
//     for(final prodfolder in folderlist){
//       final prodsubfolder=await prodfolder.listAll();
//
//     for (final item in prodsubfolder.items) {
//       print('Fetched ${prodsubfolder.items.length} subitemees ');
//
//       final itemData2 = await item.getMetadata();
//       final itemName2 = itemData2.name;
//       print('Fetching data for item2: $itemName2');
//       // Create a reference to the folder for this item
//       final itemFolder = storage.ref().child('items/$itemName2');
//       // Get the download URL for the item picture
//       final picRef = itemFolder.child('picture.jpg');
//       final picUrl = await picRef.getDownloadURL();
//
//       // Get the list of items for this itemlist
//       final itemListData = <items>[];
//       final itemListRef = itemFolder.child('items');
//       final itemListSnapshot = await itemListRef.listAll();
//
//       for (final item in itemListSnapshot.items) {
//         final itemData = await item.getMetadata();
//         final itemName = itemData.name;
//
//         // Create a reference to the folder for this item
//         final itemFolder = itemListRef.child(itemName);
//         // Get the download URL for the item picture
//         final picRef = itemFolder.child('picture.jpg');
//         final picUrl = await picRef.getDownloadURL();
//         // Get the price and weight info for this item
//         final priceRef = itemFolder.child('price.txt');
//         final priceData = await priceRef.getData();
//         final price = utf8.decode(priceData!);
//
//         final weightRef = itemFolder.child('weight.txt');
//         final weightData = await weightRef.getData();
//         final weight = utf8.decode(weightData!);
//
//         final itemObject = items(File(picUrl), itemName, price, weight);
//         itemListData.add(itemObject);
//       }
//
//       final itemObject = itemlist1(itemName2, File(picUrl));
//       itemObject.product = itemListData;
//       itemList.add(itemObject);
//     }
//     print('Fetched ${itemList.length} items');
//   }}
//   print(itemList);
//   return itemList;
// }
//


Future<List<itemlist1>> fetchItemList() async {
  final storage = FirebaseStorage.instance;
  final itemsRef = storage.ref().child('items/');
  final itemsList = await itemsRef.listAll();
  final subfolders = itemsList.prefixes;
  final itemList = <itemlist1>[];
 for (final folder in subfolders){
   final subfolderitems = await folder.listAll();
  print('Items found: ${subfolderitems.items.length}');
   final itemData = await subfolderitems.items[1].getData();
   final itemName = utf8.decode(itemData!);

    print('Fetching data for item: $itemName');
    // Create a reference to the folder for this item
    final itemFolder = storage.ref().child('items/$itemName');

    // Get the download URL for the item picture
    final picRef = itemFolder.child('$itemName.jpg');
    final picUrl = await picRef.getDownloadURL();
    print('Fetching data for item: $picUrl');

   // Get the list of items for this itemlist
    final itemListData = <items>[];
   final prodfolder = subfolderitems.prefixes;
   for (final itemfolder in prodfolder) {
     final itemfolderitems = await itemfolder.listAll();
     final proddata = await itemfolderitems.items[2].getData();
     final prodname = utf8.decode(proddata!);
     print('Fetching data for item: $prodname');

     final itemListRef = storage.ref().child('items/$itemName/$prodname');
    final itemListSnapshot = await itemListRef.listAll();
     print('Items founder: ${itemListSnapshot.items.length}');




      // Create a reference to the folder for this item
      // Get the download URL for the item picture
      final picRef = itemListRef.child('$prodname.jpg');
      final picUrl = await picRef.getDownloadURL();

      // Get the price and weight info for this item
      final priceRef = itemListRef.child('price.txt');
      final priceData = await priceRef.getData();
      final price = utf8.decode(priceData!);
      print('Fetching price for item: $price');


      final weightRef = itemListRef.child('weight.txt');
      final weightData = await weightRef.getData();
      final weight = utf8.decode(weightData!);
     print('Fetching price for item: $weight');

      final itemObject = items(File(picUrl), prodname, price, weight);
      itemListData.add(itemObject);
    }


    final itemObject = itemlist1(itemName, File(picUrl));
    itemObject.product = itemListData;
    itemList.add(itemObject);

  }
  return itemList;
}
// class FirestoreItem {
//   String name;
//   String pictureUrl;
//   List<FirestoreProduct> productList;
//
//   FirestoreItem({
//     required this.name,
//     required this.pictureUrl,
//     required this.productList,
//   });
// }
//
// class FirestoreProduct {
//   String name;
//   String pictureUrl;
//   String price;
//   String weight;
//
//   FirestoreProduct({
//     required this.name,
//     required this.pictureUrl,
//     required this.price,
//     required this.weight,
//   });
// }
// Future<List<itemlist1>> fetchItemList() async {
//   final itemsCollection = FirebaseFirestore.instance.collection('items');
//   final itemsSnapshot = await itemsCollection.get();
//
//   final itemList = <itemlist1>[];
//
//   for (final itemDoc in itemsSnapshot.docs) {
//     final itemName = itemDoc.id;
//     final itemData = itemDoc.data();
//     final picUrl = itemData['picUrl'];
//
//     final productList = <items>[];
//     final productListData = itemData['product'];
//
//     for (final productData in productListData) {
//       final productName = productData['name'];
//       final productPicUrl = productData['picUrl'];
//       final price = productData['price'];
//       final weight = productData['weight'];
//
//       final productItem = items(
//         File(productPicUrl),
//         productName,
//         price,
//         weight,
//       );
//       productList.add(productItem);
//     }
//
//     final itemObject = itemlist1(itemName, File(picUrl));
//     itemObject.product = productList;
//     itemList.add(itemObject);
//   }
//   print(itemList);
//
//   return itemList;
// }
//
