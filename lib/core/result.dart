import 'dart:io';

import 'package:equatable/equatable.dart';

enum Status { success, failure }

class Result<D> extends Equatable {
  final Status status;
  final D? data;
  final HttpException? failure;

  const Result._({required this.status, this.data, this.failure});

  factory Result.success({
    D? data,
  }) {
    return Result._(
      status: Status.success,
      data: data,
    );
  }

  factory Result.fail({
    required HttpException failure,
  }) {
    return Result._(
      status: Status.failure,
      failure: failure,
    );
  }

  bool isSuccess() => status == Status.success;

  bool isFail() => status == Status.failure;

  @override
  List<Object?> get props => <Object?>[
    status,
    data,
    failure,
  ];
}
