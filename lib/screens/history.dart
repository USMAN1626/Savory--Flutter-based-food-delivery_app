import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/bottomNavBar.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  List<Map<String, dynamic>> orderList = [];

  @override
  void initState() {
    super.initState();
    _fetchOrderHistory();
  }

  void _fetchOrderHistory() {
    database.child('orders').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        final map = data as Map<dynamic, dynamic>;
        orderList.clear();
        map.forEach((key, value) {
          orderList.add(Map<String, dynamic>.from(value));
        });
      } else {
        orderList.clear(); // Clear the list if no data is available
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Pop the current route from the stack
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "History",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.black.withOpacity(0.9),
          ),
        ),
      ),
      body: orderList.isEmpty
          ? _buildNoHistory()
          : _buildOrderHistoryList(),
    );
  }

  Widget _buildNoHistory() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("lib/assets/history.png")),
          SizedBox(height: 15),
          Text(
            "No history yet",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 220,
            child: Text(
              "Hit the orange button down below to Create an order",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHistoryList() {
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (context, index) {
        final order = orderList[index];
        return _buildOrderItem(order);
      },
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> order) {
    final items = order['items'] as List<dynamic>? ?? [];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID: ${order['orderId']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items.map((item) {
                  return Text(
                    "${item['name']} - \$${item['price']} x ${item['count']}",
                    style: TextStyle(fontSize: 14),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
