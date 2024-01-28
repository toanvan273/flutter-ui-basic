import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui/services/app_router.dart';
import 'package:flutter_ui/view/todo_v2/main_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(MyTasksApp(appRouter: AppRouter(),));
}
