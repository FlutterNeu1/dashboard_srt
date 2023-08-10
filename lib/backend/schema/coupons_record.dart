import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponsRecord extends FirestoreRecord {
  CouponsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "couponnumber" field.
  String? _couponnumber;
  String get couponnumber => _couponnumber ?? '';
  bool hasCouponnumber() => _couponnumber != null;

  // "couponused" field.
  bool? _couponused;
  bool get couponused => _couponused ?? false;
  bool hasCouponused() => _couponused != null;

  // "savings" field.
  double? _savings;
  double get savings => _savings ?? 0.0;
  bool hasSavings() => _savings != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _couponnumber = snapshotData['couponnumber'] as String?;
    _couponused = snapshotData['couponused'] as bool?;
    _savings = castToType<double>(snapshotData['savings']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Coupons');

  static Stream<CouponsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouponsRecord.fromSnapshot(s));

  static Future<CouponsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouponsRecord.fromSnapshot(s));

  static CouponsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CouponsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouponsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouponsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouponsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouponsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouponsRecordData({
  String? description,
  String? couponnumber,
  bool? couponused,
  double? savings,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'couponnumber': couponnumber,
      'couponused': couponused,
      'savings': savings,
    }.withoutNulls,
  );

  return firestoreData;
}

class CouponsRecordDocumentEquality implements Equality<CouponsRecord> {
  const CouponsRecordDocumentEquality();

  @override
  bool equals(CouponsRecord? e1, CouponsRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.couponnumber == e2?.couponnumber &&
        e1?.couponused == e2?.couponused &&
        e1?.savings == e2?.savings;
  }

  @override
  int hash(CouponsRecord? e) => const ListEquality()
      .hash([e?.description, e?.couponnumber, e?.couponused, e?.savings]);

  @override
  bool isValidKey(Object? o) => o is CouponsRecord;
}
