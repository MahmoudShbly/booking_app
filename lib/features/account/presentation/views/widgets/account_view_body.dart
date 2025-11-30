import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBarComponent(myWidget: Text('حسابي',style: Styles.textStyle40,)),
        SliverToBoxAdapter(
       child: Column(
        
            children: <Widget>[
              const SizedBox(
          height: 30,
        ),
              CircleAvatar(radius: 70,),
            const  SizedBox(
                height: 10,
              ),
               Text('سامي طليمات',style: Styles.textStyle26,),

               const SizedBox(
                 height: 10,
               ),
                Text('sami.tolaimat@gmail.com',style: Styles.textStyle16,),
                const SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(FontAwesomeIcons.locationDot,
                          color: Color(0xffCD1111), size: 16),
                      SizedBox(width: 6),
                      Text(
                        'حمص ',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),

            ],
          )
        )
      ],
    );
  }
}
