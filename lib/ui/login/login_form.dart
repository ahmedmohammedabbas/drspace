import 'dart:convert';

import 'package:drspace/bloc/LoginBloc/login_block.dart';
import 'package:drspace/bloc/LoginBloc/login_event.dart';
import 'package:drspace/bloc/LoginBloc/login_state.dart';
import 'package:drspace/model/auth.dart';
import 'package:drspace/services/connection.dart';
import 'package:drspace/ui/components/custom_surfix_icon.dart';
import 'package:drspace/ui/components/default_button.dart';
import 'package:drspace/ui/components/form_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password="";
  Connection conn =new Connection() ;

  final List<String> errors = [];


  bool isLoading  = false ;


  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed () {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _loginBloc.add(LoginInWithEmailButtonPressed(
            email: email,
            password: password
        ));
      }else {
        setState(() {
       //   _autoValidate = true;
        });
      }
    }


    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state){
          if (state is LoginFailure){
       //     print(state.errorMassage);
            _showError(state.error);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state){
             if (state is LoginSuccess){
               return Center(
                  child: Text("Welcome: "+ state.authResponse.data!.name,style:TextStyle(fontSize: 16),),
                );
              }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          state is LoginLoading? CircularProgressIndicator(color:kPrimaryColor) :  DefaultButton(
            text:  "دخول",
            press:state is LoginLoading ? () {} : _onLoginButtonPressed,
          ),
        ],
      ),
    );
            },
        ),
    );
  }
  TextFormField buildPasswordFormField() {
    return TextFormField(
      textAlign: TextAlign.right,
      obscureText: true,
      onSaved: (newValue) => password = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 4) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value == null || value == "") {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText:  "كلمة المرور",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }
  TextFormField buildEmailFormField() {
    return TextFormField(
textAlign: TextAlign.right,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {

          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {

          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value == null || value == "") {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },

      decoration: InputDecoration(



        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        hintText:  "رقم الجوال او البريد الاليكتروني",
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/user.svg"),
      ),
    );
  }
  void _showError(String error) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Theme.of(context).errorColor,
        )
    );
  }
}
