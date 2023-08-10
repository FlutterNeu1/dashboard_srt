import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionphotoRecord extends FirestoreRecord {
  PromotionphotoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _image = snapshotData['Image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promotionphoto');

  static Stream<PromotionphotoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromotionphotoRecord.fromSnapshot(s));

  static Future<PromotionphotoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromotionphotoRecord.fromSnapshot(s));

  static PromotionphotoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromotionphotoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromotionphotoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromotionphotoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromotionphotoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromotionphotoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromotionphotoRecordData({
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromotionphotoRecordDocumentEquality
    implements Equality<PromotionphotoRecord> {
  const PromotionphotoRecordDocumentEquality();

  @override
  bool equals(PromotionphotoRecord? e1, PromotionphotoRecord? e2) {
    return e1?.image == e2?.image;
  }

  @override
  int hash(PromotionphotoRecord? e) => const ListEquality().hash([e?.image]);

  @override
  bool isValidKey(Object? o) => o is PromotionphotoRecord;
}
