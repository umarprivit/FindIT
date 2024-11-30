import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy list of orders (replace this with actual data)
    List<Order> orders = [
      Order(
        orderId: '123456',
        customerName: 'John Doe',
        productName: 'Product A',
        quantity: 2,
        totalPrice: 100.0,
      ),
      Order(
        orderId: '789012',
        customerName: 'Jane Smith',
        productName: 'Product B',
        quantity: 1,
        totalPrice: 50.0,
      ),
      // Add more orders as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildOrderCard(orders[index]);
          },
        ),
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${order.orderId}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Customer: ${order.customerName}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 4.0),
            Text(
              'Product: ${order.productName}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 4.0),
            Text(
              'Quantity: ${order.quantity}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 4.0),
            Text(
              'Total Price: \$${order.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
  final String orderId;
  final String customerName;
  final String productName;
  final int quantity;
  final double totalPrice;

  Order({
    required this.orderId,
    required this.customerName,
    required this.productName,
    required this.quantity,
    required this.totalPrice,
  });
}

void main() {
  runApp(MaterialApp(
    home: OrdersScreen(),
  ));
}
