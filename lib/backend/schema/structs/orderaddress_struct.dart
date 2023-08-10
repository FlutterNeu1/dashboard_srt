// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderaddressStruct extends FFFirebaseStruct {
  OrderaddressStruct({
    String? houseAddress,
    LatLng? location,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _houseAddress = houseAddress,
        _location = location,
        _name = name,
        super(firestoreUtilData);

  // "HouseAddress" field.
  String? _houseAddress;
  String get houseAddress => _houseAddress ?? '';
  set houseAddress(String? val) => _houseAddress = val;
  bool hasHouseAddress() => _houseAddress != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;
  bool hasLocation() => _location != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static OrderaddressStruct fromMap(Map<String, dynamic> data) =>
      OrderaddressStruct(
        houseAddress: data['HouseAddress'] as String?,
        location: data['Location'] as LatLng?,
        name: data['Name'] as String?,
      );

  static OrderaddressStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OrderaddressStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'HouseAddress': _houseAddress,
        'Location': _location,
        'Name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'HouseAddress': serializeParam(
          _houseAddress,
          ParamType.String,
        ),
        'Location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrderaddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderaddressStruct(
        houseAddress: deserializeParam(
          data['HouseAddress'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.LatLng,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrderaddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderaddressStruct &&
        houseAddress == other.houseAddress &&
        location == other.location &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([houseAddress, location, name]);
}

OrderaddressStruct createOrderaddressStruct({
  String? houseAddress,
  LatLng? location,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderaddressStruct(
      houseAddress: houseAddress,
      location: location,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderaddressStruct? updateOrderaddressStruct(
  OrderaddressStruct? orderaddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderaddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderaddressStructData(
  Map<String, dynamic> firestoreData,
  OrderaddressStruct? orderaddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderaddress == null) {
    return;
  }
  if (orderaddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderaddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderaddressData =
      getOrderaddressFirestoreData(orderaddress, forFieldValue);
  final nestedData =
      orderaddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderaddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderaddressFirestoreData(
  OrderaddressStruct? orderaddress, [
  bool forFieldValue = false,
]) {
  if (orderaddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderaddress.toMap());

  // Add any Firestore field values
  orderaddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderaddressListFirestoreData(
  List<OrderaddressStruct>? orderaddresss,
) =>
    orderaddresss?.map((e) => getOrderaddressFirestoreData(e, true)).toList() ??
    [];
