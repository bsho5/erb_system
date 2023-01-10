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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/controller/Orders/orders_controller.dart';
import 'package:provider/provider.dart';

class LoadOrder extends StatefulWidget {

  LoadOrder(
      {Key? key,
      })
      : super(key: key);

  @override
  State<LoadOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<LoadOrder> {
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
  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? stateTalab;
  String? shippingMethods;
  String? numLine;
  String? city;
  String? typeCustomer;
  String ? companyCharge;
  String? governorate;
  String? numLine1;
  String? typeOrder;
  String? order;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  DateTime chargeDate = DateTime.now();

  String search = '';

  List data = [

  ];

  List<String> columnData = [
    "صورةالمنتج",
    "اجمالي سعر البيع",
    "سعر البيع",
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
    var pro = Provider.of<AddOrderController>(context);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
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
                          DefaultContainer(title: 'شحن الطلب'),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 16, right: 16),
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

                                        ],
                                        selectTalab: stateTalab,
                                        onchanged: () => (val) {
                                          setState(() {
                                            stateTalab = val;
                                          });
                                        },
                                        label: pro.orderstatus!,
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

                                        ],
                                        selectTalab: shippingMethods,
                                        onchanged: () => (val) {
                                          setState(() {
                                            shippingMethods = val;
                                          });
                                        },
                                        label: pro.shippingtyp!,
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
                                          pro.date!,
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
                                            hint:  Text(
                                              pro.city!,
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
                                            hint:  Text(
                                              pro.government!,
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
                                          child: Center(child: Text(
                                            pro.customername!,
                                            style: style,
                                          ),),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
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
                                          child: Center(child: Text(
                                            pro.phoneNumber.toString(),
                                            style: style,
                                          ),),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [

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
                                          child: Center(child: Text(
                                            pro.phoneNumber1!,
                                            style: style,
                                          ),),
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

                                    ],
                                    selectTalab: typeOrder,
                                    onchanged: () => (val) {
                                      setState(() {
                                        typeOrder = val;
                                      });
                                    },
                                    label: pro.orderstatus,
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
                                        Center(child: SizedBox(
                                          width:
                                          getProportionateScreenWidth(40),
                                          height: 60,
                                          child: Center(child: Text(
                                            pro.notes!,
                                            style: style,
                                          ),),
                                        ),)
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
                                    rows: pro.orders!
                                        .map((data) => DataRow(cells: [
                                      DataCell(Image.asset(
                                        ImageAssets.iconDropDown23,
                                        width: 50,
                                        height: 50,
                                      )),
                                      DataCell(Text(
                                        data['totalprice'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['price'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['unit'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['quantity'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['productname'],
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
                              /*Container(
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
                              ),*/
                              Column(
                                children: [
                                  Text('صافي القيمة', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width:
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.netamount.toString(),
                                      style: style,
                                    ),),
                                  ),

                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width <= 500
                                        ? getProportionateScreenWidth(65)
                                        : getProportionateScreenWidth(43),
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                       [
                                      pro.routenumber!
                                      ],
                                      selectTalab: numLine,
                                      onchanged: () => (val) {
                                        setState(() {
                                          numLine = val;
                                        });
                                      },
                                      label: pro.routenumber!,
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
                                    width:
                                    getProportionateScreenWidth(20),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.downpayment.toString(),
                                      style: style,
                                    ),),
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
                                    width:
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.totalinvoice.toString(),
                                      style: style,
                                    ),),
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
                                    width:
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.shippingfees.toString(),
                                      style: style,
                                    ),),
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
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.address!,
                                      style: style,
                                    ),),
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
                                          width:
                                          getProportionateScreenWidth(35),
                                          height:
                                          getProportionateScreenHeight(85),
                                        ))
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
                                      'ارفاق صوره بوليصه الشحن',
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
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'شحن',
                            onTap: () async{

                              await FirebaseFirestore.instance.collection("courriers").doc(companyCharge!).update(
                                  {
                                    "balance":FieldValue.increment(pro.netamount!)
                                  });

                              await FirebaseFirestore.instance.collection("supplychain").doc(pro.id!).update(
                                  {
                                    "routenumber":numLine.toString(),
                                    "statusdate":chargeDate.toString(),
                                    "orderstatus":"تم شحن",
                                    "courrier":companyCharge
                                  });
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(height: 10,)
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

