import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String? chose;
  String? chose1;
  String? chose2;
  String? searchWord;
  String? production;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int ordersNumber = 30;
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
    "صورة الصنف",
    "التكلفه او سعر البيع",
    "المطلوب",
    "الرصيد",
    "فرع الانتاج",
    "الوحده",
    "نوع الصنف",
    "اسم الصنف",
  ];
  List<String> dbDataId = [];
  List<String> dataId = [];
  List<String> dataIdUnPaginated = [];
  Map<String, Map<String, dynamic>> result = {};
  double total = 0;

  void performSearch(
    String? searchWord,
    String? categoryType,
    String? production,
  ) {
    setState(() {
      dataId = categoryFilter(
          searchWord: searchWord ?? '',
          categoryType: categoryType ?? '',
          production: production ?? '',
          result: result);
      //print(dataId);
      total = dataId.fold(
          0,
          (previousValue, element) =>
              previousValue +
              result[element]?['openingbalance'] * result[element]?['price']);
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('Materials')
        .get()
        .then((value) => value.docs.forEach((element) {
              setState(() {
                result[element.id] = element.data();

                dbDataId.add(element.id);
                dataId.add(element.id);
                //print(element.data()['openingbalance']);
                //print(element.data()['price']);
                total = total +
                    (element.data()['openingbalance'] *
                        element.data()['price']);
              });
            }));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<CategoryController>(context);
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
                          DefaultContainer(title: 'الاصناف'),
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
                                    'فرع الانتاج',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller1,
                                      hint: '',
                                      label: '',
                                      onChanged: (v) {
                                        setState(() {
                                          production = v;
                                          performSearch(
                                              searchWord?.toCapitalized() ?? '',
                                              chose == 'الكل'
                                                  ? chose = null
                                                  : chose,
                                              production?.toCapitalized() ??
                                                  '');

                                          // ordersNumber = dataId.length;
                                          if (production == null &&
                                              searchWord == null &&
                                              chose == 'الكل') {
                                            dataId = dbDataId;
                                          }
                                        });
                                      },
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
                                width: 50,
                              ),
                              Container(
                                width: getProportionateScreenWidth(41),
                                height: 100,
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "الكل",
                                    'مواد خام',
                                    'منتج التشغيل',
                                    "منتج تام",
                                  ],
                                  selectTalab: chose,
                                  onchanged: () => (val) {
                                    setState(() {
                                      chose = val;
                                      if (chose == 'الكل') {
                                        chose = null;
                                      }

                                      performSearch(
                                          searchWord?.toCapitalized() ?? '',
                                          chose == 'الكل'
                                              ? chose = null
                                              : chose,
                                          production?.toCapitalized() ?? '');
                                    });
                                  },
                                  label: 'نوع الصنف',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'بحث',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller2,
                                      perFix: const Icon(Icons.search),
                                      hint: '',
                                      label: '',
                                      onChanged: (v) {
                                        setState(() {
                                          searchWord = v;
                                          performSearch(
                                              searchWord?.toCapitalized() ?? '',
                                              chose == 'الكل'
                                                  ? chose = null
                                                  : chose,
                                              production?.toCapitalized() ??
                                                  '');
                                          // ordersNumber = dataId.length;
                                          if (production == null &&
                                              searchWord == null &&
                                              chose == 'الكل') {
                                            dataId = dbDataId;
                                          }
                                        });
                                      },
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
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 90,
                          ),
                          FutureBuilder(
                              future: pro.getMaterials(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List categoryData = snapshot.data as List;
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 85),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: List.generate(
                                              dataId.take(ordersNumber).length,
                                              (index) => Column(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              getProportionateScreenWidth(
                                                                  41),
                                                          child: dropDown(
                                                            const [
                                                              'تفاصيل',
                                                              'تاكيد طلب شراء',
                                                              'تعديل الصنف',
                                                              'تعديل الرصيد'
                                                            ],
                                                            selectTalab: index ==
                                                                    selectedIndex
                                                                ? chose1
                                                                : chose2,
                                                            onchanged: () =>
                                                                (val) {
                                                              setState(() {
                                                                selectedIndex =
                                                                    index;
                                                                chose1 = val;
                                                              });
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
                                                        height: 7,
                                                      )
                                                    ],
                                                  )),
                                        ),
                                      ),
                                      DefaultTable(
                                        columnData: columnData,
                                        size: MediaQuery.of(context)
                                                    .size
                                                    .width <=
                                                500
                                            ? getProportionateScreenWidth(8)
                                            : getProportionateScreenWidth(10),
                                        color: ColorManager.second,
                                        rows: dataId
                                            .take(ordersNumber)
                                            .map((data) => DataRow(cells: [
                                                  DataCell(Image.asset(
                                                    ImageAssets.iconDropDown23,
                                                    width: 30,
                                                    height: 30,
                                                  )),
                                                  DataCell(Text(
                                                    '${result[data]!['openingbalance'] * result[data]!['price']}',
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    '',
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    result[data]![
                                                            'openingbalance']
                                                        .toString(),
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    result[data]![
                                                        'productionline'],
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    result[data]![
                                                        'measurement'],
                                                    style: style,
                                                  )),
                                                  DataCell(
                                                    SizedBox(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              30),
                                                      child: Text(
                                                          result[data]!['type'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 3,
                                                          style: style),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    SizedBox(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              30),
                                                      child: Text(
                                                          result[data]!['name'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 3,
                                                          style: style),
                                                    ),
                                                  ),
                                                ]))
                                            .toList(),
                                      ),
                                    ],
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 40),
                                    decoration: BoxDecoration(
                                      color: ordersNumber < dataId.length
                                          ? Color(0xff82225E)
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      child: Text(
                                        'المزيد',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (ordersNumber < dataId.length) {
                                            ordersNumber = ordersNumber + 10;
                                          }
                                        });
                                      },
                                    )),
                              ),
                              ordersNumber > 25
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 40),
                                          decoration: BoxDecoration(
                                            color: ordersNumber < dataId.length
                                                ? Color(0xff82225E)
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: TextButton(
                                            child: Text(
                                              'اقل',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                ordersNumber =
                                                    ordersNumber - 10;
                                              });
                                            },
                                          )),
                                    )
                                  : SizedBox(),
                            ],
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



//  int pagesNumber =
//                                             dataIdUnPaginated.length <
//                                                     ordersNumber + 25
//                                                 ? dataIdUnPaginated.length
//                                                 : ordersNumber + 25;
//                                         setState(() {
//                                           dataId = [];
//                                           for (var i = ordersNumber;
//                                               i < pagesNumber;
//                                               i++) {
//                                             dataId.add(dataIdUnPaginated[i]);
//                                           }

//                                           ordersNumber = ordersNumber + 25;