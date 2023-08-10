import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssignDeliveryPartnerPage extends StatefulWidget {
  const AssignDeliveryPartnerPage({super.key});

  @override
  State<AssignDeliveryPartnerPage> createState() =>
      _AssignDeliveryPartnerPageState();
}

class _AssignDeliveryPartnerPageState extends State<AssignDeliveryPartnerPage> {
  String? selectedDriverId;

  void assignDriver() {
    if (selectedDriverId != null) {
      FirebaseFirestore.instance
          .collection('driver')
          .doc(selectedDriverId)
          .update({
        'is_driver_assigned': true,
      }).then((_) {
        // Driver assigned successfully, you can show a success message or perform other actions.
        print('Driver assigned successfully.');

        FirebaseFirestore.instance
            .collection('orders')
            .doc('0slncyfvEBNMlBBGy0ge')
            .update({
          'OrderState': 1,
        }).then((_) {
          // OrderState updated successfully, you can show a success message or perform other actions.
          print('OrderState updated to 1 for the order.');
        }).catchError((error) {
          // Handle errors if any.
          print('Error updating OrderState: $error');
        });
      }).catchError((error) {
        // Handle errors if any.
        print('Error assigning driver: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Delivery Partner'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('driver').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var driverData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              var driverImage = driverData['driver_image'] ?? 'No Image';
              var driverName = driverData['driver_name'] ?? 'No Name';
              var location = driverData['location'] ?? 'No Location';
              var isDriverAssigned = driverData['is_driver_assigned'] ?? false;

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(driverImage),
                ),
                title: Text(driverName),
                subtitle: Text(location),
                trailing: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedDriverId = snapshot.data!.docs[index].id;
                    });
                    assignDriver();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isDriverAssigned ? Colors.grey : Colors.blue,
                  ),
                  child: Text(isDriverAssigned ? 'Assigned' : 'Assign'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
