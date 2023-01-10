import 'package:erb_system/controller/store_controller/add_store_controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/store/fiber_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class StoreDetails extends StatelessWidget {
  var storeName;

  StoreDetails({Key? key, this.title}) : super(key: key);
  String? title = '';

  TextEditingController controller1 = TextEditingController();

  List<String> columnData = [
    "التكلفة االاجمالية",
    "تكلفة الوحدة",
    "الكمية",
    "وحدة القياس",
    "اسم الصنف",
  ];
  List<String> dataTable = [
    '٧٢٠٠',
    'االاجمالي',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<AddStoreController>(context);
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    DefaultContainer(title: 'تفاصيل  $title'),
                    const SizedBox(
                      height: 50,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: MediaQuery.of(context).size.width <= 500
                              ? const EdgeInsets.only(top: 60)
                              : const EdgeInsets.only(top: 65),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                                pro.rowMaterial.length,
                                    (index) => Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                      child: DefaultBotton(
                                        top: MediaQuery.of(context)
                                            .size
                                            .width <=
                                            500
                                            ? getProportionateScreenWidth(8)
                                            : getProportionateScreenWidth(3),
                                        right: getProportionateScreenWidth(3),
                                        title: 'تفاصيل',
                                        color: ColorManager.white,
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FiperDetails(
                                                        storeName: title!,
                                                        pName:pro.rowMaterial[index]['name'] ,
                                                      )));
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(3),
                        ),
                        Column(
                          children: [
                            DefaultTable(
                                columnData: columnData,
                                size: getProportionateScreenWidth(15),
                                color: ColorManager.second,
                                rows: [

                                  ...pro.rowMaterial.map((data) {
                                    storeName = data["name"];
                                    return DataRow(cells: [
                                      DataCell(Text(
                                        (data['quantity']*data["price"]).toString(),
                                      )),
                                      DataCell(Text(
                                        data['price'].toString(),
                                      )),
                                      DataCell(Text(
                                        data['quantity'].toString(),
                                      )),
                                      DataCell(Text(
                                        data['measurement'],
                                      )),
                                      DataCell(Text(
                                        data['name'],
                                      )),
                                    ]);
                                  }).toList(),
                                  DataRow(
                                      color: MaterialStateProperty.all(
                                          ColorManager.primary),
                                      cells: [
                                        DataCell(Text(
                                          " ٧٢٠٠",
                                          style: TextStyle(
                                              color: ColorManager.white,
                                              fontSize:
                                              getProportionateScreenWidth(5),
                                              fontWeight: FontWeight.w800),
                                        )),
                                        DataCell(Text(
                                          '',
                                          style: style,
                                        )),
                                        DataCell(Text(
                                          '',
                                          style: style,
                                        )),
                                        DataCell(Text(
                                          '',
                                          style: style,
                                        )),
                                        DataCell(
                                            Container(
                                              color: ColorManager.primary,
                                              child: Text(
                                                'الاجمالي',
                                                style: TextStyle(
                                                    color: ColorManager.white,
                                                    fontSize:
                                                    getProportionateScreenWidth(
                                                        5),
                                                    fontWeight: FontWeight.w800),
                                              ),
                                            ),
                                            placeholder: true),
                                      ])
                                ]),
                            // Container(
                            //   width: 617,
                            //   child: Table(
                            //     border: TableBorder.all(color: Colors.black),
                            //     children: [
                            //       TableRow(
                            //           decoration: const BoxDecoration(
                            //             color: Color(0xff82225E),
                            //           ),
                            //           children: List.generate(
                            //               dataTable.length,
                            //               (index) => Column(
                            //                     children: [
                            //                       const SizedBox(height: 10),
                            //                       Text(
                            //                         dataTable[index],
                            //                         style: const TextStyle(
                            //                             color: Colors.white),
                            //                       ),
                            //                     ],
                            //                   ))),
                            //     ],
                            //   ),
                            // ),
                          ],
                        )
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
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: InkWell(
                          onTap: () {
                            QR.navigator.popUntilOrPush('/');
                          },
                          child: Image.asset(ImageAssets.iconDropDown2)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: InkWell(
                          onTap: () {
                            QR.navigator.popUntilOrPush('/');
                          },
                          child: Image.asset(ImageAssets.iconDropDown52)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}