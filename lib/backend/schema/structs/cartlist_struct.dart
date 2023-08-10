// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartlistStruct extends FFFirebaseStruct {
  CartlistStruct({
    double? number,
    double? value,
    DocumentReference? qtyref,
    DocumentReference? productref,
    DocumentReference? buisnessuser,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _number = number,
        _value = value,
        _qtyref = qtyref,
        _productref = productref,
        _buisnessuser = buisnessuser,
        super(firestoreUtilData);

  // "Number" field.
  double? _number;
  double get number => _number ?? 0.0;
  set number(double? val) => _number = val;
  void incrementNumber(double amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  // "Value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;
  void incrementValue(double amount) => _value = value + amount;
  bool hasValue() => _value != null;

  // "qtyref" field.
  DocumentReference? _qtyref;
  DocumentReference? get qtyref => _qtyref;
  set qtyref(DocumentReference? val) => _qtyref = val;
  bool hasQtyref() => _qtyref != null;

  // "productref" field.
  DocumentReference? _productref;
  DocumentReference? get productref => _productref;
  set productref(DocumentReference? val) => _productref = val;
  bool hasProductref() => _productref != null;

  // "buisnessuser" field.
  DocumentReference? _buisnessuser;
  DocumentReference? get buisnessuser => _buisnessuser;
  set buisnessuser(DocumentReference? val) => _buisnessuser = val;
  bool hasBuisnessuser() => _buisnessuser != null;

  static CartlistStruct fromMap(Map<String, dynamic> data) => CartlistStruct(
        number: castToType<double>(data['Number']),
        value: castToType<double>(data['Value']),
        qtyref: data['qtyref'] as DocumentReference?,
        productref: data['productref'] as DocumentReference?,
        buisnessuser: data['buisnessuser'] as DocumentReference?,
      );

  static CartlistStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartlistStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Number': _number,
        'Value': _value,
        'qtyref': _qtyref,
        'productref': _productref,
        'buisnessuser': _buisnessuser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Number': serializeParam(
          _number,
          ParamType.double,
        ),
        'Value': serializeParam(
          _value,
          ParamType.double,
        ),
        'qtyref': serializeParam(
          _qtyref,
          ParamType.DocumentReference,
        ),
        'productref': serializeParam(
          _productref,
          ParamType.DocumentReference,
        ),
        'buisnessuser': serializeParam(
          _buisnessuser,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CartlistStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartlistStruct(
        number: deserializeParam(
          data['Number'],
          ParamType.double,
          false,
        ),
        value: deserializeParam(
          data['Value'],
          ParamType.double,
          false,
        ),
        qtyref: deserializeParam(
          data['qtyref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Quantity'],
        ),
        productref: deserializeParam(
          data['productref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        buisnessuser: deserializeParam(
          data['buisnessuser'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
      );

  @override
  String toString() => 'CartlistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartlistStruct &&
        number == other.number &&
        value == other.value &&
        qtyref == other.qtyref &&
        productref == other.productref &&
        buisnessuser == other.buisnessuser;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([number, value, qtyref, productref, buisnessuser]);
}

CartlistStruct createCartlistStruct({
  double? number,
  double? value,
  DocumentReference? qtyref,
  DocumentReference? productref,
  DocumentReference? buisnessuser,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartlistStruct(
      number: number,
      value: value,
      qtyref: qtyref,
      productref: productref,
      buisnessuser: buisnessuser,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartlistStruct? updateCartlistStruct(
  CartlistStruct? cartlist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartlist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartlistStructData(
  Map<String, dynamic> firestoreData,
  CartlistStruct? cartlist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartlist == null) {
    return;
  }
  if (cartlist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartlist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartlistData = getCartlistFirestoreData(cartlist, forFieldValue);
  final nestedData = cartlistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartlist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartlistFirestoreData(
  CartlistStruct? cartlist, [
  bool forFieldValue = false,
]) {
  if (cartlist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartlist.toMap());

  // Add any Firestore field values
  cartlist.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartlistListFirestoreData(
  List<CartlistStruct>? cartlists,
) =>
    cartlists?.map((e) => getCartlistFirestoreData(e, true)).toList() ?? [];
