import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxRecord extends FirestoreRecord {
  TaxRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Deliveryfee" field.
  double? _deliveryfee;
  double get deliveryfee => _deliveryfee ?? 0.0;
  bool hasDeliveryfee() => _deliveryfee != null;

  // "handlingfee" field.
  double? _handlingfee;
  double get handlingfee => _handlingfee ?? 0.0;
  bool hasHandlingfee() => _handlingfee != null;

  // "Ordernumber" field.
  int? _ordernumber;
  int get ordernumber => _ordernumber ?? 0;
  bool hasOrdernumber() => _ordernumber != null;

  void _initializeFields() {
    _deliveryfee = castToType<double>(snapshotData['Deliveryfee']);
    _handlingfee = castToType<double>(snapshotData['handlingfee']);
    _ordernumber = castToType<int>(snapshotData['Ordernumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tax');

  static Stream<TaxRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaxRecord.fromSnapshot(s));

  static Future<TaxRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaxRecord.fromSnapshot(s));

  static TaxRecord fromSnapshot(DocumentSnapshot snapshot) => TaxRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaxRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaxRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaxRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaxRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaxRecordData({
  double? deliveryfee,
  double? handlingfee,
  int? ordernumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Deliveryfee': deliveryfee,
      'handlingfee': handlingfee,
      'Ordernumber': ordernumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaxRecordDocumentEquality implements Equality<TaxRecord> {
  const TaxRecordDocumentEquality();

  @override
  bool equals(TaxRecord? e1, TaxRecord? e2) {
    return e1?.deliveryfee == e2?.deliveryfee &&
        e1?.handlingfee == e2?.handlingfee &&
        e1?.ordernumber == e2?.ordernumber;
  }

  @override
  int hash(TaxRecord? e) => const ListEquality()
      .hash([e?.deliveryfee, e?.handlingfee, e?.ordernumber]);

  @override
  bool isValidKey(Object? o) => o is TaxRecord;
}
