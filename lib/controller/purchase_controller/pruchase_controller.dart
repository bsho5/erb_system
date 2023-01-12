import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../view/home/homepage.dart';

class PurchaseController with ChangeNotifier {
  double? beforeBalance;
  double? afterBalance;

  Future addBill(String id, double balance, String supID, double residual,
      double total) async {
    print("1");
    await FirebaseFirestore.instance
        .collection('treasuryactions')
        .doc(id)
        .get()
        .then((value1) async {
      print("2");
      await FirebaseFirestore.instance
          .collection('treasuryactions')
          .doc(id)
          .set(
        {'balance': value1['balance'] - balance},
        SetOptions(merge: true),
      );
    }).then((value2) async {
      print("3");
      await FirebaseFirestore.instance
          .collection('suppliers')
          .doc(supID)
          .get()
          .then((value3) async {
        print("4");
        await FirebaseFirestore.instance.collection('suppliers').doc(supID).set(
          {'balance': value3['balance'] + residual},
          SetOptions(merge: true),
        );
      });
    }).then((value) async {
      print("5");
      await FirebaseFirestore.instance
          .collection('warehouses')
          .doc('مخزن مواد خام')
          .get()
          .then((val) async {
        beforeBalance = val['balance'];
        afterBalance = val['balance'] + total;
        await FirebaseFirestore.instance
            .collection('warehouses')
            .doc('مخزن مواد خام')
            .set(
          {'balance': val['balance'] + total},
          SetOptions(merge: true),
        );
      });
    });
  }

  addPurchasing({
    required String date,
    required String state,
    required String trasury,
    required String supName,
    required double podownpayment,
    required int totalQuantity,
    required double poshippingfees,
    required double remainbalance,
    required double total,
    required List purData,
    required String measurement,
  }) async {

    await FirebaseFirestore.instance.collection('addpurchasing').add({
      'date': date,
      'suppliername': supName,
      'postatus': state,
      'total': total,
      'trasury': trasury,
      'podownpayment': podownpayment,
      'poshippingfees': poshippingfees,
      'recevingDate': '',
      'remainbalance': remainbalance,
      'poname': '',
      'image': '',
    }).then((value) async {
      purData.forEach((element) async {
        print("quantity ${element["quantity"]}");
        DocumentSnapshot rr = await FirebaseFirestore.instance.collection('warehouses')
            .doc('مخزن مواد خام').collection("Materials").doc(element["name"]).get();

        await FirebaseFirestore.instance
            .collection('warehouses')
            .doc('مخزن مواد خام')
            .collection("Reports")
            .add(
          {
            'quantity': int.parse(element["quantity"]),
            'afterQuantity': rr["quantity"]+int.parse(element["quantity"]),
            'beforeQuantity': rr["quantity"],
            'date': DateTime.now().toIso8601String(),
            'totalcost': element['price'],
            'name':element['name'],
            'type': "Purchase",
            'unitcost': element['price'],
          },
        );

        await FirebaseFirestore.instance
            .collection('addpurchasing')
            .doc(value.id)
            .collection('rawmaterials')
            .add({
          'unit': element['measurement'],
          'price': element['price'],
          'requirequantity': element['quantity'],
          'name': element['name'],
          'image': element['image'],
          'totalprice': element['total'].toString(),
        });
        print("1");
        await FirebaseFirestore.instance
            .collection('warehouses')
            .doc('مخزن مواد خام')
            .collection("Materials")
            .doc(element["name"])
            .set(
          {'quantity': FieldValue.increment(int.parse(element["quantity"]))},
          SetOptions(merge: true),
        );
      });
      
      await FirebaseFirestore.instance.collection('actions').add({
        'treasury': trasury,
        'podownpayment':podownpayment,
        'totalmaterialcost': total + poshippingfees,
        'totalcost': total,
        'suppliername': supName,
        'quantity': totalQuantity,
        'poimage': '',
        'notes': '',
        'name': '',
        'movecost': 0,
        'measurement': measurement,
        'materialcost': 0,
        'details': 'خامات',
        'date': date,
        'recevingDate': '',
        'currentvalue': 0,
        'afterquantity': afterBalance,
        'beforequantity': beforeBalance,
        'actiontype': 'شراء',
        'actiontaker': 'admin',
        'actionreference': value.id,
      });
      QRoute(path: '/', builder: () => const HomePage());

    });
  }
}
