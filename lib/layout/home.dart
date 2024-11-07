import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/business_screen.dart';
import '../modules/science_screen.dart';
import '../modules/search.dart';
import '../modules/sport_screen.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, AppStates state) {},
        builder: (context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          var darkMode=AppCubit.get(context).isDark;
          return DefaultTabController(
            length: 6,
            child: Scaffold(
              appBar: AppBar(
                title: Text('News App'),
                actions: [

                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                      icon: Icon(Icons.search,size: 30,)),
                  IconButton(
                      onPressed: () {
                        AppCubit.get(context).checkDarkMode();
                      },
                      icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color:Colors.grey[300],
                              borderRadius: BorderRadius.circular(40)),
                          child: Icon(Icons.dark_mode_rounded,color: darkMode? Colors.black:Colors.grey,))),

                ],
                bottom: TabBar(
                  isScrollable: true,
                  physics: BouncingScrollPhysics(),
                  tabs: [
                    Tab(
                      child: Text('Business'),
                    ),
                    Tab(
                      child: Text('Science'),
                    ),
                    Tab(
                      child: Text('Entertainment'),
                    ),
                    Tab(
                      child: Text('Health'),
                    ),
                    Tab(
                      child: Text('Science'),
                    ),
                    Tab(
                      child: Text('Technology'),
                    ),
                  ],
                ),

              ),
              body: TabBarView(
                children: [
                  BusinessScreen(),
                  BusinessScreen(),
                  ScienceScreen(),
                  SportScreen(),
                  ScienceScreen(),
                  SportScreen(),
                ],
              ),
            ),
          );
        });
  }
}
