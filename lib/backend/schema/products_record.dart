import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categoryrefernece" field.
  DocumentReference? _categoryrefernece;
  DocumentReference? get categoryrefernece => _categoryrefernece;
  bool hasCategoryrefernece() => _categoryrefernece != null;

  // "productname" field.
  String? _productname;
  String get productname => _productname ?? '';
  bool hasProductname() => _productname != null;

  // "quantityref" field.
  DocumentReference? _quantityref;
  DocumentReference? get quantityref => _quantityref;
  bool hasQuantityref() => _quantityref != null;

  // "ProductImage" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "OfferPercentage" field.
  int? _offerPercentage;
  int get offerPercentage => _offerPercentage ?? 0;
  bool hasOfferPercentage() => _offerPercentage != null;

  // "MRPPrice" field.
  double? _mRPPrice;
  double get mRPPrice => _mRPPrice ?? 0.0;
  bool hasMRPPrice() => _mRPPrice != null;

  // "B2CPrice" field.
  double? _b2CPrice;
  double get b2CPrice => _b2CPrice ?? 0.0;
  bool hasB2CPrice() => _b2CPrice != null;

  // "B2BPricce" field.
  double? _b2BPricce;
  double get b2BPricce => _b2BPricce ?? 0.0;
  bool hasB2BPricce() => _b2BPricce != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "londDescription" field.
  String? _londDescription;
  String get londDescription => _londDescription ?? '';
  bool hasLondDescription() => _londDescription != null;

  // "veg" field.
  bool? _veg;
  bool get veg => _veg ?? false;
  bool hasVeg() => _veg != null;

  void _initializeFields() {
    _categoryrefernece =
        snapshotData['categoryrefernece'] as DocumentReference?;
    _productname = snapshotData['productname'] as String?;
    _quantityref = snapshotData['quantityref'] as DocumentReference?;
    _productImage = snapshotData['ProductImage'] as String?;
    _offerPercentage = castToType<int>(snapshotData['OfferPercentage']);
    _mRPPrice = castToType<double>(snapshotData['MRPPrice']);
    _b2CPrice = castToType<double>(snapshotData['B2CPrice']);
    _b2BPricce = castToType<double>(snapshotData['B2BPricce']);
    _shortDescription = snapshotData['shortDescription'] as String?;
    _londDescription = snapshotData['londDescription'] as String?;
    _veg = snapshotData['veg'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  DocumentReference? categoryrefernece,
  String? productname,
  DocumentReference? quantityref,
  String? productImage,
  int? offerPercentage,
  double? mRPPrice,
  double? b2CPrice,
  double? b2BPricce,
  String? shortDescription,
  String? londDescription,
  bool? veg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoryrefernece': categoryrefernece,
      'productname': productname,
      'quantityref': quantityref,
      'ProductImage': productImage,
      'OfferPercentage': offerPercentage,
      'MRPPrice': mRPPrice,
      'B2CPrice': b2CPrice,
      'B2BPricce': b2BPricce,
      'shortDescription': shortDescription,
      'londDescription': londDescription,
      'veg': veg,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.categoryrefernece == e2?.categoryrefernece &&
        e1?.productname == e2?.productname &&
        e1?.quantityref == e2?.quantityref &&
        e1?.productImage == e2?.productImage &&
        e1?.offerPercentage == e2?.offerPercentage &&
        e1?.mRPPrice == e2?.mRPPrice &&
        e1?.b2CPrice == e2?.b2CPrice &&
        e1?.b2BPricce == e2?.b2BPricce &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.londDescription == e2?.londDescription &&
        e1?.veg == e2?.veg;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.categoryrefernece,
        e?.productname,
        e?.quantityref,
        e?.productImage,
        e?.offerPercentage,
        e?.mRPPrice,
        e?.b2CPrice,
        e?.b2BPricce,
        e?.shortDescription,
        e?.londDescription,
        e?.veg
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
