import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuantityRecord extends FirestoreRecord {
  QuantityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productref" field.
  DocumentReference? _productref;
  DocumentReference? get productref => _productref;
  bool hasProductref() => _productref != null;

  // "quantity" field.
  String? _quantity;
  String get quantity => _quantity ?? '';
  bool hasQuantity() => _quantity != null;

  // "B2BPRICE" field.
  double? _b2bprice;
  double get b2bprice => _b2bprice ?? 0.0;
  bool hasB2bprice() => _b2bprice != null;

  // "B2CPRICE" field.
  double? _b2cprice;
  double get b2cprice => _b2cprice ?? 0.0;
  bool hasB2cprice() => _b2cprice != null;

  // "MRPPrice" field.
  double? _mRPPrice;
  double get mRPPrice => _mRPPrice ?? 0.0;
  bool hasMRPPrice() => _mRPPrice != null;

  void _initializeFields() {
    _productref = snapshotData['productref'] as DocumentReference?;
    _quantity = snapshotData['quantity'] as String?;
    _b2bprice = castToType<double>(snapshotData['B2BPRICE']);
    _b2cprice = castToType<double>(snapshotData['B2CPRICE']);
    _mRPPrice = castToType<double>(snapshotData['MRPPrice']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Quantity');

  static Stream<QuantityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuantityRecord.fromSnapshot(s));

  static Future<QuantityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuantityRecord.fromSnapshot(s));

  static QuantityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuantityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuantityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuantityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuantityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuantityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuantityRecordData({
  DocumentReference? productref,
  String? quantity,
  double? b2bprice,
  double? b2cprice,
  double? mRPPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productref': productref,
      'quantity': quantity,
      'B2BPRICE': b2bprice,
      'B2CPRICE': b2cprice,
      'MRPPrice': mRPPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuantityRecordDocumentEquality implements Equality<QuantityRecord> {
  const QuantityRecordDocumentEquality();

  @override
  bool equals(QuantityRecord? e1, QuantityRecord? e2) {
    return e1?.productref == e2?.productref &&
        e1?.quantity == e2?.quantity &&
        e1?.b2bprice == e2?.b2bprice &&
        e1?.b2cprice == e2?.b2cprice &&
        e1?.mRPPrice == e2?.mRPPrice;
  }

  @override
  int hash(QuantityRecord? e) => const ListEquality().hash(
      [e?.productref, e?.quantity, e?.b2bprice, e?.b2cprice, e?.mRPPrice]);

  @override
  bool isValidKey(Object? o) => o is QuantityRecord;
}
