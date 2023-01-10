import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/sestem_admin_controller/system_controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Permission extends StatefulWidget {
  const Permission({Key? key}) : super(key: key);

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  String? chose;
  String? chose1;
  String? chose2;
  String? userName;
  int? selectedIndex;

  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "اضافه وصف",
      "2": "المخازن",
      '3': true,
      '4': false,
      '5': false,
      '6': false,
    },
    {
      "1": "اضافه وصف",
      "2": "المخازن",
      '3': false,
      '4': false,
      '5': false,
      '6': true,
    },
    {
      "1": "اضافه وصف",
      "2": "المخازن",
      '3': false,
      '4': false,
      '5': true,
      '6': false,
    },
    {
      "1": "اضافه وصف",
      "2": "المخازن",
      '3': false,
      '4': true,
      '5': false,
      '6': false,
    },
  ];

  List<String> columnData = [
    "اخفاء",
    "تعديل بعد الموافقه",
    "تعديل",
    "قراءه فقط",
    "الشاشه",
    "الصلاحيه",
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
        initialDate: orderDate1,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate1) {
      setState(() {
        orderDate1 = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
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
                          DefaultContainer(title: 'الصلاحيات'),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Consumer<AddUserDataController>(
                                builder: (context, valu, child) {
                                  return FutureBuilder(
                                      future: valu.getUser(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          List sup = snapshot.data as List;

                                          return SizedBox(
                                            width:
                                                getProportionateScreenWidth(50),
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
                                                  sup.length,
                                                  (index) =>
                                                      sup[index]['name']),
                                              dropdownDecoratorProps:
                                                  const DropDownDecoratorProps(
                                                dropdownSearchDecoration:
                                                    InputDecoration(
                                                  hintText: "Enter Name",
                                                ),
                                              ),
                                              onChanged: (v) {
                                                setState(() {
                                                  userName = v;
                                                });
                                              },
                                            ),
                                          );
                                        } else {
                                          return const CircularProgressIndicator();
                                        }
                                      });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                ' البحث',
                                style:
                                    getSemiBoldStyle(color: ColorManager.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(70),
                                height: 60,
                                child: DefaultInputForm(
                                  controller: controller1,
                                  perFix: const Icon(Icons.search),
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
                            height: getProportionateScreenWidth(5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DefaultTable(
                                  columnData: columnData,
                                  size: getProportionateScreenWidth(15),
                                  color: ColorManager.second,
                                  rows: [
                                    ...data
                                        .map((data) => DataRow(cells: [
                                              data['6']
                                                  ? DataCell(Image.asset(
                                                      ImageAssets
                                                          .iconDropDown33,
                                                      width: 50,
                                                      height: 50,
                                                    ))
                                                  : DataCell(Text(
                                                      '',
                                                      style: style,
                                                    )),
                                              data['5']
                                                  ? DataCell(Image.asset(
                                                      ImageAssets
                                                          .iconDropDown33,
                                                      width: 50,
                                                      height: 50,
                                                    ))
                                                  : DataCell(Text(
                                                      '',
                                                      style: style,
                                                    )),
                                              data['4']
                                                  ? DataCell(Image.asset(
                                                      ImageAssets
                                                          .iconDropDown33,
                                                      width: 50,
                                                      height: 50,
                                                    ))
                                                  : DataCell(Text(
                                                      '',
                                                      style: style,
                                                    )),
                                              data['3']
                                                  ? DataCell(Image.asset(
                                                      ImageAssets
                                                          .iconDropDown33,
                                                      width: 50,
                                                      height: 50,
                                                    ))
                                                  : DataCell(Text(
                                                      '',
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
                                  ]),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'المزيد',
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
    ));
  }
}
