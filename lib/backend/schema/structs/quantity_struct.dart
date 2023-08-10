// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuantityStruct extends FFFirebaseStruct {
  QuantityStruct({
    String? quantity,
    double? priceBeforeDiscount,
    int? priceAfterDiscount,
    DocumentReference? productRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quantity = quantity,
        _priceBeforeDiscount = priceBeforeDiscount,
        _priceAfterDiscount = priceAfterDiscount,
        _productRef = productRef,
        super(firestoreUtilData);

  // "quantity" field.
  String? _quantity;
  String get quantity => _quantity ?? '';
  set quantity(String? val) => _quantity = val;
  bool hasQuantity() => _quantity != null;

  // "PriceBeforeDiscount" field.
  double? _priceBeforeDiscount;
  double get priceBeforeDiscount => _priceBeforeDiscount ?? 0.0;
  set priceBeforeDiscount(double? val) => _priceBeforeDiscount = val;
  void incrementPriceBeforeDiscount(double amount) =>
      _priceBeforeDiscount = priceBeforeDiscount + amount;
  bool hasPriceBeforeDiscount() => _priceBeforeDiscount != null;

  // "PriceAfterDiscount" field.
  int? _priceAfterDiscount;
  int get priceAfterDiscount => _priceAfterDiscount ?? 0;
  set priceAfterDiscount(int? val) => _priceAfterDiscount = val;
  void incrementPriceAfterDiscount(int amount) =>
      _priceAfterDiscount = priceAfterDiscount + amount;
  bool hasPriceAfterDiscount() => _priceAfterDiscount != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;
  bool hasProductRef() => _productRef != null;

  static QuantityStruct fromMap(Map<String, dynamic> data) => QuantityStruct(
        quantity: data['quantity'] as String?,
        priceBeforeDiscount: castToType<double>(data['PriceBeforeDiscount']),
        priceAfterDiscount: castToType<int>(data['PriceAfterDiscount']),
        productRef: data['productRef'] as DocumentReference?,
      );

  static QuantityStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? QuantityStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'quantity': _quantity,
        'PriceBeforeDiscount': _priceBeforeDiscount,
        'PriceAfterDiscount': _priceAfterDiscount,
        'productRef': _productRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quantity': serializeParam(
          _quantity,
          ParamType.String,
        ),
        'PriceBeforeDiscount': serializeParam(
          _priceBeforeDiscount,
          ParamType.double,
        ),
        'PriceAfterDiscount': serializeParam(
          _priceAfterDiscount,
          ParamType.int,
        ),
        'productRef': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static QuantityStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuantityStruct(
        quantity: deserializeParam(
          data['quantity'],
          ParamType.String,
          false,
        ),
        priceBeforeDiscount: deserializeParam(
          data['PriceBeforeDiscount'],
          ParamType.double,
          false,
        ),
        priceAfterDiscount: deserializeParam(
          data['PriceAfterDiscount'],
          ParamType.int,
          false,
        ),
        productRef: deserializeParam(
          data['productRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
      );

  @override
  String toString() => 'QuantityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuantityStruct &&
        quantity == other.quantity &&
        priceBeforeDiscount == other.priceBeforeDiscount &&
        priceAfterDiscount == other.priceAfterDiscount &&
        productRef == other.productRef;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([quantity, priceBeforeDiscount, priceAfterDiscount, productRef]);
}

QuantityStruct createQuantityStruct({
  String? quantity,
  double? priceBeforeDiscount,
  int? priceAfterDiscount,
  DocumentReference? productRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuantityStruct(
      quantity: quantity,
      priceBeforeDiscount: priceBeforeDiscount,
      priceAfterDiscount: priceAfterDiscount,
      productRef: productRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuantityStruct? updateQuantityStruct(
  QuantityStruct? quantityStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    quantityStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuantityStructData(
  Map<String, dynamic> firestoreData,
  QuantityStruct? quantityStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (quantityStruct == null) {
    return;
  }
  if (quantityStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && quantityStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final quantityStructData =
      getQuantityFirestoreData(quantityStruct, forFieldValue);
  final nestedData =
      quantityStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = quantityStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuantityFirestoreData(
  QuantityStruct? quantityStruct, [
  bool forFieldValue = false,
]) {
  if (quantityStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(quantityStruct.toMap());

  // Add any Firestore field values
  quantityStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuantityListFirestoreData(
  List<QuantityStruct>? quantityStructs,
) =>
    quantityStructs?.map((e) => getQuantityFirestoreData(e, true)).toList() ??
    [];
