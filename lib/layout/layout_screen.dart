import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search.dart';
import 'package:news_app/shared/network/dio_helper.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, AppStates state) {},
        builder: (context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(

            appBar: AppBar(
           
              title: Text('News App'),
              actions: [
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()
               ));
                }, icon: Icon(Icons.search)),

                IconButton(onPressed: () {
                  AppCubit.get(context).checkDarkMode();
                }, icon: Icon(Icons.brightness_4_outlined))

              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: cubit.screens[cubit.currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.listBottom,
            ),
          );
        });
  }
}
