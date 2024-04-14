import 'package:equatable/equatable.dart';

class BaseResponse<T> extends Equatable {
  final String status;
  final T data;
  final String? message;

  const BaseResponse({
    required this.status,
    required this.data,
    this.message,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic json) fromJson) {
    return BaseResponse(
      status: json['status'] ?? '',
      data: fromJson(json['data'] ?? {}),
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T data) toJson) {
    return {
      'status': status,
      'data': toJson(data),
      'message': message,
    };
  }

  @override
  String toString() {
    return 'BaseResponse{status: $status, data: $data, message: $message}';
  }

  @override
  List<Object?> get props => [status, data, message];
}
