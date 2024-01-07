import 'package:flutter/material.dart';
import 'package:flutter_ui/ui_catalog/CartModel.dart';
import 'package:flutter_ui/ui_catalog/MyCatalog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: MyCatalog(),
      )
  );
}
