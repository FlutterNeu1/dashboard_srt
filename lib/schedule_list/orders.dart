import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard_srt/schedule_list/orderdetailspage.dart';

import 'delivery partner.dart';

class OrdersScreen extends StatelessWidget {
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

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var orderData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              List<dynamic> cartList = orderData['Cartlist'];
              var orderAddress =
                  orderData['orderaddress'] as Map<String, dynamic>?;

              // Perform null checks before accessing data
              String productRef = orderData['productref'] ??
                  ''; // Default to empty string if null
              String documentId = productRef.split('/').last;
              print("$productRef");
              print(documentId);

              return GestureDetector(
                onTap: () async {
                  String userId;
                  var userIdRef = orderData['Userid'] as DocumentReference?;
                  if (userIdRef != null) {
                    // If Userid is a reference, fetch the document and get the ID
                    DocumentSnapshot userSnapshot = await userIdRef.get();
                    userId = userSnapshot.id;
                  } else {
                    // If Userid is a plain string
                    userId = orderData['Userid'];
                    print("newww: $userId");
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuantityPage(
                        orders: cartList,
                        documentId: documentId,
                        userId: userId,
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
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AssignDeliveryPartnerPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(),
                          child: Text('Assign Partner'),
                        ),
                      ],
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
