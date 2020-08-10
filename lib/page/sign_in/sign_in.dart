import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/api/apis.dart';
import 'package:newsflutter/common/api/user.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/router/router.gr.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/colors.dart';
import 'package:newsflutter/common/values/values.dart';
import 'package:newsflutter/common/widgets/widgets.dart';
import 'package:newsflutter/global.dart';

/// 创建时间：2020/8/1
/// 作者：zhangjie
/// 描述：

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _handleSignIn() async {
//    if (Validator.isEmail(_emailController.value.text)) {
//      toastInfo(msg: "邮箱格式错误");
//      return;
//    }
//
//    if (Validator.checkStringLength(_passwordController.value.text, 6)) {
//      toastInfo(msg: "密码长度不能少于6位");
//      return;
//    }

    UserRequestEntity params = UserRequestEntity(
      account: _emailController.value.text,
      secret: _passwordController.value.text,
    );

    UserResponseEntity response =
        await UserApi.login(params: params, context: context);
    Global.saveProfile(response);
    // Navigator.pushNamed(context, "/application");
    ExtendedNavigator.root.pushNamed(Routes.application);
  }

  _handleSignUp() async {
    Navigator.pushNamed(context, "/application");
//    var data = await NewsAPI.getTags(context: context);
//    print(data);
  }

  Widget _buildLogo() {
    return Container(
      width: setWidth(110),
      margin: EdgeInsets.only(top: setHeight(40.0 + 44)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: setWidth(76),
            width: setWidth(76),
            margin: EdgeInsets.symmetric(horizontal: setWidth(15)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: setWidth(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackgroud,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(76 * 0.5)),
                    ),
                    // child: Container(),
                  ),
                ),
                Positioned(
                  top: setWidth(13),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: setHeight(15)),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: CustomFont.Montserrat,
                fontWeight: FontWeight.w600,
                fontSize: setFont(24),
                height: 1,
              ),
            ),
          ),
          Container(
            child: Text(
              "news",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: CustomFont.Avenir,
                fontWeight: FontWeight.w400,
                fontSize: setFont(16),
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputForm() {
    return Container(
      width: setWidth(295),
      margin: EdgeInsets.only(top: setHeight(49)),
      child: Column(
        children: [
          inputTextEdit(
            controller: _emailController,
            hintText: 'Email',
            marginTop: 0,
            keyboardType: TextInputType.emailAddress,
          ),
          inputTextEdit(
            controller: _passwordController,
            hintText: 'Passowrd',
            keyboardType: TextInputType.emailAddress,
            isPassword: true,
          ),
          Container(
            height: setHeight(44),
            margin: EdgeInsets.only(top: setHeight(15)),
            child: Row(
              children: [
                flatButtonWidget(
                    onPressed: _handleSignUp,
                    bgColor: AppColors.thirdElement,
                    title: "Sign up"),
                Spacer(),
                flatButtonWidget(
                  onPressed: _handleSignIn,
                  bgColor: AppColors.primaryElement,
                  title: "Sign in",
                ),
              ],
            ),
          ),
          Container(
            height: setHeight(22),
            margin: EdgeInsets.only(top: setHeight(20)),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Forget password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: CustomFont.Avenir,
                  fontWeight: FontWeight.w400,
                  fontSize: setFont(16),
                  height: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildThirdPartyLogin() {
    return Container(
      width: setWidth(294),
      margin: EdgeInsets.only(bottom: setHeight(40)),
      child: Column(
        children: [
          Container(
            child: Text(
              "Or sign in with social networks",
              style: TextStyle(
                fontSize: setFont(16),
                fontFamily: CustomFont.Avenir,
                height: 1.2,
                color: AppColors.primaryText,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: setHeight(20)),
            child: Row(
              children: [
                flatButtonBorderOnlyWidget(
                    onPressed: () {}, iconFileName: "twitter", width: 88),
                Spacer(),
                flatButtonBorderOnlyWidget(
                    onPressed: () {}, iconFileName: "google", width: 88),
                Spacer(),
                flatButtonBorderOnlyWidget(
                    onPressed: () {}, iconFileName: "facebook", width: 88),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      margin: EdgeInsets.only(bottom: setHeight(20)),
      child: flatButtonWidget(
        onPressed: _handleSignUp,
        width: 294,
        bgColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }
}
