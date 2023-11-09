import 'package:flutter/material.dart';
import 'package:istock/widgets/left_drawer.dart';
import 'package:istock/screens/istock_form.dart';

class ViewItemPage extends StatelessWidget {
  const ViewItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'View Item Page',
          ),
        ),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            subtitle: Text(
              'Amount: ${items[index].amount}, Type: ${items[index].type}\nDescription: ${items[index].description}'
            ),
          );
        },
      )
    );
  }
}