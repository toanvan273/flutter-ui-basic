import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{
  final bool switchValue;
  const SwitchState({required this.switchValue});
  @override
  List<Object?> get props => [switchValue];

  factory SwitchState.fromJson(Map<String, dynamic> json) {
    return SwitchState(
      switchValue: json["switchValue"].toLowerCase() == 'true',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'switchValue': switchValue,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      switchValue: map['switchValue'] ?? false,
    );
  }

}

class SwitchInitial extends SwitchState{

  SwitchInitial({required bool switchValue}):super(switchValue: switchValue);
}