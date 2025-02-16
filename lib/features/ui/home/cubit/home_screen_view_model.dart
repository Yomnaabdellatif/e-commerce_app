import 'package:ecommerce_app/features/ui/home/cubit/home_screen_states.dart';
import 'package:ecommerce_app/features/ui/home/tabs/favorite_tab/favorite_tab.dart';
import 'package:ecommerce_app/features/ui/home/tabs/home_tab/home_tab.dart';
import 'package:ecommerce_app/features/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../tabs/product_tab/product_tab.dart';
@injectable
class HomeScreenViewModel extends Cubit<HomeStates> {
  HomeScreenViewModel():super(InitialHomeState());
  int selectedIndex=0;

  List<Widget> appTabs = [
    HomeTab(),
    ProductTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  void changeSelectedIndex(int index){
    selectedIndex=index;
    emit(ChangeTabIndexHomeState());
  }

}