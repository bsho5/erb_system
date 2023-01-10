import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:flutter/material.dart';

class ConfirmPurchase extends StatelessWidget {
  ConfirmPurchase({Key? key}) : super(key: key);
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                DefaultContainer(
                  title: 'تاكيد استلام مشتريات',
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'اجمالي الفاتوره',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: getProportionateScreenWidth(5)),
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
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'الكميه المطلوبه',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: getProportionateScreenWidth(5)),
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
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'اسم المورد',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: getProportionateScreenWidth(5)),
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
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'المبلغ المستحق',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: getProportionateScreenWidth(5)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(60),
                          height: 60,
                          child: DefaultInputForm(
                            controller: controller4,
                            hint: '',
                            label: '',
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
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'الكميه المستلمه',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: getProportionateScreenWidth(5)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(60),
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
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Botton(
                  color: ColorManager.white,
                  title: 'تاكيد استيلام',
                  onTap: () {},
                  bgColor: ColorManager.black,
                ),
              ],
            ),
          ),
          DefaultRow(),
        ],
      ),
    );
  }
}
