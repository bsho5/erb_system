import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:erb_system/view/purchases/add_purchase_bill.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../home/components/botton.dart';

class Purchases extends StatefulWidget {
  const Purchases({Key? key}) : super(key: key);

  @override
  State<Purchases> createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  DateTime orderDate = DateTime.now();

  List dataTable = [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            )),
        const Text('اضافه صنف')
      ],
    )
  ];

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "١/١٢.٢٠٢٢",
      "8": "شراء",
      "9": "022",
      "10": "100",
      "11": "كيلو",
      "12": "٣٠",
      "13": "٣٠",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "١/١٢.٢٠٢٢",
      "8": "شراء",
      "9": "022",
      "10": "100",
      "11": "كيلو",
      "12": "٣٠",
      "13": "٣٠",
    },
  ];

  List<String> columnData = [
    "تاريخ الاستلام",
    "تاريخ الطلب",
    "نوع الدفع",
    "المدفوع",
    "اسم المورد",
    "اجمالي الفاتوره",
    "سعر الوحده",
    "الوحده",
    "الكميه",
    "الصنف",
    "الحركه",
    "المرجع",
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: orderDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate) {
      setState(() {
        orderDate = pickedDate;
      });
    }
  }

  int ordersNumber = 25;
  List<String> dbDataId = [];
  List<String> dataId = [];
  double total = 0;
  Map<String, Map<String, dynamic>> result = {};
  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('actions')
        .get()
        .then((value) => value.docs.forEach((element) {
              setState(() {
                result[element.id] = element.data();
                if (element.data()['name'] == 'Purchase') {
                  dbDataId.add(element.id);
                  dataId.add(element.id);
                }

                // total = total + int.parse(element.data()['amount']);
              });
            }));
  }

  void performSearch(String query) {
    setState(() {
      dataId = searchByWord(
        query,
        result,
      );
      // total = dataId.fold(
      //     0,
      //     (previousValue, element) =>
      //         previousValue + int.parse(result[element]?['amount']));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<Controller>(context);
    return SafeArea(
        child: Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          DefaultContainer(title: 'فواتير المشتريات'),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Column(
                              //   children: [
                              //     Text(
                              //       'التاريخ',
                              //       style: getSemiBoldStyle(
                              //           color: ColorManager.black),
                              //     ),
                              //     const SizedBox(
                              //       height: 10,
                              //     ),
                              //     SizedBox(
                              //       width: getProportionateScreenWidth(40),
                              //       height: 60,
                              //       child: ElevatedButton(
                              //         onPressed: () => _selectDate(context),
                              //         style: ButtonStyle(
                              //             backgroundColor:
                              //                 MaterialStateProperty.all(
                              //                     Colors.white)),
                              //         child: Text(
                              //           "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                              //           style: TextStyle(
                              //             color: ColorManager.black,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   width: getProportionateScreenWidth(20),
                              // ),
                              // Container(
                              //   width: getProportionateScreenWidth(50),
                              //   height: getProportionateScreenHeight(90),
                              //   padding: const EdgeInsets.only(top: 35),
                              //   child: dropDown(
                              //     const ['تم الطلب', 'تم الاستلام'],
                              //     selectTalab: chose,
                              //     onchanged: () => (val) {
                              //       setState(() {
                              //         chose = val;
                              //       });
                              //     },
                              //     label: 'حاله الشراء',
                              //     foColor: Colors.white,
                              //     bgColor: ColorManager.primary,
                              //     dpColor: ColorManager.primary,
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: getProportionateScreenWidth(20),
                              // ),
                              Column(
                                children: [
                                  Text(
                                    'اسم المورد',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller1,
                                      hint: '',
                                      label: '',
                                      onChanged: (v) {
                                        setState(() {
                                          print(v);
                                          if (v.isNotEmpty) {
                                            performSearch(v);
                                          } else {
                                            dataId = dbDataId;
                                          }
                                        });
                                      },
                                      onTab: () {},
                                      validate: () {},
                                      onSave: () {},
                                      passFun: () {},
                                      perFix: Icon(Icons.search),
                                      color: Colors.white70,
                                      obscureText: false,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 90,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 71),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                      dataId.take(ordersNumber).length,
                                      (index) => Column(
                                            children: [
                                              SizedBox(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          70),
                                                  child: dropDown(
                                                    const [
                                                      'تفاصيل',
                                                      'تاكيد استلام',
                                                      'تاكيد مرتجع',
                                                    ],
                                                    selectTalab:
                                                        index == selectedIndex
                                                            ? chose1
                                                            : chose2,
                                                    onchanged: () => (val) {
                                                      if (val ==
                                                          'تاكيد استلام') {
                                                        QR.to(
                                                            '/confirm_purchase');
                                                      } else if (val ==
                                                          'تاكيد مرتجع') {
                                                        QR.to(
                                                            '/confirm_back_purchase');
                                                      } else if (val ==
                                                          'تفاصيل') {
                                                                Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>  AddPurchaseBill(
                                                          status: '',
                                                          isEdit: true,
                                                          date: DateFormat('yyyy-MM-dd')
                                                    .format(((result[dataId[index]]
                                                                              ?[
                                                                'recevingDate'])
                                                            as Timestamp)
                                                        .toDate())
                                                    .toString(),
                                                          supName: result[dataId[index]]
                                                                              ?['suppliername']
                                                  .toString(),
                                                          remainingBalance: '',
                                                          paid: result[dataId[index]]
                                                                              ?['podownpayment']
                                                  .toString(),
                                                          shipping: result[dataId[index]]
                                                                              ?['poshippingfees']
                                                  .toString(),
                                                          treasury: result[dataId[index]]
                                                                              ?['treasury'],
                                                          image: result[dataId[index]]
                                                                              ?['image'],
                                                          id: result[dataId[index]]
                                                                              ?['actionreference'],
                                                        )
                                                      
                                                                    ));

                                                      
                                                      }
                                                      setState(() {
                                                        selectedIndex = index;
                                                        chose1 = val;
                                                      });
                                                    },
                                                    label: 'خيارات',
                                                    foColor: Colors.white,
                                                    bgColor:
                                                        ColorManager.primary,
                                                    dpColor:
                                                        ColorManager.primary,
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          )),
                                ),
                              ),
                              DefaultTable(
                                columnData: columnData,
                                size: getProportionateScreenWidth(0.8),
                                color: ColorManager.second,
                                rows: dataId
                                    .map((data) => DataRow(cells: [
                                          DataCell(
                                            Text(
                                                DateFormat('yyyy-MM-dd')
                                                    .format(((result[data]?[
                                                                'recevingDate'])
                                                            as Timestamp)
                                                        .toDate())
                                                    .toString(),
                                                style: style),
                                          ),
                                          DataCell(Text(
                                              DateFormat('yyyy-MM-dd')
                                                  .format(((result[data]
                                                              ?['date'])
                                                          as Timestamp)
                                                      .toDate())
                                                  .toString(),
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['treasury'],
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['podownpayment']
                                                  .toString(),
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['suppliername']
                                                  .toString(),
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['totalmaterialcost']
                                                  .toString(),
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['materialcost']
                                                  .toString(),
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['measurement']
                                                  .toString(),
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['quantity']
                                                  .toString(),
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['details']
                                                  .toString(),
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['actiontype']
                                                  .toString(),
                                              style: style)),
                                          DataCell(Text(
                                              result[data]!['actionreference']
                                                  .toString(),
                                              style: style)),
                                        ]))
                                    .toList(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Botton(
                            color: ColorManager.white,
                            title: 'المزيد',
                            onTap: () {},
                            bgColor: ColorManager.primary,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  DefaultAppBar()
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                  ),
                  child: DropDownList())),
        ],
      ),
    ));
  }
}
