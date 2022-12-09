import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


class SettingCubit extends Cubit<SettingState>{
  SettingCubit(): super(SettingState(theme: ThemeData.light()));

  void toogleTheme(){
    if(state.theme == ThemeData.light()){
      //final stateUpdate = SettingState(theme: ThemeData.dark());
      emit(SettingState(theme: ThemeData.dark()));
    }
    else{
      //final stateUpdate = SettingState(theme: ThemeData.light());
      emit(SettingState(theme: ThemeData.light()));
    }
  }
}

class SettingState{
  ThemeData theme;
  SettingState({
    required this.theme
  });
}