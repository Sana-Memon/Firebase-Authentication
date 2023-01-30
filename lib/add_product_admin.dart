import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddProductForAdmin extends StatefulWidget {
  const AddProductForAdmin({super.key});

  @override
  State<AddProductForAdmin> createState() => _AddProductForAdminState();
}

class _AddProductForAdminState extends State<AddProductForAdmin> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController image = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: name,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            TextFormField(
              controller: price,
              decoration: InputDecoration(labelText: "Product Price"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: image,
              decoration: InputDecoration(labelText: "Image"),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                await AddProducts();
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }

  AddProducts() async {
    CollectionReference ref = FirebaseFirestore.instance.collection("Products");
    await ref.add(
        {"Name": name.text, "Price": price.text, "ImageFilePath": image.text});
  }
}
