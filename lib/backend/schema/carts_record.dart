import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartsRecord extends FirestoreRecord {
  CartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CartStatus" field.
  int? _cartStatus;
  int get cartStatus => _cartStatus ?? 0;
  bool hasCartStatus() => _cartStatus != null;

  // "quantityref" field.
  DocumentReference? _quantityref;
  DocumentReference? get quantityref => _quantityref;
  bool hasQuantityref() => _quantityref != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "count1" field.
  String? _count1;
  String get count1 => _count1 ?? '';
  bool hasCount1() => _count1 != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  void _initializeFields() {
    _cartStatus = castToType<int>(snapshotData['CartStatus']);
    _quantityref = snapshotData['quantityref'] as DocumentReference?;
    _count = castToType<int>(snapshotData['count']);
    _count1 = snapshotData['count1'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Carts');

  static Stream<CartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartsRecord.fromSnapshot(s));

  static Future<CartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartsRecord.fromSnapshot(s));

  static CartsRecord fromSnapshot(DocumentSnapshot snapshot) => CartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartsRecordData({
  int? cartStatus,
  DocumentReference? quantityref,
  int? count,
  String? count1,
  DocumentReference? userref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CartStatus': cartStatus,
      'quantityref': quantityref,
      'count': count,
      'count1': count1,
      'userref': userref,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartsRecordDocumentEquality implements Equality<CartsRecord> {
  const CartsRecordDocumentEquality();

  @override
  bool equals(CartsRecord? e1, CartsRecord? e2) {
    return e1?.cartStatus == e2?.cartStatus &&
        e1?.quantityref == e2?.quantityref &&
        e1?.count == e2?.count &&
        e1?.count1 == e2?.count1 &&
        e1?.userref == e2?.userref;
  }

  @override
  int hash(CartsRecord? e) => const ListEquality()
      .hash([e?.cartStatus, e?.quantityref, e?.count, e?.count1, e?.userref]);

  @override
  bool isValidKey(Object? o) => o is CartsRecord;
}
