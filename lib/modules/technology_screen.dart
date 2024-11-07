import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/component.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class TechnologyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var  list=AppCubit.get(context).technology;
        return list.length>0?BuildListOfArticle(list,context):Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
