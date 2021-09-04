
import 'package:drspace/bloc/LoginBloc/login_block.dart';
import 'package:drspace/constants.dart';
import 'package:drspace/size_config.dart';
import 'package:drspace/ui/login/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'login_form.dart';




class LoginPage extends StatelessWidget {

  static String routeName = "/login";
  SizeConfig sizeConfig = new SizeConfig() ;

  @override
  Widget build(BuildContext context) {

    sizeConfig.init(context);
    return BlocProvider(create:(_)=> LoginBloc(),child:  Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Column(
      mainAxisAlignment: MainAxisAlignment.start
      ,children: [
        CustomBarWidget(),
        Padding(padding:   EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)) ,child:
        Column(
        mainAxisAlignment: MainAxisAlignment.center
        ,children: [
          SizedBox(height: getProportionateScreenHeight(30.0),),
          SvgPicture.asset(
            "assets/icons/logo.svg",
            color: kPrimaryColor,
            width: 150,
            height: 150,

          ),
          SizedBox(height: getProportionateScreenHeight(10.0),),
          SignForm(),
          SizedBox(height: getProportionateScreenHeight(10.0),),
          InkWell(
            child:Text("الشروط و الاحكام" , style: TextStyle(fontWeight: FontWeight.bold ,color: Color(0XFF2E2E2E)),)
            ,onTap: (){},)

        ],) ,)

      ],),)
    ),);
  }
}
