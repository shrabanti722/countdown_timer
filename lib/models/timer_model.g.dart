// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerModelImpl _$$TimerModelImplFromJson(Map<String, dynamic> json) =>
    _$TimerModelImpl(
      minutes: (json['minutes'] as num).toInt(),
      seconds: (json['seconds'] as num).toInt(),
      isRunning: json['isRunning'] as bool? ?? false,
    );

Map<String, dynamic> _$$TimerModelImplToJson(_$TimerModelImpl instance) =>
    <String, dynamic>{
      'minutes': instance.minutes,
      'seconds': instance.seconds,
      'isRunning': instance.isRunning,
    };
