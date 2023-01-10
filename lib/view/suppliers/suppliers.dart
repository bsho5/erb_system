import 'package:erb_system/controller/suppliers/add_suppliers.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class Suppliers extends StatefulWidget {
  Suppliers({Key? key}) : super(key: key);

  @override
  State<Suppliers> createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

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
    },
  ];

  List<String> columnData = [
    "طلبات قيد الانتظار",
    "رصيد حساب المورد",
    "فئه المورد",
    "العنوان",
    "رقم الهاتف",
    "اسم المورد",
  ];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AddSuppliersController>(context);
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
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
                            height: 25,
                          ),
                          DefaultContainer(title: 'الموردين'),
                          const SizedBox(
                            height: 25,
                          ),
                          Column(
                            children: [
                              Text(
                                'البحث',
                                style: style,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(70),
                                height: 60,
                                child: DefaultInputForm(
                                  controller: controller1,
                                  perFix: IconButton(
                                    icon: const Icon(Icons.search),
                                    color: Colors.grey[500],
                                    onPressed: () {},
                                  ),
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
                          const SizedBox(
                            height: 25,
                          ),
                          FutureBuilder(
                              future: pro.getSupplier(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List sData = snapshot.data as List;
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 71),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: List.generate(
                                              sData.length,
                                              (index) => Column(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              getProportionateScreenWidth(
                                                                  70),
                                                          child: dropDown(
                                                            const [
                                                              'تفاصيل الطلبات',
                                                              'تفاصيل حساب الموردين',
                                                              "تعديل المورد"
                                                            ],
                                                            selectTalab: index ==
                                                                    selectedIndex
                                                                ? chose1
                                                                : chose2,
                                                            onchanged: () =>
                                                                (val) {
                                                              print(index);
                                                              setState(() {
                                                                selectedIndex =
                                                                    index;
                                                                chose1 = val;
                                                              });
                                                              if (chose1 ==
                                                                  'تفاصيل الطلبات') {
                                                                QR.to(
                                                                    '/cat_details');
                                                              } else if (chose1 ==
                                                                  'تفاصيل حساب الموردين') {
                                                                QR.to(
                                                                    '/sup_money_details');
                                                              } else if (chose1 ==
                                                                  "تعديل المورد") {}
                                                            },
                                                            label: 'خيارات',
                                                            foColor:
                                                                Colors.white,
                                                            bgColor:
                                                                ColorManager
                                                                    .primary,
                                                            dpColor:
                                                                ColorManager
                                                                    .primary,
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
                                        size: getProportionateScreenWidth(7),
                                        color: ColorManager.second,
                                        rows: sData
                                            .map((data) => DataRow(cells: [
                                                  DataCell(Text(
                                                    '',
                                                  )),
                                                  DataCell(Text(
                                                    data['balance'].toString(),
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['category'],
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['address'],
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['phonenumber']
                                                        .toString(),
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['name'],
                                                    style: style,
                                                  )),
                                                ]))
                                            .toList(),
                                      ),
                                    ],
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              })
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
