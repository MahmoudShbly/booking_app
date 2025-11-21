import 'package:booking_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(top: 42.0,right: 10.0,left: 10.0,bottom: 16),
          child: Row(
            children: <Widget>[
              InkWell(child: Icon(Icons.arrow_back,size: 32,),onTap: ()=>Navigator.pop(context),),
              Spacer(),
              Text('عيادة الرضوان',style: Styles.textStyle26,),
              Spacer(),
            ],
          ),
        );
  }
}