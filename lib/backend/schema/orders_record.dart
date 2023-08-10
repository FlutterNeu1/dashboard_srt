import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ordernumber" field.
  int? _ordernumber;
  int get ordernumber => _ordernumber ?? 0;
  bool hasOrdernumber() => _ordernumber != null;

  // "OrderState" field.
  int? _orderState;
  int get orderState => _orderState ?? 0;
  bool hasOrderState() => _orderState != null;

  // "DateTimeofOrder" field.
  DateTime? _dateTimeofOrder;
  DateTime? get dateTimeofOrder => _dateTimeofOrder;
  bool hasDateTimeofOrder() => _dateTimeofOrder != null;

  // "DateTimeOfDelivery" field.
  DateTime? _dateTimeOfDelivery;
  DateTime? get dateTimeOfDelivery => _dateTimeOfDelivery;
  bool hasDateTimeOfDelivery() => _dateTimeOfDelivery != null;

  // "timeslot" field.
  String? _timeslot;
  String get timeslot => _timeslot ?? '';
  bool hasTimeslot() => _timeslot != null;

  // "orderaddress" field.
  OrderaddressStruct? _orderaddress;
  OrderaddressStruct get orderaddress => _orderaddress ?? OrderaddressStruct();
  bool hasOrderaddress() => _orderaddress != null;

  // "orderab2baddress" field.
  String? _orderab2baddress;
  String get orderab2baddress => _orderab2baddress ?? '';
  bool hasOrderab2baddress() => _orderab2baddress != null;

  // "Cartlist" field.
  List<CartlistStruct>? _cartlist;
  List<CartlistStruct> get cartlist => _cartlist ?? const [];
  bool hasCartlist() => _cartlist != null;

  // "ordervalue" field.
  String? _ordervalue;
  String get ordervalue => _ordervalue ?? '';
  bool hasOrdervalue() => _ordervalue != null;

  // "leaveorderatdoor" field.
  bool? _leaveorderatdoor;
  bool get leaveorderatdoor => _leaveorderatdoor ?? false;
  bool hasLeaveorderatdoor() => _leaveorderatdoor != null;

  // "orderdate" field.
  DateTime? _orderdate;
  DateTime? get orderdate => _orderdate;
  bool hasOrderdate() => _orderdate != null;

  // "Userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "Driveruserref" field.
  DocumentReference? _driveruserref;
  DocumentReference? get driveruserref => _driveruserref;
  bool hasDriveruserref() => _driveruserref != null;

  void _initializeFields() {
    _ordernumber = castToType<int>(snapshotData['ordernumber']);
    _orderState = castToType<int>(snapshotData['OrderState']);
    _dateTimeofOrder = snapshotData['DateTimeofOrder'] as DateTime?;
    _dateTimeOfDelivery = snapshotData['DateTimeOfDelivery'] as DateTime?;
    _timeslot = snapshotData['timeslot'] as String?;
    _orderaddress =
        OrderaddressStruct.maybeFromMap(snapshotData['orderaddress']);
    _orderab2baddress = snapshotData['orderab2baddress'] as String?;
    _cartlist = getStructList(
      snapshotData['Cartlist'],
      CartlistStruct.fromMap,
    );
    _ordervalue = snapshotData['ordervalue'] as String?;
    _leaveorderatdoor = snapshotData['leaveorderatdoor'] as bool?;
    _orderdate = snapshotData['orderdate'] as DateTime?;
    _userid = snapshotData['Userid'] as DocumentReference?;
    _driveruserref = snapshotData['Driveruserref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  int? ordernumber,
  int? orderState,
  DateTime? dateTimeofOrder,
  DateTime? dateTimeOfDelivery,
  String? timeslot,
  OrderaddressStruct? orderaddress,
  String? orderab2baddress,
  String? ordervalue,
  bool? leaveorderatdoor,
  DateTime? orderdate,
  DocumentReference? userid,
  DocumentReference? driveruserref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ordernumber': ordernumber,
      'OrderState': orderState,
      'DateTimeofOrder': dateTimeofOrder,
      'DateTimeOfDelivery': dateTimeOfDelivery,
      'timeslot': timeslot,
      'orderaddress': OrderaddressStruct().toMap(),
      'orderab2baddress': orderab2baddress,
      'ordervalue': ordervalue,
      'leaveorderatdoor': leaveorderatdoor,
      'orderdate': orderdate,
      'Userid': userid,
      'Driveruserref': driveruserref,
    }.withoutNulls,
  );

  // Handle nested data for "orderaddress" field.
  addOrderaddressStructData(firestoreData, orderaddress, 'orderaddress');

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ordernumber == e2?.ordernumber &&
        e1?.orderState == e2?.orderState &&
        e1?.dateTimeofOrder == e2?.dateTimeofOrder &&
        e1?.dateTimeOfDelivery == e2?.dateTimeOfDelivery &&
        e1?.timeslot == e2?.timeslot &&
        e1?.orderaddress == e2?.orderaddress &&
        e1?.orderab2baddress == e2?.orderab2baddress &&
        listEquality.equals(e1?.cartlist, e2?.cartlist) &&
        e1?.ordervalue == e2?.ordervalue &&
        e1?.leaveorderatdoor == e2?.leaveorderatdoor &&
        e1?.orderdate == e2?.orderdate &&
        e1?.userid == e2?.userid &&
        e1?.driveruserref == e2?.driveruserref;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.ordernumber,
        e?.orderState,
        e?.dateTimeofOrder,
        e?.dateTimeOfDelivery,
        e?.timeslot,
        e?.orderaddress,
        e?.orderab2baddress,
        e?.cartlist,
        e?.ordervalue,
        e?.leaveorderatdoor,
        e?.orderdate,
        e?.userid,
        e?.driveruserref
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
