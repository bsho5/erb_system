import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SupMoneyDetails extends StatefulWidget {
  const SupMoneyDetails({Key? key}) : super(key: key);

  @override
  State<SupMoneyDetails> createState() => _SupMoneyDetailsState();
}

class _SupMoneyDetailsState extends State<SupMoneyDetails> {
  String? chose1;
  String? chose2;
  int? selectedIndex;

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "موظف احمد",
      "9": "٣٠",
      "10": "٣٠",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "موظف احمد",
      "9": "٣٠",
      "10": "٣٠",
    },
  ];

  List<String> columnData = [
    "رصيد بعد",
    "المدفوع",
    "رصيد قبل",
    "اجمالي الفاتوره",
    "سعر الوحده",
    "الوحده",
    "الكميه",
    "الصنف",
    "المرجع",
    "الحركه",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  DefaultContainer(title: 'تفاصيل حساب المورد اسلام'),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'فئه المورد',
                              style:
                                  getSemiBoldStyleAR(color: ColorManager.black),
                            ),
                            DefaultContainer(title: 'قماش')
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 71),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              data.length,
                              (index) => Column(
                                    children: [
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(57),
                                          child: dropDown(
                                            const [
                                              'تفاصيل الطلبات',
                                              'سداد المورد',
                                            ],
                                            selectTalab: index == selectedIndex
                                                ? chose1
                                                : chose2,
                                            onchanged: () => (val) {
                                              if (val == 'سداد المورد') {
                                                QR.to('/sup_pay');
                                              }
                                              setState(() {
                                                selectedIndex = index;
                                                chose1 = val;
                                              });
                                            },
                                            label: 'خيارات',
                                            foColor: Colors.white,
                                            bgColor: ColorManager.primary,
                                            dpColor: ColorManager.primary,
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
                        size: getProportionateScreenWidth(2),
                        color: ColorManager.second,
                        rows: data
                            .map((data) => DataRow(cells: [
                                  DataCell(Text(
                                    data['10'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['9'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['8'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['7'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['6'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['5'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['4'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['3'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['2'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['1'],
                                    style: style,
                                  )),
                                ]))
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DefaultRow(),
          ],
        ),
      ),
    ));
  }
}
