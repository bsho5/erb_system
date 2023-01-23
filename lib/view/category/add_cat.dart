import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCat extends StatefulWidget {
  AddCat(
      {Key? key,
      this.name,
      this.price,
      this.firstPrice,
      this.minLimit,
      this.type,
      this.measurement,
      this.productionBranch,
      this.isEdit = true,
      this.isPriceEdit = true,
      this.isCatEdit = true,
      this.isDetails = false,
      this.isFromAnotherPage = false})
      : super(key: key);

  final String? name;
  final String? price;
  final String? firstPrice;
  final String? minLimit;
  final String? type;
  final String? measurement;
  final String? productionBranch;
  bool isEdit;
  bool isPriceEdit;
  bool isCatEdit;
  bool isFromAnotherPage;
  bool isDetails;
  @override
  State<AddCat> createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> {
  DateTime now = DateTime.now();
  String? chose1;
  String? chose2;
  String? chose3;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chose1 = widget.measurement;
    chose2 = widget.type;
    chose3 = widget.productionBranch;
    controller1.text = widget.name ?? '';
    controller2.text = widget.minLimit ?? '';
    controller3.text = widget.firstPrice ?? '';
    controller4.text = widget.price ?? '';
    print(widget.isPriceEdit);
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          DefaultContainer(title: 'اضافة صنف'),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                          'ارفاق ايصال الدفع',
                                          style: style,
                                        ),
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                              ImageAssets.iconDropDown20,
                                              width:
                                                  getProportionateScreenWidth(
                                                      35),
                                              height:
                                                  getProportionateScreenHeight(
                                                      85),
                                            ))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              Container(
                                width: getProportionateScreenWidth(40),
                                height: 80,
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const ['كيلو', 'متر', "قطعه", "لوح"],
                                  selectTalab: chose1,
                                  onchanged: widget.isEdit == false
                                      ? () {}
                                      : () => (val) {
                                            setState(() {
                                              chose1 = val;
                                            });
                                          },
                                  label: 'وحده القياس',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                width: getProportionateScreenWidth(40),
                                height: 80,
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    'مواد خام',
                                    'منتج التشغيل',
                                    'مخزن منتج تام'
                                  ],
                                  selectTalab: chose2,
                                  onchanged: widget.isEdit == false
                                      ? () {}
                                      : () => (val) {
                                            setState(() {
                                              chose2 = val;
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
                                    'الاسم',
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
                                      readOnly: !widget.isCatEdit,
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
                                width: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'الحد الادني للمخزون',
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
                                      readOnly: !widget.isEdit,
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
                                width: 50,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'الرصيد الافتتاحي',
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
                                      controller: controller3,
                                      readOnly: !widget.isPriceEdit,
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
                                width: 50,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'السعر',
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
                                      controller: controller4,
                                      readOnly: !widget.isEdit,
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
                                width: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: getProportionateScreenWidth(40),
                                height: 80,
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    'مفروشات',
                                    'منتجات شاطئ',
                                    "اثاث",
                                    "ديكور"
                                  ],
                                  selectTalab: chose3,
                                  onchanged: widget.isEdit == false
                                      ? () {}
                                      : () => (val) {
                                            setState(() {
                                              chose3 = val;
                                            });
                                          },
                                  label: 'فرع الانتاج',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          widget.isDetails == true
                              ? SizedBox()
                              : Botton(
                                  color: ColorManager.white,
                                  title: 
                                          widget.isFromAnotherPage
                                      ? 'تعديل'
                                      : 'اضافه',
                                  onTap: () {
                                    pro.addMaterial(
                                        '',
                                        chose1!,
                                        int.parse(controller2.text),
                                        chose2!,
                                        controller1.text,
                                        int.parse(controller3.text),
                                        double.parse(controller4.text),
                                        chose3!,
                                        0);
                                  },
                                  bgColor: ColorManager.black,
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
