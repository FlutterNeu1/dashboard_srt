import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductList11 extends StatefulWidget {
  final List<String> documentIds;

  ProductList11({required this.documentIds});

  @override
  State<ProductList11> createState() => _ProductList11State();
}

class _ProductList11State extends State<ProductList11> {
  Set<String> displayedDocumentIds = {};
  @override
  Widget build(BuildContext context) {
    print('Received documentIds in ProductList11: ${widget.documentIds}');

    final specificDocumentIds = widget.documentIds;

    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Quantity').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final products = snapshot.data!.docs.where((doc) {
            final docId = doc.id;
            return specificDocumentIds.contains(docId) &&
                !displayedDocumentIds.contains(docId);
          }).toList();

          return Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final doc = products[index]; // Use index instead of [0]
                final docId = doc.id;
                displayedDocumentIds.add(docId);

                final productRef = doc['productref'];
                print("new  $docId");
                print('Products length: ${products.length}');
                print('Specific Document IDs: $specificDocumentIds');
                print('Displayed Document IDs: $displayedDocumentIds');

                return StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .doc(productRef.id)
                      .snapshots(),
                  builder: (context, productSnapshot) {
                    if (productSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Text('Loading product...');
                    }
                    if (productSnapshot.hasError) {
                      return Text(
                          'Error loading product: ${productSnapshot.error}');
                    }

                    final productName = productSnapshot.data!['productname'];
                    final mrpPrice =
                        (doc['MRPPrice'] ?? 0).toString(); // Convert to string
                    final quantity =
                        (doc['quantity'] ?? 0).toString(); // Convert to string
                    print(productRef.id);

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productName.length > 10
                                  ? '${productName.substring(0, 10)}.'
                                  : productName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'MRP: $mrpPrice',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green),
                            ),
                            Text(
                              'Quantity: $quantity',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
