import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoicesRecord extends FirestoreRecord {
  InvoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Invoicenumber" field.
  int? _invoicenumber;
  int get invoicenumber => _invoicenumber ?? 0;
  bool hasInvoicenumber() => _invoicenumber != null;

  void _initializeFields() {
    _invoicenumber = castToType<int>(snapshotData['Invoicenumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Invoices');

  static Stream<InvoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoicesRecord.fromSnapshot(s));

  static Future<InvoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoicesRecord.fromSnapshot(s));

  static InvoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoicesRecordData({
  int? invoicenumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Invoicenumber': invoicenumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoicesRecordDocumentEquality implements Equality<InvoicesRecord> {
  const InvoicesRecordDocumentEquality();

  @override
  bool equals(InvoicesRecord? e1, InvoicesRecord? e2) {
    return e1?.invoicenumber == e2?.invoicenumber;
  }

  @override
  int hash(InvoicesRecord? e) => const ListEquality().hash([e?.invoicenumber]);

  @override
  bool isValidKey(Object? o) => o is InvoicesRecord;
}
