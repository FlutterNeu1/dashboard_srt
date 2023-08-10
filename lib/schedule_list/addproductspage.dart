import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddProductsPage extends StatefulWidget {
  @override
  _AddProductsPageState createState() => _AddProductsPageState();
}

class _AddProductsPageState extends State<AddProductsPage> {
  TextEditingController _b2bPriceController = TextEditingController();
  TextEditingController _b2cPriceController = TextEditingController();
  TextEditingController _mrpPriceController = TextEditingController();
  TextEditingController _offerPercentageController = TextEditingController();
  TextEditingController _longDescriptionController = TextEditingController();
  TextEditingController _productNameController = TextEditingController();
  bool _isVeg = false;
  File? _selectedImage;
  CircleAvatar? _uploadedImageAvatar;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<String?> _uploadImage() async {
    if (_selectedImage == null) return null;

    try {
      final storage = FirebaseStorage.instance;
      final ref = storage.ref().child('product_images/${DateTime.now()}.jpg');
      final uploadTask = ref.putFile(_selectedImage!);
      final snapshot = await uploadTask;
      final imageUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _uploadedImageAvatar = CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(imageUrl),
        );
      });

      return imageUrl;
    } catch (error) {
      print('Error uploading image: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Products'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _uploadedImageAvatar != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(_selectedImage!),
                  )
                : SizedBox.shrink(),
            SizedBox(height: 20),
            SizedBox(height: 20),
            _buildTextField(_b2bPriceController, 'B2B Price'),
            SizedBox(height: 10),
            _buildTextField(_b2cPriceController, 'B2C Price'),
            SizedBox(height: 10),
            _buildTextField(_mrpPriceController, 'MRP Price'),
            SizedBox(height: 10),
            _buildTextField(_offerPercentageController, 'Offer Percentage'),
            SizedBox(height: 10),
            _buildTextField(_longDescriptionController, 'Long Description'),
            SizedBox(height: 10),
            _buildTextField(_productNameController, 'Product Name'),
            SizedBox(height: 10),
            CheckboxListTile(
              title: Text('Veg'),
              value: _isVeg,
              onChanged: (value) {
                setState(() {
                  _isVeg = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 96, 92, 255),
              ),
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String? productImage = await _uploadImage();

                Map<String, dynamic> productData = {
                  'B2BPrice': _b2bPriceController.text,
                  'B2CPrice': _b2cPriceController.text,
                  'MRPPrice': _mrpPriceController.text,
                  'OfferPercentage': _offerPercentageController.text,
                  'LongDescription': _longDescriptionController.text,
                  'ProductName': _productNameController.text,
                  'IsVeg': _isVeg,
                  'ProductImage': productImage,
                };

                try {
                  await FirebaseFirestore.instance
                      .collection('products')
                      .add(productData);
                  print('Product added to Firestore');
                } catch (error) {
                  print('Error adding product to Firestore: $error');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 96, 92, 255),
              ),
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 96, 92, 255)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _b2bPriceController.dispose();
    _b2cPriceController.dispose();
    _mrpPriceController.dispose();
    _offerPercentageController.dispose();
    _longDescriptionController.dispose();
    _productNameController.dispose();
    super.dispose();
  }
}
