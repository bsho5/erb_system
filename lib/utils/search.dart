import 'package:cloud_firestore/cloud_firestore.dart';

List<String> search(String searchWord, Map<String, Map<String, dynamic>> result,
    Timestamp startDate, Timestamp endDate) {
  List<String> dataId = [];
  result.forEach((key, value) {
    if (value.values.any((v) => v.toString().contains(searchWord)) &&
        (value['date'] as Timestamp).compareTo(startDate) > -1 &&
        (value['date'] as Timestamp).compareTo(endDate) < 1) {
      dataId.add(key);
    }
  });
  return dataId;
}

List<String> searchByWord(
  String searchWord,
  Map<String, Map<String, dynamic>> result,
) {
  List<String> dataId = [];
  result.forEach((key, value) {
    if (value.values.any((v) => v.toString().contains(searchWord))) {
      dataId.add(key);
    }
  });
  return dataId;
}

List<String> filter({
  required String orderType,
  required String clientType,
  required String orderStatus,
  required String orderOrigin,
  required String city,
  required String governorate,
  required String shipping,
  required Map<String, Map<String, dynamic>> result,
}) {
  List<String> dataId = [];
  result.forEach((key, value) {
    if (orderType.isEmpty) orderType = '';
    if (clientType.isEmpty) clientType = '';
    if (orderStatus.isEmpty) orderStatus = '';
    if (orderOrigin.isEmpty) orderOrigin = '';
    if (city.isEmpty) city = '';
    if (governorate.isEmpty) governorate = '';
    if (shipping.isEmpty) shipping = '';

    if (value.values.any((v) => v.toString().contains(orderStatus)) &&
        value.values.any((v) => v.toString().contains(city)) &&
        value.values.any((v) => v.toString().contains(orderType)) &&
        value.values.any((v) => v.toString().contains(clientType)) &&
        value.values.any((v) => v.toString().contains(orderOrigin)) &&
        value.values.any((v) => v.toString().contains(governorate)) &&
        value.values.any((v) => v.toString().contains(shipping))) {
      dataId.add(key);
    }
  });
  return dataId;
}

List<String> categoryFilter({
  required String searchWord,
  required String categoryType,
  required String production,
  required Map<String, Map<String, dynamic>> result,
}) {
  List<String> dataId = [];
  result.forEach((key, value) {
    if (searchWord.isEmpty) searchWord = '';
    if (categoryType.isEmpty) categoryType = '';
    if (production.isEmpty) production = '';

    if (value.values.any((v) => v.toString().contains(searchWord)) &&
        value.values.any((v) => v.toString().contains(categoryType)) &&
        value.values.any((v) => v.toString().contains(production))) {
      dataId.add(key);
    }
  });
  return dataId;
}

Future<bool> compareTreasury(String treasury, int amount) async {
  bool compareTreasury = true;
  Map<String, Map<String, dynamic>> resultAfterRemove = {};
  await FirebaseFirestore.instance
      .collection('treasuryactions')
      .get()
      .then((value) => value.docs.forEach((element) {
            resultAfterRemove[element.id] = element.data();
          }));
  resultAfterRemove.forEach((key, value) {
    if (value.values.any((v) => v.toString().contains(treasury))) {
      if (resultAfterRemove[key]?['balance'] < amount) {
        compareTreasury = false;
      }
    }
  });
  //print(compareTreasury);
  return compareTreasury;
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
