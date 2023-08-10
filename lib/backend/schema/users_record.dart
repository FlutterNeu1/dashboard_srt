import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "B2B" field.
  bool? _b2b;
  bool get b2b => _b2b ?? false;
  bool hasB2b() => _b2b != null;

  // "Sales" field.
  bool? _sales;
  bool get sales => _sales ?? false;
  bool hasSales() => _sales != null;

  // "Buisnessname" field.
  String? _buisnessname;
  String get buisnessname => _buisnessname ?? '';
  bool hasBuisnessname() => _buisnessname != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "aadharcardnumber" field.
  String? _aadharcardnumber;
  String get aadharcardnumber => _aadharcardnumber ?? '';
  bool hasAadharcardnumber() => _aadharcardnumber != null;

  // "pancardnumber" field.
  String? _pancardnumber;
  String get pancardnumber => _pancardnumber ?? '';
  bool hasPancardnumber() => _pancardnumber != null;

  // "getnumber" field.
  String? _getnumber;
  String get getnumber => _getnumber ?? '';
  bool hasGetnumber() => _getnumber != null;

  // "Addharphoto" field.
  String? _addharphoto;
  String get addharphoto => _addharphoto ?? '';
  bool hasAddharphoto() => _addharphoto != null;

  // "panphoto" field.
  String? _panphoto;
  String get panphoto => _panphoto ?? '';
  bool hasPanphoto() => _panphoto != null;

  // "gstphoto" field.
  String? _gstphoto;
  String get gstphoto => _gstphoto ?? '';
  bool hasGstphoto() => _gstphoto != null;

  // "Addresses" field.
  OrderaddressStruct? _addresses;
  OrderaddressStruct get addresses => _addresses ?? OrderaddressStruct();
  bool hasAddresses() => _addresses != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _b2b = snapshotData['B2B'] as bool?;
    _sales = snapshotData['Sales'] as bool?;
    _buisnessname = snapshotData['Buisnessname'] as String?;
    _password = snapshotData['password'] as String?;
    _aadharcardnumber = snapshotData['aadharcardnumber'] as String?;
    _pancardnumber = snapshotData['pancardnumber'] as String?;
    _getnumber = snapshotData['getnumber'] as String?;
    _addharphoto = snapshotData['Addharphoto'] as String?;
    _panphoto = snapshotData['panphoto'] as String?;
    _gstphoto = snapshotData['gstphoto'] as String?;
    _addresses = OrderaddressStruct.maybeFromMap(snapshotData['Addresses']);
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  LatLng? location,
  bool? b2b,
  bool? sales,
  String? buisnessname,
  String? password,
  String? aadharcardnumber,
  String? pancardnumber,
  String? getnumber,
  String? addharphoto,
  String? panphoto,
  String? gstphoto,
  OrderaddressStruct? addresses,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'location': location,
      'B2B': b2b,
      'Sales': sales,
      'Buisnessname': buisnessname,
      'password': password,
      'aadharcardnumber': aadharcardnumber,
      'pancardnumber': pancardnumber,
      'getnumber': getnumber,
      'Addharphoto': addharphoto,
      'panphoto': panphoto,
      'gstphoto': gstphoto,
      'Addresses': OrderaddressStruct().toMap(),
      'address': address,
    }.withoutNulls,
  );

  // Handle nested data for "Addresses" field.
  addOrderaddressStructData(firestoreData, addresses, 'Addresses');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.location == e2?.location &&
        e1?.b2b == e2?.b2b &&
        e1?.sales == e2?.sales &&
        e1?.buisnessname == e2?.buisnessname &&
        e1?.password == e2?.password &&
        e1?.aadharcardnumber == e2?.aadharcardnumber &&
        e1?.pancardnumber == e2?.pancardnumber &&
        e1?.getnumber == e2?.getnumber &&
        e1?.addharphoto == e2?.addharphoto &&
        e1?.panphoto == e2?.panphoto &&
        e1?.gstphoto == e2?.gstphoto &&
        e1?.addresses == e2?.addresses &&
        e1?.address == e2?.address;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.location,
        e?.b2b,
        e?.sales,
        e?.buisnessname,
        e?.password,
        e?.aadharcardnumber,
        e?.pancardnumber,
        e?.getnumber,
        e?.addharphoto,
        e?.panphoto,
        e?.gstphoto,
        e?.addresses,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
