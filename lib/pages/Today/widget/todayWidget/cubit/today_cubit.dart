import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'today_state.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit()
      : super(Today(
            color: Colors.black,
            iconChange: Icon(Icons.arrow_drop_down_circle)));

  void changeColor() {
    if (state.color == Colors.black) {
      print("geldi");
      emit(Today(color: Colors.black, iconChange: Icon(Icons.abc)));
    } else {
      print("anan");
      emit(Today(
          color: Colors.black, iconChange: Icon(Icons.arrow_drop_down_circle)));
    }
  }
}
