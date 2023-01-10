import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../auth/component/text_fom_feild.dart';
import '../home/components/botton.dart';
import '../home/components/default_table.dart';
import '../home/components/drop_down.dart';

class CollectionOrderDetails extends StatefulWidget {
  @override
  State<CollectionOrderDetails> createState() => _CollectionOrderDetailsState();
}

class _CollectionOrderDetailsState extends State<CollectionOrderDetails> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
  TextEditingController controller9 = TextEditingController();
  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? stateTalab;
  String? shippingMethods;
  String? numLine;
  String? payment;
  String? city;
  String? companyCharge;
  String? calcComCharge;

  String? governorate;
  String? numLine1;
  String? typeOrder;
  String? order;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  DateTime chargeDate = DateTime.now();

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
    },
  ];

  List<String> columnData = [
    "صورةالمنتج",
    "اجمالي سعر البيع",
    "سعر ",
    "الوحده",
    "الكميةالمطلوبة",
    "اسم المنتج",
  ];
  List dataTable = [
    Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            )),
        const Text('اضافه منتج')
      ],
    )
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

  Future<void> _select1Date(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: stateDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != stateDate) {
      setState(() {
        stateDate = pickedDate;
      });
    }
  }

  Future<void> _select2Date(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: chargeDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != chargeDate) {
      setState(() {
        chargeDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    // var format = DateFormat.yMd('ar');

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultContainer(title: 'تفاصيل طلب محصل'),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 6, right: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width <=
                                                  500
                                              ? getProportionateScreenWidth(65)
                                              : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(90),
                                      padding: const EdgeInsets.only(top: 35),
                                      child: dropDown(
                                        const [
                                          "facebook",
                                          "website",
                                          "phone call"
                                        ],
                                        selectTalab: selectTalab,
                                        onchanged: () => (val) {
                                          setState(() {
                                            selectTalab = val;
                                          });
                                        },
                                        label: 'مصدر الطلب',
                                        foColor: Colors.white,
                                        bgColor: ColorManager.primary,
                                        dpColor: ColorManager.primary,
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width <=
                                                  500
                                              ? getProportionateScreenWidth(65)
                                              : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(90),
                                      padding: const EdgeInsets.only(top: 35),
                                      child: dropDown(
                                        const [
                                          "الكل",
                                          "طلب مؤكد",
                                          "تم الشحن",
                                          "تم التحصيل",
                                          "تم الاستلام",
                                          "تم الصيانة",
                                          "ملغى",
                                          "رفض الاستلام"
                                        ],
                                        selectTalab: stateTalab,
                                        onchanged: () => (val) {
                                          setState(() {
                                            stateTalab = val;
                                          });
                                        },
                                        label: 'حالة الطلب',
                                        foColor: Colors.white,
                                        bgColor: ColorManager.primary,
                                        dpColor: ColorManager.primary,
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width <=
                                                  500
                                              ? getProportionateScreenWidth(65)
                                              : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(90),
                                      padding: const EdgeInsets.only(top: 35),
                                      child: dropDown(
                                        const [
                                          "Small products",
                                          "Medium products",
                                          "Huge products"
                                        ],
                                        selectTalab: shippingMethods,
                                        onchanged: () => (val) {
                                          setState(() {
                                            shippingMethods = val;
                                          });
                                        },
                                        label: 'طرق الشحن',
                                        foColor: Colors.white,
                                        bgColor: ColorManager.primary,
                                        dpColor: ColorManager.primary,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'تاريخ الطلب',
                                      style: style,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(50),
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () => _selectDate(context),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white)),
                                        child: Text(
                                          "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      5)),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'تاريخ الحاله',
                                      style: style,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(50),
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () => _select1Date(context),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white)),
                                        child: Text(
                                          "${stateDate.year.toString()}/${stateDate.month.toString().padLeft(2, '0')}/${stateDate.day.toString().padLeft(2, '0')}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      5)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width <=
                                                  500
                                              ? getProportionateScreenWidth(75)
                                              : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(50),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3,
                                              color: const Color(0xff82225E)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: const Icon(
                                                Icons.arrow_drop_down_outlined,
                                                color: Color(0xff82225E)),
                                            items: [
                                              "الكل",
                                            ]
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(
                                                        e,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ))
                                                .toList(),
                                            value: city,
                                            onChanged: (val) {
                                              setState(() {
                                                city = val;
                                              });
                                            },
                                            hint: const Text(
                                              "المدينة",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            dropdownColor: Colors.white,
                                            style: const TextStyle(
                                                color: Color(0xff82225E)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width <=
                                                  500
                                              ? getProportionateScreenWidth(75)
                                              : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(50),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3,
                                              color: const Color(0xff82225E)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: const Icon(
                                                Icons.arrow_drop_down_outlined,
                                                color: Color(0xff82225E)),
                                            items: [
                                              "الكل",
                                            ]
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(
                                                        e,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ))
                                                .toList(),
                                            value: governorate,
                                            onChanged: (val) {
                                              setState(() {
                                                governorate = val;
                                              });
                                            },
                                            hint: const Text(
                                              "المحافظة",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            dropdownColor: Colors.white,
                                            style: const TextStyle(
                                                color: Color(0xff82225E)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'اسم العميل',
                                          style: style,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(40),
                                          height: 60,
                                          child: DefaultInputForm(
                                            hint: '',
                                            label: '',
                                            onTab: () {},
                                            validate: () {},
                                            onSave: () {},
                                            passFun: () {},
                                            color: Colors.white70,
                                            obscureText: false,
                                            controller: controller1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'رقم الموبيل 1',
                                          style: style,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(40),
                                          height: 60,
                                          child: DefaultInputForm(
                                            controller: controller2,
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'رقم الموبيل 2',
                                          style: style,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(40),
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
                                  ],
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width <= 500
                                          ? getProportionateScreenWidth(65)
                                          : getProportionateScreenWidth(43),
                                  height: getProportionateScreenHeight(90),
                                  padding: const EdgeInsets.only(top: 35),
                                  child: dropDown(
                                    const [
                                      "طلب جديد",
                                      "طلب استبدال",
                                      "طلب صيانة",
                                      "طلب مرتجع",
                                    ],
                                    selectTalab: typeOrder,
                                    onchanged: () => (val) {
                                      setState(() {
                                        typeOrder = val;
                                      });
                                    },
                                    label: 'نوع الطلب',
                                    foColor: Colors.white,
                                    bgColor: ColorManager.primary,
                                    dpColor: ColorManager.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: getProportionateScreenWidth(70),
                                    height: getProportionateScreenHeight(183),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.more_horiz),
                                            Text(
                                              'ملحوظات',
                                              style: style,
                                            ),
                                            Icon(Icons.close)
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                          thickness: 2,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 5,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(70),
                                    height: getProportionateScreenHeight(183),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.more_horiz),
                                            Text(
                                              'تتبع',
                                              style: style,
                                            ),
                                            Icon(Icons.close)
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                          thickness: 2,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 5,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  DefaultTable(
                                    columnData: columnData,
                                    size: getProportionateScreenWidth(6),
                                    color: ColorManager.primary,
                                    rows: data
                                        .map((data) => DataRow(cells: [
                                              DataCell(Image.asset(
                                                ImageAssets.iconDropDown23,
                                                width: 50,
                                                height: 50,
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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width <= 500
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "خزينه المصنع",
                                    "البنك االاهلي",
                                    "paymob",
                                    "valu"
                                  ],
                                  selectTalab: payment,
                                  onchanged: () => (val) {
                                    setState(() {
                                      payment = val;
                                    });
                                  },
                                  label: 'الخزينه',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              Column(
                                children: [
                                  Text('صافي القيمة', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller4,
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
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width <= 500
                                            ? getProportionateScreenWidth(65)
                                            : getProportionateScreenWidth(43),
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                      const [
                                        "الخط الاول",
                                        "الخط الثاني",
                                        "الخط الثالث",
                                      ],
                                      selectTalab: numLine,
                                      onchanged: () => (val) {
                                        setState(() {
                                          numLine = val;
                                        });
                                      },
                                      label: 'رقم الخط',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'مبلغ تحت الحساب',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller5,
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
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width <= 500
                                            ? getProportionateScreenWidth(65)
                                            : getProportionateScreenWidth(43),
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                      const [
                                        "مندوب احمد",
                                        "aramex",
                                        "urgent",
                                      ],
                                      selectTalab: companyCharge,
                                      onchanged: () => (val) {
                                        setState(() {
                                          companyCharge = val;
                                        });
                                      },
                                      label: "شركه الشحن",
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('اجمالى الفاتورة', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller6,
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
                                  Text(
                                    'تاريخ الشحن',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () => _select2Date(context),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text(
                                        "${chargeDate.year.toString()}/${chargeDate.month.toString().padLeft(2, '0')}/${chargeDate.day.toString().padLeft(2, '0')}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(5)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('مصاريف الشحن', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller7,
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
                                  Text('خط التوزيع', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller9,
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
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width <= 500
                                            ? getProportionateScreenWidth(65)
                                            : getProportionateScreenWidth(43),
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                      const [
                                        "حساب بالقطعه",
                                        "حساب يومي",
                                        "حساب بالطلب"
                                      ],
                                      selectTalab: calcComCharge,
                                      onchanged: () => (val) {
                                        setState(() {
                                          calcComCharge = val;
                                        });
                                      },
                                      label: 'طريقه حساب الشحن',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('حساب بالقطعه او بالطلب', style: style),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(50),
                                height: 60,
                                child: DefaultInputForm(
                                  controller: controller8,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'العنوان',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width <= 917
                                            ? getProportionateScreenWidth(75)
                                            : getProportionateScreenWidth(63),
                                    height: 100,
                                    child: TextFormField(
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      ColorManager.primary))),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: getProportionateScreenWidth(35),
                                height: getProportionateScreenHeight(132),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'ارفاق ايصال الدفع',
                                      style: style,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        ImageAssets.iconDropDown20,
                                        width: getProportionateScreenWidth(35),
                                        height:
                                            getProportionateScreenHeight(85),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: getProportionateScreenWidth(50),
                                height: getProportionateScreenHeight(132),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'ارفاق صوره بوليسه الشحن',
                                      style: style,
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          ImageAssets.iconDropDown20,
                                          width:
                                              getProportionateScreenWidth(35),
                                          height:
                                              getProportionateScreenHeight(85),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'العوده الي شاشه الطلبات',
                            onTap: () {},
                          )
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
    );
  }
}
