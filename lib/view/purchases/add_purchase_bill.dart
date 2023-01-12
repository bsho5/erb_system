import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/controller/purchase_controller/pruchase_controller.dart';
import 'package:erb_system/controller/suppliers/add_suppliers.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/resources/value_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPurchaseBill extends StatefulWidget {
  AddPurchaseBill(
      {Key? key,
       this.status,
       this.date,
       this.supName,
       this.remainingBalance,
       this.paid,
       this.shipping,
       this.treasury,
       this.image,
       this.id,
       this.isEdit = false})
      : super(key: key);
  String? status;
  String? date;
  String? supName;
  String? remainingBalance;
  String? paid;
  String? shipping;
  String? treasury;
  String? image;
  String? id;
  bool isEdit = false;
  bool isFromAnotherPage = false;
  @override
  State<AddPurchaseBill> createState() => _AddPurchaseBillState();
}

class _AddPurchaseBillState extends State<AddPurchaseBill> {
  String? chose;
  String? chose1;
  String? chose2;
  DateTime orderDate = DateTime.now();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController quantity = TextEditingController();

  int? selectedIndex;
  List data = [];
  List finalData = [];

  String? catName;
  String? catPrice;
  String? catMeasurement;
  String? image;
  double totalTotal = 0;
  int totalQuantity = 0;
  String? bank;
  String? supName;

  List<String> columnData = [
    "صوره الصنف",
    "الاجمالي",
    "السعر",
    "الوحده",
    "الكميه المطلوبه",
    "اسم الصنف",
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

  List<String> dbDataId = [];
  List<String> dataId = [];
  Map<String, Map<String, dynamic>> result = {};
  void initState() {
    super.initState();
    chose = widget.status;
    supName = widget.supName;
    chose1 = widget.treasury;
    controller1.text = widget.paid ?? "";
    controller2.text = widget.shipping ?? "";
    controller3.text = widget.remainingBalance ?? "";
    FirebaseFirestore.instance
        .collection('addpurchasing')
        .doc(widget.id)
        .collection('rawmaterials')
        .get()
        .then((value) => value.docs.forEach((element) {
              setState(() {
                print(element.id);
                result[element.id] = element.data();
                dbDataId.add(element.id);
                dataId.add(element.id);
              });
            }));
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<PurchaseController>(context);
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
                          DefaultContainer(title: widget.isEdit ?' تفاصيل فاتوره مشتريات ': 'اضافه فاتوره مشتريات'),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'التاريخ',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(40),
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () => _selectDate(context),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text(
                                        widget.isEdit
                                            ? widget.date ?? ''
                                            : "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                        style: TextStyle(
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
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
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
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
                                 widget.isEdit?Text(widget.supName??''): Consumer<AddSuppliersController>(
                                    builder: (context, valu, child) {
                                      return FutureBuilder(
                                          future: valu.getSupplier(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List sup = snapshot.data as List;

                                              return SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        50),
                                                height: 60,
                                                child: DropdownSearch<String>(
                                                  popupProps: PopupProps.menu(
                                                    showSelectedItems: true,
                                                    showSearchBox: true,
                                                    searchFieldProps:
                                                        TextFieldProps(
                                                            cursorColor:
                                                                ColorManager
                                                                    .primary),
                                                    // disabledItemFn:
                                                    //     (String s) =>
                                                    //         s.startsWith('I'),
                                                  ),
                                                  items: List.generate(
                                                      widget.isEdit
                                                          ? dataId.length
                                                          : sup.length,
                                                      (index) => widget.isEdit
                                                          ? (result[
                                                                  dataId[index]]
                                                              ?['name'])
                                                          : sup[index]['name']),
                                                  dropdownDecoratorProps:
                                                       DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                        InputDecoration(
                                                      hintText:widget.isEdit?supName??'': "Enter Name",
                                                    ),
                                                  ),
                                                  onChanged: (v) {
                                                    setState(() {
                                                      supName = v;
                                                    });
                                                  },
                                                ),
                                              );
                                            } else {
                                              return const CircularProgressIndicator();
                                            }
                                          });
                                    },
                                  )
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: getProportionateScreenWidth(35),
                                    height: getProportionateScreenHeight(132),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    )),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'اضافة صورة',
                                          style: style,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            ImageAssets.iconDropDown20,
                                            width:
                                                getProportionateScreenWidth(35),
                                            height:
                                                getProportionateScreenHeight(
                                                    85),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'اسم الصنف',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Consumer<CategoryController>(
                                      //   builder: (context, valu, child) {
                                      //     return FutureBuilder(
                                      //         future: valu.getMaterials(),
                                      //         builder: (context, snapshot) {
                                      //           if (snapshot.hasData) {
                                      //             List sup =
                                      //                 snapshot.data as List;

                                      //             return SizedBox(
                                      //               width:
                                      //                   getProportionateScreenWidth(
                                      //                       50),
                                      //               height: 60,
                                      //               child:
                                      //                   DropdownSearch<String>(
                                      //                 popupProps:
                                      //                     PopupProps.menu(
                                      //                   showSelectedItems: true,
                                      //                   showSearchBox: true,
                                      //                   searchFieldProps:
                                      //                       TextFieldProps(
                                      //                           cursorColor:
                                      //                               ColorManager
                                      //                                   .primary),
                                      //                   // disabledItemFn:
                                      //                   //     (String s) =>
                                      //                   //         s.startsWith('I'),
                                      //                 ),
                                      //                 items: List.generate(
                                      //                     widget.isEdit?dataId.length: sup.length,
                                      //                     (index) =>widget.isEdit?( result[data]?['name']): sup[index]
                                      //                         ['name']),
                                      //                 dropdownDecoratorProps:
                                      //                     const DropDownDecoratorProps(
                                      //                   dropdownSearchDecoration:
                                      //                       InputDecoration(
                                      //                     hintText: "اسم الصنف",
                                      //                   ),
                                      //                 ),
                                      //                 onChanged: (v) async {
                                      //                   await FirebaseFirestore
                                      //                       .instance
                                      //                       .collection(
                                      //                           'Materials')
                                      //                       .doc(v)
                                      //                       .get()
                                      //                       .then((value) {
                                      //                     catPrice =
                                      //                         value['price']
                                      //                             .toString();
                                      //                     catName = v;
                                      //                     catMeasurement = value[
                                      //                         'measurement'];
                                      //                     image =
                                      //                         value['image'];
                                      //                     quantity.text = '0';
                                      //                     total.text = '0';
                                      //                     data.add({
                                      //                       "name": v,
                                      //                       'quantity': value[
                                      //                           'quantity'],
                                      //                       "measurement": value[
                                      //                           'measurement'],
                                      //                       'price':
                                      //                           value['price'],
                                      //                       'image':
                                      //                           value['image'],
                                      //                     });
                                      //                   });

                                      //                   print(v);
                                      //                   setState(() {});
                                      //                 },
                                      //               ),
                                      //             );
                                      //           } else {
                                      //             return const CircularProgressIndicator();
                                      //           }
                                      //         });
                                      //   },
                                      // )
                                    ],
                                  ),
                                  DefaultTable(
                                      columnData: columnData,
                                      size: getProportionateScreenWidth(15),
                                      color: ColorManager.primary,
                                      rows: widget.isEdit
                                          ? [
                                              ...dataId
                                                  .map((data) =>
                                                      DataRow(cells: [
                                                        // DataCell(Image.network(
                                                        //   result[data]
                                                        //                             ?['image'],
                                                        //   width: 50,
                                                        //   height: 50,
                                                        // )),
                                                        DataCell(Text('')),
                                                        DataCell(Text(
                                                          result[data]?[
                                                                      'totalprice']
                                                                  .toString() ??
                                                              '',
                                                          style: style,
                                                        )),
                                                        DataCell(Text(
                                                          result[data]?['price']
                                                                  .toString() ??
                                                              '',
                                                          style: style,
                                                        )),
                                                        DataCell(Text(
                                                          result[data]!['unit'],
                                                          style: style,
                                                        )),
                                                        DataCell(Text(
                                                          result[data]?[
                                                              'requirequantity'],
                                                          style: style,
                                                        )),
                                                        DataCell(Text(
                                                          result[data]?['name'],
                                                          style: style,
                                                        )),
                                                      ]))
                                                  .toList(),
                                            ]
                                          : [
                                              ...finalData
                                                  .map((data) =>
                                                      DataRow(cells: [
                                                        DataCell(Image.network(
                                                          data['image'],
                                                          width: 50,
                                                          height: 50,
                                                        )),
                                                        DataCell(Text(
                                                          data['total']
                                                              .toString(),
                                                          style: style,
                                                        )),
                                                        DataCell(Text(
                                                          data['price']
                                                              .toString(),
                                                          style: style,
                                                        )),
                                                        DataCell(Text(
                                                          data['measurement'],
                                                          style: style,
                                                        )),
                                                        DataCell(Text(
                                                          data['quantity'],
                                                          style: style,
                                                        )),
                                                        DataCell(Text(
                                                          data['name'],
                                                          style: style,
                                                        )),
                                                      ]))
                                                  .toList(),
                                              ...data
                                                  .map(
                                                      (data) => DataRow(cells: [
                                                            DataCell(
                                                                Image.network(
                                                              data['image'],
                                                              width: 50,
                                                              height: 50,
                                                            )),
                                                            DataCell(
                                                              TextFormField(
                                                                readOnly: false,
                                                                controller:
                                                                    total,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        getProportionateScreenWidth(
                                                                            4)),
                                                                onChanged:
                                                                    (v) {},
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintStyle:
                                                                      const TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                  label: Container(
                                                                      alignment: Alignment.center,
                                                                      child: const Text(
                                                                        '',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      )),
                                                                  filled: true,
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                            ),
                                                            DataCell(Text(
                                                              data['price']
                                                                  .toString(),
                                                              style: style,
                                                            )),
                                                            DataCell(Text(
                                                              data[
                                                                  'measurement'],
                                                              style: style,
                                                            )),
                                                            DataCell(
                                                              TextFormField(
                                                                controller:
                                                                    quantity,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        getProportionateScreenWidth(
                                                                            4)),
                                                                onChanged: (v) {
                                                                  setState(() {
                                                                    if (v
                                                                        .isNotEmpty) {
                                                                      total = TextEditingController(
                                                                          text:
                                                                              "${data['price'] * num.parse(v)}");
                                                                    } else {
                                                                      total = TextEditingController(
                                                                          text:
                                                                              "0");
                                                                    }
                                                                  });
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintStyle:
                                                                      const TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                  label: Container(
                                                                      alignment: Alignment.center,
                                                                      child: const Text(
                                                                        '',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      )),
                                                                  filled: true,
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                            ),
                                                            DataCell(Text(
                                                              data['name'],
                                                              style: style,
                                                            )),
                                                          ]))
                                                  .toList(),
                                            ]),
                                  widget.isEdit
                                      ? SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            finalData.add({
                                              "name": catName,
                                              'quantity': quantity.text,
                                              "measurement": catMeasurement,
                                              'price': catPrice,
                                              'image': image,
                                              'total': total.text,
                                            });
                                            totalTotal +=
                                                double.parse(total.text);
                                            totalQuantity +=
                                                int.parse(quantity.text);
                                            data.clear();
                                            setState(() {});
                                          },
                                          child: Container(
                                            width:
                                                getProportionateScreenWidth(42),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(25)),
                                                border: Border.all(
                                                    color:
                                                        ColorManager.primary)),
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
                                                  'اضافه صنف ',
                                                  style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            5),
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
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                    width: getProportionateScreenWidth(59),
                                    height: getProportionateScreenHeight(50),
                                    child: dropDown(
                                      const [
                                        'خزينه المصنع',
                                        'البنك الاهلي',
                                        'فوافون كاش',
                                        'بنك مصر',
                                      ],
                                      selectTalab: chose1,
                                      onchanged: () => (val) {
                                        if (val == 'خزينه المصنع') {
                                          setState(() {
                                            bank = 'companytreasury';
                                          });
                                        } else if (val == 'البنك الاهلي') {
                                          setState(() {
                                            bank = 'bankalahly';
                                          });
                                        } else if (val == 'بنك مصر') {
                                          setState(() {
                                            bank = 'bankmasr';
                                          });
                                        }
                                        setState(() {
                                          chose1 = val;
                                        });
                                      },
                                      label: 'الخزينه',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    )),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'الشحن',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller2,
                                      hint: '',
                                      label: '',
                                      readOnly: widget.isEdit,
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
                              Column(
                                children: [
                                  Text(
                                    'المبلغ المتبقي',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller3,
                                      hint: '',
                                      label: '',
                                      readOnly: widget.isEdit,
                                      onTab: () {},
                                      validate: () {},
                                      onSave: () {},
                                      passFun: () {},
                                      color: Colors.grey,
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
                                    'المبلغ المدفوع',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 60,
                                    child: TextFormField(
                                      readOnly: widget.isEdit,
                                      controller: controller1,
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(4)),
                                      onChanged: (v) {
                                        setState(() {
                                          if (v.isNotEmpty) {
                                            controller3 = TextEditingController(
                                                text:
                                                    '${totalTotal - num.parse(v)}');
                                          } else {
                                            controller3 = TextEditingController(
                                                text: "0");
                                          }
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintStyle:
                                            const TextStyle(fontSize: 14),
                                        label: Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              '',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s15),
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s15),
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.2)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              AppSize.s15),
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: 1.2),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          widget.isEdit
                              ? Container()
                              : Botton(
                                  color: ColorManager.white,
                                  title: 'اضافه',
                                  onTap: () {
                                    try {
                                      pro
                                          .addBill(
                                              bank!,
                                              double.parse(controller1.text) +
                                                  double.parse(
                                                      controller2.text),
                                              supName!,
                                              double.parse(controller3.text),
                                              totalTotal)
                                          .then((value) {
                                        pro.addPurchasing(
                                            date: orderDate.toString(),
                                            state: chose!,
                                            trasury: chose1!,
                                            supName: supName!,
                                            podownpayment:
                                                double.parse(controller1.text),
                                            poshippingfees:
                                                double.parse(controller2.text),
                                            remainbalance:
                                                double.parse(controller3.text),
                                            total: totalTotal,
                                            purData: finalData,
                                            totalQuantity: totalQuantity,
                                            measurement: catMeasurement!);
                                      });
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                  bgColor: ColorManager.black,
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
    ));
  }
}
