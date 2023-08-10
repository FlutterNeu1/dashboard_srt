import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categoryname" field.
  String? _categoryname;
  String get categoryname => _categoryname ?? '';
  bool hasCategoryname() => _categoryname != null;

  // "categoryphoto" field.
  String? _categoryphoto;
  String get categoryphoto => _categoryphoto ?? '';
  bool hasCategoryphoto() => _categoryphoto != null;

  void _initializeFields() {
    _categoryname = snapshotData['categoryname'] as String?;
    _categoryphoto = snapshotData['categoryphoto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  String? categoryname,
  String? categoryphoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoryname': categoryname,
      'categoryphoto': categoryphoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    return e1?.categoryname == e2?.categoryname &&
        e1?.categoryphoto == e2?.categoryphoto;
  }

  @override
  int hash(CategoryRecord? e) =>
      const ListEquality().hash([e?.categoryname, e?.categoryphoto]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
