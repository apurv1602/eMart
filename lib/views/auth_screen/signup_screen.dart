import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/auth_controller.dart';
import 'package:emart/views/home_screen/home.dart';
import 'package:emart/widgets_common/applogo_widget.dart';
import 'package:emart/widgets_common/bg_widget.dart';
import 'package:emart/widgets_common/custom_textfield.dart';
import 'package:emart/widgets_common/our_button.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController passField = TextEditingController();

  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Signup to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Column(
              children: [
                customTextField(
                    hint: namehint, title: name, controller: nameField),
                customTextField(
                    hint: emailHint, title: email, controller: emailField),
                customTextField(
                    hint: passwordHint, title: password, controller: passField),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: forgetPass.text.make(),
                  ),
                ),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                      activeColor: redColor,
                      checkColor: whiteColor,
                      value: isCheck,
                      onChanged: (newValue) {
                        setState(() {
                          isCheck = newValue;
                        });
                      },
                    ),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "I agreeto the ",
                              style: TextStyle(
                                  fontFamily: regular, color: fontGrey),
                            ),
                            TextSpan(
                              text: terms,
                              style: TextStyle(
                                  fontFamily: regular, color: redColor),
                            ),
                            TextSpan(
                              text: " & ",
                              style: TextStyle(fontFamily: regular),
                            ),
                            TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                  fontFamily: regular, color: redColor),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                5.heightBox,
                ourButton(
                    color: isCheck == true ? redColor : lightGrey,
                    label: signup,
                    textColor: whiteColor,
                    onPress: () async {
                      await authController
                          .userSignUp(
                              email: emailField.text, pass: passField.text)
                          .then((value) async {
                        if (value != null) {
                          await authController.storeUserData(
                              email: emailField.text,
                              pass: passField.text,
                              name: nameField.text);
                          Get.offAll(() => Home());
                        }
                      });
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyHaveAccount,
                        style: TextStyle(fontFamily: bold, color: fontGrey),
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(fontFamily: bold, color: redColor),
                      ),
                    ],
                  ),
                ).onTap(() {
                  Get.back();
                })
              ],
            )
                .box
                .white
                .rounded
                .shadowSm
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .make(),
          ],
        )),
      ),
    );
  }
}
