import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard_srt/schedule_list/orderdetailspage.dart';

import 'delivery partner.dart';

class OrdersScreen111 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No orders available.'),
            );
          }

          final orders = snapshot.data!.docs.where((doc) =>
              (doc['OrderState'] ?? 0) ==
              1); // Filter orders where OrderState is 1

          if (orders.isEmpty) {
            return Center(
              child: Text('No orders with OrderState 1.'),
            );
          }

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              var orderData =
                  orders.elementAt(index).data() as Map<String, dynamic>;
              List<dynamic> cartList = orderData['Cartlist'];
              var orderAddress =
                  orderData['orderaddress'] as Map<String, dynamic>?;

              // Perform null checks before accessing data
              String productRef = orderData['productref'] ?? '';
              String documentId = productRef.split('/').last;
              print("vdsvsv: $documentId");
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuantityPage(
                        orders: cartList,
                        documentId: documentId,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        orderData['userImage'] ?? 'placeholder_image_url',
                      ),
                    ),
                    title: Text(
                      orderAddress?['Name'] ?? 'No data found',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 6),
                        Text(
                          orderAddress?['HouseAddress'] ?? 'No data found',
                        ),
                        Text(
                          'Order: ${orderData['DateTimeOfOrder']?.toDate() ?? 'No date found'}', // Display the DateTimeOfOrder
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
