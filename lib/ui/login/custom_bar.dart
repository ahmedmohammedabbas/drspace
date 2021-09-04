import 'package:drspace/constants.dart';
import 'package:drspace/size_config.dart';
import 'package:flutter/material.dart';
class CustomBarWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(  gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                kPrimaryColor,
                kPrimaryLightColor
              ],
            ),),
            width: MediaQuery.of(context).size.width,
            height: 151.5,
            child: Center(
              child: Text(
                "تسجيل الدخول",
                style: TextStyle(color: Colors.white, fontSize: getProportionateScreenWidth(18.0)),
              ),
            ),
          ),
          Positioned(
            top: 108.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30)
                        ,topRight: Radius.circular(30)
                    ),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5), width: 1.0),
                    color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(

                          width: 50,height: 80,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30)
                                  ,topRight: Radius.circular(30)
                              )),

                        )
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
