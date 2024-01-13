import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/ui_catalog/MyCatalog.dart';
import 'package:flutter_ui/ui_catalog/drink_bloc.dart';


void main() {
  runApp(
      BlocProvider(
        create: (c)=> DrinkBloc(),
        child: MyCatalog(),
      )
  );
}
