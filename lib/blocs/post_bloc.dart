import 'dart:ffi';
import 'package:stream_transform/stream_transform.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration){
  return (event, mapper){
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}