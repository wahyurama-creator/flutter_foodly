import 'package:equatable/equatable.dart';

class BaseListResponse<T> extends Equatable {
  final String status;
  final List<T> data;
  final String? message;

  const BaseListResponse({required this.status, required this.data, this.message});

  factory BaseListResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic json) fromJson) {
    return BaseListResponse(
      status: json['status'] ?? '',
      data: (json['data'] as List).map(fromJson).toList(),
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T data) toJson) {
    return {
      'status': status,
      'data': data.map(toJson).toList(),
      'message': message,
    };
  }

  @override
  String toString() {
    return 'BaseListResponse{status: $status, data: $data, message: $message}';
  }

  @override
  List<Object?> get props => [status, data, message];
}