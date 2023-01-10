import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';

class HomeTap extends StatefulWidget {
  HomeTap({Key? key}) : super(key: key);

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  String? chose1;
  String? chose2;
  int? selectedIndex;
  List<String> title = [
    'المشتريات',
    'المصروفات',
    'الطلبات',
    'حساب المندوبين \nوشركات الشحن',
    'تقرير المخزون',
    'الاشعارات',
  ];

  List<String> image = [
    ImageAssets.iconDropDown7,
    ImageAssets.iconDropDown17,
    ImageAssets.iconDropDown16,
    ImageAssets.iconDropDown6,
    ImageAssets.iconDropDown3,
    ImageAssets.iconDropDown52,
  ];

  List data = [
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": false
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": false
    },
  ];

  List<String> columnData = [
    "تاريخ الاستيلام",
    "وحده القياس",
    "الكميه",
    "الصنف",
  ];

  List<String> columnData1 = [
    "المبالغ المستحقه",
    "عدد الطلبات",
    "الفئه",
    "اسم الشركة او المندوب",
  ];
  List<String> columnData2 = [
    "المطلوب للطلبات",
    "وحده القياس",
    "الحد الادني",
    "الكميه المتاحه",
    "النوع",
    "الصنف",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            DefaultContainer(
              title: "الصفحه الرئيسيه",
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 660,
              height: 400,
              child: GridView.count(
                childAspectRatio: 1.3,
                crossAxisCount: 3,
                crossAxisSpacing: 50,
                mainAxisSpacing: 50,
                padding: const EdgeInsets.all(10.0),
                children: List.generate(
                    title.length,
                        (index) => InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              title[index],
                              style: TextStyle(
                                  fontSize:
                                  MediaQuery.of(context).size.width <=
                                      500
                                      ? getProportionateScreenWidth(8)
                                      : getProportionateScreenWidth(5),
                                  color: Colors.white),
                            ),
                            Image.asset(image[index],
                                width:
                                MediaQuery.of(context).size.width <= 600
                                    ? getProportionateScreenWidth(40)
                                    : getProportionateScreenWidth(80),
                                height:
                                MediaQuery.of(context).size.width <= 600
                                    ? getProportionateScreenHeight(40)
                                    : getProportionateScreenHeight(80))
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            DefaultContainer(title: ' استلام الخامات'),
            const SizedBox(
              height: 30,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                              MediaQuery.of(context).size.width <= 776
                                  ? const EdgeInsets.only(
                                  top: 10, bottom: 15)
                                  : const EdgeInsets.only(top: 5),
                              child: DefaultBotton(
                                top:
                                MediaQuery.of(context).size.width <= 500
                                    ? getProportionateScreenWidth(8)
                                    : getProportionateScreenWidth(3),
                                right: getProportionateScreenWidth(3),
                                title: 'تفاصيل',
                                color: ColorManager.white,
                                onTap: () {},
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                DefaultTable(
                  columnData: columnData,
                  size: getProportionateScreenWidth(10),
                  color: ColorManager.second,
                  rows: data
                      .map((data) => DataRow(cells: [
                    DataCell(Text(
                      data['first_name'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['last_name'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['email'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['phone'],
                      style: style,
                    )),
                  ]))
                      .toList(),
                ),
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
            const SizedBox(
              height: 30,
            ),
            DefaultContainer(title: "تنبيهات الحد الادني للمخزون"),
            const SizedBox(
              height: 30,
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
                                width: MediaQuery.of(context).size.width <=
                                    1207
                                    ? getProportionateScreenWidth(70)
                                    : getProportionateScreenWidth(50),
                                child: dropDown(
                                  const [
                                    'تاكيد امر الشراء',
                                    'ارسال اشعار عند الاستلام'
                                  ],
                                  selectTalab: index == selectedIndex
                                      ? chose1
                                      : chose2,
                                  onchanged: () => (val) {
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
                  columnData: columnData2,
                  size: getProportionateScreenWidth(3),
                  color: ColorManager.second,
                  rows: data
                      .map((data) => DataRow(cells: [
                    DataCell(Text(
                      data['first_name'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['last_name'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['email'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['phone'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['phone'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['phone'],
                      style: style,
                    )),
                  ]))
                      .toList(),
                ),
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
            const SizedBox(
              height: 30,
            ),
            DefaultContainer(title: "حساب المندوبين وشركات الشحن"),
            const SizedBox(
              height: 30,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: DefaultBotton(
                                top:
                                MediaQuery.of(context).size.width <= 500
                                    ? getProportionateScreenWidth(8)
                                    : getProportionateScreenWidth(3),
                                right: getProportionateScreenWidth(3),
                                title: 'تفاصيل',
                                color: ColorManager.white,
                                onTap: () {},
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                DefaultTable(
                  columnData: columnData1,
                  size: getProportionateScreenWidth(10),
                  color: ColorManager.second,
                  rows: data
                      .map((data) => DataRow(cells: [
                    DataCell(Text(
                      data['cost'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['Quantity'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['last_name'],
                      style: style,
                    )),
                    DataCell(Text(
                      data['first_name'],
                      style: style,
                    )),
                  ]))
                      .toList(),
                ),
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
    );
  }
}