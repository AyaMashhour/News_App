import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/state.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController? searchTextController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = AppCubit.get(context).search;
        var darkMode = AppCubit.get(context).isDark;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconTheme: darkMode
                ? IconThemeData(color: Colors.white)
                : IconThemeData(color: Colors.black),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextFormField(
                  style: darkMode
                      ? TextStyle(color: Colors.white, fontSize: 18)
                      : TextStyle(color: Colors.black, fontSize: 18),
                  controller: searchTextController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: darkMode ? Colors.white : Colors.black,
                      size: 25,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter a search term',
                  ),
                  onChanged: (String value) {
                    AppCubit.get(context).getDataForSearch(value);
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                state is SearchLoadingState?
                Center(child: CircularProgressIndicator( color: Colors.pink,),)  :
                Expanded(child: BuildListOfArticle(list, context))
              ],
            ),
          ),
        );
      },
    );
  }
}
