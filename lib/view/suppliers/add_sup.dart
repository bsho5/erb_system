import 'package:erb_system/controller/suppliers/add_suppliers.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddSup extends StatefulWidget {
  const AddSup({Key? key}) : super(key: key);

  @override
  State<AddSup> createState() => _AddSupState();
}

class _AddSupState extends State<AddSup> {
  DateTime now = DateTime.now();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var pro = Provider.of<AddSuppliersController>(context);
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                'العنوان',
                                style:
                                    getSemiBoldStyle(color: ColorManager.black),
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
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                'فئه المورد',
                                style:
                                    getSemiBoldStyle(color: ColorManager.black),
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
                                  onSave: () {},
                                  passFun: () {},
                                  color: Colors.white70,
                                  obscureText: false,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                'الاسم',
                                style:
                                    getSemiBoldStyle(color: ColorManager.black),
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
                              )
                            ],
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(50),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                'تقييم السعر',
                                style:
                                    getSemiBoldStyle(color: ColorManager.black),
                              ),
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
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                'تقييم المورد',
                                style:
                                    getSemiBoldStyle(color: ColorManager.black),
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
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                'رقم الهاتف',
                                style:
                                    getSemiBoldStyle(color: ColorManager.black),
                              ),
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
                              )
                            ],
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(50),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      Botton(
                        color: ColorManager.white,
                        title: 'اضافه',
                        onTap: () {
                          pro.addSupplier(
                              controller1.text,
                              controller2.text,
                              controller3.text,
                              controller6.text,
                              double.parse(controller4.text),
                              double.parse(controller5.text));
                          controller1.clear();
                          controller2.clear();
                          controller3.clear();
                          controller6.clear();
                          controller4.clear();
                          controller5.clear();
                        },
                        bgColor: ColorManager.black,
                      ),
                    ],
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
    )));
  }
}
