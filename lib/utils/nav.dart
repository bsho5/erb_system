import 'package:erb_system/view/category/add_cat.dart';
import 'package:flutter/material.dart';

void categoryNav({
  required BuildContext context,
  required bool isEdit,
  required bool isCatEdit,
  required bool isFromAnotherPage,
  required bool isPriceEdit,
  required bool isDetails,
  required String name,
  required String price,
  required String firstPrice,
  required String minLimit,
  required String type,
  required String measurement,
  required String productionBranch,
}) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => AddCat(
                isDetails: isDetails,
                name: name,
                price: price,
                measurement: measurement,
                type: type,
                productionBranch: productionBranch,
                minLimit: minLimit,
                firstPrice: firstPrice,
                isEdit: isEdit,
                isCatEdit: isCatEdit,
                isFromAnotherPage: isFromAnotherPage,
                isPriceEdit: isPriceEdit,
              )));
}
