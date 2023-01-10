import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';

class SupPay extends StatefulWidget {
  const SupPay({Key? key}) : super(key: key);

  @override
  State<SupPay> createState() => _SupPayState();
}

class _SupPayState extends State<SupPay> {
  DateTime now = DateTime.now();
  String? chose;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));

    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  DefaultContainer(title: 'سداد المورد اسلام'),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: getProportionateScreenWidth(60),
                        height: 80,
                        padding: const EdgeInsets.only(top: 35),
                        child: dropDown(
                          const [
                            'خزينه المصنع',
                            'البنك الاهلي',
                            "فودافون كاش",
                            "بنك مصر"
                          ],
                          selectTalab: chose,
                          onchanged: () => (val) {
                            setState(() {
                              chose = val;
                            });
                          },
                          label: 'الخزينه',
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
                            'المبلغ المدفوع',
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                              color: ColorManager.primary,
                              obscureText: false,
                            ),
                          ),
                          Text(
                            'رصيد بعد',
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'الرصيد قبل',
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: getProportionateScreenWidth(70),
                    height: getProportionateScreenHeight(193),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Botton(
                    color: ColorManager.white,
                    title: 'دفع',
                    onTap: () {},
                    bgColor: ColorManager.black,
                  ),
                ],
              ),
            ),
            const DefaultRow(),
          ],
        ),
      ),
    ));
  }
}
