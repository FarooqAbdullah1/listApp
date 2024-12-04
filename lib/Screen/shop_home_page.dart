import 'package:flutter/material.dart';
import '../Model/model.dart';

class ShopHomePage extends StatelessWidget {
  final String viewType; // Determines which view to display: ListView, GridView, or ScrollView

  const ShopHomePage({Key? key, required this.viewType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$viewType View"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: viewType == "list"
              ? _buildListView()
              : viewType == "grid"
              ? _buildGridView()
              : _buildScrollView(),
        ),
      ),
    );
  }

  // ListView Widget
  Widget _buildListView() {
    final items = foodShopItems(); // Example data
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.asset(item.imageUrl, fit: BoxFit.cover, width: 50, height: 50),
            title: Text(item.title),
            subtitle: Text("\$${item.price}"),
          ),
        );
      },
    );
  }

  // GridView Widget
  Widget _buildGridView() {
    final items = foodShopItems(); // Example data
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("\$${item.price}"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ScrollView Widget
  Widget _buildScrollView() {
    final items = foodShopItems(); // Example data
    return SingleChildScrollView(
      child: Column(
        children: items.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  item.imageUrl,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text("\$${item.price}"),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
