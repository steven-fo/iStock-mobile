import 'package:flutter/material.dart';
import 'package:istock/widgets/left_drawer.dart';
import 'package:istock/models/item.dart';

class DetailItemPage extends StatelessWidget {
  final Item item;

  const DetailItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Item"
        ),
      ),
      drawer: const LeftDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 12,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.fields.name,
              style: const TextStyle(color: Colors.black, fontSize: 28),
            ),
            const SizedBox(height: 10),
            Text(
              "Amount: ${item.fields.amount}",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Type: ${item.fields.type}",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Description: ${item.fields.description}",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "Back",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}