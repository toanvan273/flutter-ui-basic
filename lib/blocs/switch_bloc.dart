import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/events/switch_event.dart';
import 'package:flutter_ui/states/switch_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState>{
  SwitchBloc():super(SwitchInitial(switchValue: false)){
    on<SwitchOnEvent>((event, emit){
      emit(SwitchState(switchValue: true));
    });
    on<SwitchOffEvent>((event, emit){
      emit(SwitchState(switchValue: false));
    });
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }

}