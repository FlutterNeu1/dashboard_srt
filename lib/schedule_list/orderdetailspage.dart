import 'dart:html';

import 'package:dashboard_srt/schedule_list/productlist.dart';
import 'package:dashboard_srt/schedule_list/productlistss.dart';
import 'package:dashboard_srt/schedule_list/user_ref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuantityPage extends StatefulWidget {
  final List<dynamic> orders;
  final String documentId;

  QuantityPage({required this.orders, required this.documentId});

  @override
  _QuantityPageState createState() => _QuantityPageState();
}

class _QuantityPageState extends State<QuantityPage> {
  String document = '7mwRZpkp6RSIfSMGKXIg';
  String document2 = 'YPncota308YsDWzEkQLF';

  Future<List<String>> getDocumentIdsFromQuantityCollection(
      DocumentReference productRef) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('Quantity')
        .where('productref', isEqualTo: productRef)
        .get();

    List<String> documentIds = [];

    snapshot.docs.forEach((doc) {
      documentIds.add(doc.id);
    });

    return documentIds;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _fetchProductData() async {
    return FirebaseFirestore.instance
        .collection('products')
        .doc(document)
        .get();
  }

  List<String> extractDocumentIds(List<dynamic> orders) {
    List<String> documentIds = [];
    for (var order in orders) {
      var qtyRef = order['qtyref'] as DocumentReference;
      var documentId = qtyRef.id;
      documentIds.add(documentId);

      print("print :${widget.documentId})");
    }
    return documentIds;
  }

  @override
  Widget build(BuildContext context) {
    print('Received orders in QuantityPage: ${widget.orders}');
    List<String> documentIds = extractDocumentIds(widget.orders);

    return Scaffold(
      appBar: AppBar(
        title: Text('Quantity Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            UserInfo11(),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Name',
                  ),
                  Text(
                    'MRP Price',
                  ),
                  Text(
                    'Quantity',
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ProductList11(
                    documentIds: documentIds,
                  )
                ],
                // children: documentIds.map((documentId) {
                //   return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                //     future: FirebaseFirestore.instance
                //         .collection('Quantity')
                //         .doc(documentId)
                //         .get(),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       }

                //       if (snapshot.hasError) {
                //         return Center(
                //           child: Text('Error: ${snapshot.error}'),
                //         );
                //       }

                //       if (!snapshot.hasData || !snapshot.data!.exists) {
                //         return Center(
                //           child: Text('Document not found.'),
                //         );
                //       }

                //       var qtyData = snapshot.data!.data();

                //       var b2bPrice =
                //           qtyData!['B2BPRICE'] ?? 'Price not available';
                //       var quantity1 =
                //           qtyData!['quantity'] ?? 'Quantity not available';

                //       return Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             children: [
                //               // FutureBuilder<
                //               //     DocumentSnapshot<Map<String, dynamic>>>(
                //               //   future: _fetchProductData(),
                //               //   builder: (context, snapshot) {
                //               //     if (snapshot.connectionState ==
                //               //         ConnectionState.waiting) {
                //               //       return Center(
                //               //         child: CircularProgressIndicator(),
                //               //       );
                //               //     }

                //               //     if (snapshot.hasError) {
                //               //       return Center(
                //               //         child: Text('Error: ${snapshot.error}'),
                //               //       );
                //               //     }

                //               //     if (!snapshot.hasData ||
                //               //         !snapshot.data!.exists) {
                //               //       return Center(
                //               //         child: Text('Product not found.'),
                //               //       );
                //               //     }

                //               //     var productData = snapshot.data!.data();
                //               //     var productName =
                //               //         productData!['productname'] ??
                //               //             'Product Name not available';

                //               //     var mrpPrice = productData['MRPPrice'] ??
                //               //         'MRP Price not available';
                //               //     var b2cPrice = productData['B2CPrice'] ??
                //               //         'B2C Price not available';

                //               //     return Row(
                //               //       crossAxisAlignment:
                //               //           CrossAxisAlignment.start,
                //               //       children: [
                //               //         Container(
                //               //           color: Color.fromARGB(255, 96, 92, 255),
                //               //           child: Row(
                //               //             crossAxisAlignment:
                //               //                 CrossAxisAlignment.start,
                //               //             children: [
                //               //               Container(
                //               //                 height: 100,
                //               //                 width: 800, // Set a fixed width
                //               //                 color: Color.fromARGB(
                //               //                     255, 96, 92, 255),
                //               //                 child: Row(
                //               //                   children: [
                //               //                     ProductList11(), // Assuming ProductList11 returns a reasonable size widget
                //               //                   ],
                //               //                 ),
                //               //               ),
                //               //             ],
                //               //           ),
                //               //         ),
                //               //       ],
                //               //     );
                //               //   },
                //               // ),
                //             ],
                //           ),
                //           ProductList11(),
                //           SizedBox(height: 20),
                //         ],
                //       );
                //     },
                //   );
                // }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
