import 'package:flutter/material.dart';
import 'package:login_page/core/viewmodels/home_model.dart';
import 'package:login_page/ui/shared/globals.dart';
import 'package:login_page/ui/widgets/button_widget.dart';
import 'package:login_page/ui/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final model = Provider.of<HomeModel>(context);
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[

          Container(
            height: keyboardOpen ? 75 : 250,
            color: Global.mediumBlue,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    color: Global.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),

                TextFieldWidget(
                  hintText: 'Email',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: model.isValid ? Icons.check : null,
                  onChanged: (value) {
                    model.isValidEmail(value);
                  },
                ),

                SizedBox(
                  height: 10.0,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget> [
                    TextFieldWidget(
                      hintText: 'Password',
                      obscureText: model.isVisible ? false : true,
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: model.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    SizedBox(
                      height: 10.0,
                    ),

                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Global.mediumBlue,
                      ),
                    )
                  ]
                ),

                SizedBox(
                  height: 10.0,
                ),

                ButtonWidget(
                  title: 'Login',
                  hasBorder: false,
                ),

                SizedBox(
                  height: 10.0,
                ),

                ButtonWidget(
                  title: 'Sign Up',
                  hasBorder: true,
                ),

                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
