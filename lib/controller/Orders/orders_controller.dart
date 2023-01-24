import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOrderController with ChangeNotifier {
  String? id;
  String? customername;
  String? address;
  String? notes;
  String? city;
  int? downpayment;
  String? date;
  String? government;
  int? netamount;
  String? orderstatus;
  String? ordersource;
  int? totalinvoiceamount;
  String? phonenumber;
  String? phonenumber1;
  int? shippingfees;
  String? shippingtyp;
  String? phoneNumber;
  String? phoneNumber1;
  int? totalinvoice;
  String? routenumber;
  List<dynamic>? orders;

  void addOrder({
    required String city,
    required String customername,
    required String customertype,
    required DateTime date,
    required int downpayment,
    required String government,
    required int netamount,
    required String notes,
    required int totalinvoiceamount,
    required String ordersource,
    required String ordertype,
    required String treasury,
    required String phonenumber,
    required String phonenumber1,
    required int shippingfees,
    required String shippingtype,
    required List items,
    required int discount,
    required String doneby,
    required String address,
  }) async {
    var res = await FirebaseFirestore.instance.collection('supplychain').add({
      'address': address,
      'addbilloflading': "",
      "cancellationnote": "",
      "doneby": doneby,
      'city': city,
      "courrier": "",
      "customername": customername,
      "customertype": customertype,
      "date": date,
      "downpayment": downpayment,
      "government": government,
      "netamount": netamount,
      'notes': notes,
      'orderstatus': "طلب جديد",
      'ordersource': ordersource,
      'ordertype': ordertype,
      'paymentstatus': "",
      'postpone': 0,
      'rejectionnote': "",
      'routenumber': "",
      'statusdate': "",
      'totalinvoiceamount': totalinvoiceamount,
      'treasury': treasury,
      'uploadimage': "",
      'phonenumber': phonenumber,
      'phonenumber1': phonenumber1,
      'shippingfees': shippingfees,
      'shippingtype': shippingtype,
      'discount': discount
    });

    for (int i = 0; i < items.length; i++) {
      FirebaseFirestore.instance
          .collection("supplychain")
          .doc(res.id)
          .collection("products")
          .add({
        "image": items[i]["image"],
        "price": items[i]["price"],
        "productname": items[i]["name"],
        "quantity": items[i]["quantity"],
        "totalprice": items[i]["price"] * items[i]["quantity"],
        "unit": items[i]["measurement"],
      });
    }
    if (downpayment > 0) {
      DocumentSnapshot rr = await FirebaseFirestore.instance
          .collection('treasuryactions')
          .doc(treasury)
          .get();
      FirebaseFirestore.instance
          .collection('treasuryactions')
          .doc(treasury)
          .update({
        'balance': rr["balance"] + downpayment,
      });
    } else {
      //print("NO PAYMENT");
    }
  }

  getMaterialsWarehouse() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore
        .collection("warehouses")
        .doc("مخزن منتج تام")
        .collection("Materials")
        .get();
    return qn.docs;
  }

  getSupplyChainOrders() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("supplychain").get();
    return qn.docs;
  }

  notifyListeners();
}
