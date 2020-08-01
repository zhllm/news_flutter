import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/colors.dart';
import 'package:newsflutter/common/values/fonts.dart';
import 'package:newsflutter/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  _handleSignIn() {
    if (!Validator.isEmail(_emailController.value.text)) {
      toastInfo(msg: "邮箱格式错误");
      return;
    }

    if (!Validator.checkStringLength(_passwordController.value.text, 6)) {
      toastInfo(msg: "密码长度不能少于6位");
      return;
    }
  }

  _handleSignUp() {
    Navigator.pushNamed(context, "/sign-up");
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: setHeight(50)),
      child: Text(
        "Sign up",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: CustomFont.Montserrat,
          fontWeight: FontWeight.w600,
          fontSize: setFont(24),
          height: 1,
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      width: setWidth(295),
      margin: EdgeInsets.only(top: setHeight(49)),
      child: Column(
        children: [
          inputTextEdit(
            controller: _fullNameController,
            hintText: 'Full name',
            keyboardType: TextInputType.emailAddress,
          ),
          inputTextEdit(
            controller: _emailController,
            hintText: 'Email',
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
            width: setWidth(294),
            margin: EdgeInsets.only(top: setHeight(15)),
            child: flatButtonWidget(
              onPressed: _handleSignIn,
              bgColor: AppColors.primaryElement,
              title: "Create an account",
            ),
          ),
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
        onPressed: () {
          Navigator.pop(context);
        },
        width: 294,
        bgColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "I have an account",
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '这是注册页面');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Divider(
              height: 1,
            ),
            _buildLogo(),
            _buildForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }
}
