import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../resources/color_manger.dart';
import '../../view/home/components/default_table.dart';
import '../../view/home/components/drop_down.dart';

class companies_representatives extends StatefulWidget {
  companies_representatives({Key? key}) : super(key: key);

  @override
  State<companies_representatives> createState() =>
      _companies_representativesState();
}

class _companies_representativesState extends State<companies_representatives> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;

  List data = [
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
  ];

  List<String> columnData = [
    "نسبة رفض االستالم",
    "عدد الطلبات تحت التحصيل",
    "الرصيد",
    "النوع",
    "الاسم",
  ];

  List<String> dataTable = [""];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(6));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: Row(
      children: [
        Expanded(
            flex: 5,
            child: Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultContainer(title: 'شركات الشحن والمندوبين'),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    getProportionateScreenWidth(
                                                        55),
                                                child: dropDown(
                                                  const [
                                                    'كشف حساب',
                                                    'تعديل شركه الشحن',
                                                    'تحصيل الاجمالي',
                                                    'تحصيل شركه الشحن اليومي',
                                                  ],
                                                  selectTalab:
                                                      index == selectedIndex
                                                          ? chose1
                                                          : chose2,
                                                  onchanged: () => (val) {
                                                    if (val == 'كشف حساب') {
                                                      QR.to(
                                                          '/account_statement');
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
                            Column(
                              children: [
                                DefaultTable(
                                  color: ColorManager.primary,
                                  columnData: columnData,
                                  size: getProportionateScreenWidth(2),
                                  rows: data
                                      .map((data) => DataRow(cells: [
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
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    QR.to('/add_company');
                                  },
                                  child: Container(
                                    width: getProportionateScreenWidth(42),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
                                        border: Border.all(
                                            color: ColorManager.primary)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: ColorManager.primary,
                                        ),
                                        Text(
                                          'اضافه ',
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(5),
                                            fontWeight: FontWeight.w500,
                                            // color: ColorManager.primary
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
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
    )));
  }
}
