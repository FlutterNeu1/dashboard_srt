import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IfBookingdoneRecord extends FirestoreRecord {
  IfBookingdoneRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driver_reference" field.
  DocumentReference? _driverReference;
  DocumentReference? get driverReference => _driverReference;
  bool hasDriverReference() => _driverReference != null;

  // "user_reference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  void _initializeFields() {
    _driverReference = snapshotData['driver_reference'] as DocumentReference?;
    _userReference = snapshotData['user_reference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ifBookingdone');

  static Stream<IfBookingdoneRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IfBookingdoneRecord.fromSnapshot(s));

  static Future<IfBookingdoneRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IfBookingdoneRecord.fromSnapshot(s));

  static IfBookingdoneRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IfBookingdoneRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IfBookingdoneRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IfBookingdoneRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IfBookingdoneRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IfBookingdoneRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIfBookingdoneRecordData({
  DocumentReference? driverReference,
  DocumentReference? userReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driver_reference': driverReference,
      'user_reference': userReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class IfBookingdoneRecordDocumentEquality
    implements Equality<IfBookingdoneRecord> {
  const IfBookingdoneRecordDocumentEquality();

  @override
  bool equals(IfBookingdoneRecord? e1, IfBookingdoneRecord? e2) {
    return e1?.driverReference == e2?.driverReference &&
        e1?.userReference == e2?.userReference;
  }

  @override
  int hash(IfBookingdoneRecord? e) =>
      const ListEquality().hash([e?.driverReference, e?.userReference]);

  @override
  bool isValidKey(Object? o) => o is IfBookingdoneRecord;
}
