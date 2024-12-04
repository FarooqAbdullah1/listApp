import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'weather_screen.dart'; // Import the WeatherScreen
import 'shop_home_page.dart';
class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildProductHeaderImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildProductEntry(),
                  const Divider(),
                  _buildProductDetails(),
                  const Divider(),
                  _buildProductTags(),
                  const Divider(),
                  _buildProductFooterImages(context),
                  const SizedBox(height: 20),
                  _buildWeatherButton(context), // Add weather button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductHeaderImage() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          'images/mango.png', // Replace with your image asset
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200.0,
        ),
      ),
    );
  }

  Widget _buildProductEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          'Our Featured Products',
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
        Divider(),
        Text(
          'Explore a wide range of products from fruits to berries.',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildProductDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Icon(Icons.info, color: Colors.blue),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'High Quality',
              style: TextStyle(color: Colors.blueAccent),
            ),
            Text(
              'Sourced fresh from farms worldwide.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductTags() {
    return Wrap(
      spacing: 8.0,
      children: List.generate(6, (int index) {
        return Chip(
          label: Text(
            'Product ${index + 1}',
            style: const TextStyle(fontSize: 10.0),
          ),
          avatar: const Icon(Icons.star, color: Colors.orange),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  Widget _buildProductFooterImages(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('images/bananas.png'), // Replace with product image
              radius: 40.0,
            ),
            const SizedBox(height: 4.0),
            const Text('ListView'),
            ElevatedButton(
              onPressed: () => _navigateToShopPage(context, 'ListView'), // Pass tab type for ListView
              child: const Text('Go to ListView'),
            ),
          ],
        ),
        Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('images/blueberry.png'), // Replace with product image
              radius: 40.0,
            ),
            const SizedBox(height: 4.0),
            const Text('GridView'),
            ElevatedButton(
              onPressed: () => _navigateToShopPage(context, 'GridView'), // Pass tab type for GridView
              child: const Text('Go to GridView'),
            ),
          ],
        ),
        Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('images/strawberry.png'), // Replace with product image
              radius: 40.0,
            ),
            const SizedBox(height: 4.0),
            const Text('ScrollView'),
            ElevatedButton(
              onPressed: () => _navigateToShopPage(context, 'ScrollView'), // Pass tab type for ScrollView
              child: const Text('Go to ScrollView'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WeatherScreen()), // Navigate to WeatherScreen
          );
        },
        icon: const Icon(Icons.cloud),
        label: const Text('Check Weather'),
      ),
    );
  }

  void _navigateToShopPage(BuildContext context, String viewType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopHomePage(viewType: viewType),
      ),
    );
  }
}
