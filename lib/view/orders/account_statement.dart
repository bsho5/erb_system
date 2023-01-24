import 'package:erb_system/merge_table/merge_table.dart';
import 'package:erb_system/merge_table/src/datas/m_row.dart';
import 'package:erb_system/merge_table/src/merge_table.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:flutter/material.dart';
import 'package:erb_system/merge_table/src/datas/merge_table_alignment.dart';

import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';
import '../auth/component/text_fom_feild.dart';
import '../home/components/drop_down.dart';

class account_statement extends StatefulWidget {
  account_statement({Key? key}) : super(key: key);

  @override
  State<account_statement> createState() => _account_statementState();
}

class _account_statementState extends State<account_statement> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  String? chose;
  String? chose1;
  String? chose2;
  String? chose3;
  bool isVisible = false;
  int? selectedIndex;
  String? state;
  DateTime orderDate = DateTime.now();

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

  List data = [
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
  ];

  List<String> columnData = [
    "المبلغ",
    "حاله الدفع",
    "رقم الموبيل",
    "اسم العميل",
    "رقم الطلب",
  ];

  List<String> dataTable = ["الطلبات"];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(6));

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultContainer(
                    title: 'aramex كشف حساب',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            'عدد الطلبات تحت التحصيل',
                            style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: getProportionateScreenWidth(5)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(50),
                            height: 60,
                            child: DefaultInputForm(
                              controller: controller1,
                              hint: '',
                              label: '',
                              onTab: () {},
                              validate: () {},
                              onSave: () {},
                              passFun: () {},
                              color: Colors.white70,
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      Container(
                        width: getProportionateScreenWidth(60),
                        height: getProportionateScreenHeight(90),
                        padding: const EdgeInsets.only(top: 35),
                        child: dropDown(
                          const [
                            'تم الشحن',
                            'تم التحصيل',
                            'ملغي',
                            'رفض استالم'
                          ],
                          selectTalab: state,
                          onchanged: () => (val) {
                            setState(() {
                              state = val;
                            });
                          },
                          label: 'الحالة',
                          foColor: Colors.white,
                          bgColor: ColorManager.primary,
                          dpColor: ColorManager.primary,
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      Column(
                        children: [
                          Text(
                            'التاريخ',
                            style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: getProportionateScreenWidth(5)),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(40),
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () => _selectDate(context),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: Text(
                                "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                style: TextStyle(
                                    color: Color(0xff82225E),
                                    fontSize: getProportionateScreenWidth(5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            'حساب شركه الشحن اليومي',
                            style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: getProportionateScreenWidth(5)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(50),
                            height: 60,
                            child: DefaultInputForm(
                              controller: controller2,
                              hint: '',
                              label: '',
                              onTab: () {},
                              validate: () {},
                              onSave: () => (val) {
                                //print(val);
                              },
                              passFun: () {},
                              color: Colors.white70,
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      Column(
                        children: [
                          Text(
                            'المبلغ المتبقي',
                            style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: getProportionateScreenWidth(5)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(50),
                            height: 60,
                            child: DefaultInputForm(
                              controller: controller2,
                              hint: '',
                              label: '',
                              onTab: () {},
                              validate: () {},
                              onSave: () => (val) {
                                //print(val);
                              },
                              passFun: () {},
                              color: Colors.white70,
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      Column(
                        children: [
                          Text(
                            'المبلغ المحصل',
                            style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: getProportionateScreenWidth(5)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(50),
                            height: 60,
                            child: DefaultInputForm(
                              controller: controller3,
                              hint: '',
                              label: '',
                              onTab: () {},
                              validate: () {},
                              onSave: () {},
                              passFun: () {},
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
                    height: 64,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: MediaQuery.of(context).size.width <= 800
                            ? const EdgeInsets.only(top: 20)
                            : const EdgeInsets.only(top: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              data.length,
                              (index) => Column(
                                    children: [
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(40),
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .width <=
                                                  800
                                              ? 7
                                              : 30,
                                          child: dropDown(
                                            const [
                                              'تحصيل',
                                              'رفض استلام',
                                            ],
                                            selectTalab: index == selectedIndex
                                                ? chose1
                                                : chose2,
                                            onchanged: () => (val) {
                                              if (val == 'تحصيل') {
                                                setState(() {
                                                  isVisible = true;
                                                });
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
                      const SizedBox(
                        width: 32,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(250),
                            child: MergeTable(
                              borderColor: Colors.black,
                              alignment: MergeTableAlignment.center,
                              columns: [
                                MMergedColumns(
                                  header: "الطلبات",
                                  columns: columnData,
                                ),
                              ],
                              rows: data
                                  .map(
                                    (e) => [
                                      MMergedRows([
                                        Text(
                                          e['5'],
                                          style: style,
                                        ),
                                        Text(
                                          e['4'],
                                          style: style,
                                        ),
                                        Text(e['3'], style: style),
                                        Text(e['2'], style: style),
                                        Text(e['1'], style: style),
                                      ]),
                                    ],
                                  )
                                  .toList(),
                              color: ColorManager.second,
                              size: getProportionateScreenWidth(5),
                            ),
                          ),
                          isVisible
                              ? Container(
                                  width: getProportionateScreenWidth(200),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      40),
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .width <=
                                                      800
                                                  ? 7
                                                  : 30,
                                              child: dropDown(
                                                const [
                                                  'خزينه المصنع',
                                                  'البنك الاهلي',
                                                  'فودافون كاش',
                                                  'بنك مصر',
                                                ],
                                                selectTalab: chose3,
                                                onchanged: () => (val) {
                                                  if (val == 'تحصيل') {
                                                    setState(() {
                                                      isVisible = true;
                                                    });
                                                  }
                                                  setState(() {
                                                    chose3 = val;
                                                  });
                                                },
                                                label: "اختيار الخزينه",
                                                foColor: Colors.white,
                                                bgColor: ColorManager.primary,
                                                dpColor: ColorManager.primary,
                                              )),
                                        ],
                                      ),
                                      Botton(
                                        bgColor: Colors.black,
                                        color: Colors.white,
                                        title: 'تاكيد تحصيل',
                                        onTap: () {},
                                      )
                                    ],
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const DefaultRow(),
        ],
      ),
    );
  }
}
