import 'package:equatable/equatable.dart';

class ApiError extends Equatable {
  final String status;
  final String message;

  const ApiError({
    required this.status,
    required this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }

  @override
  List<Object?> get props => [status, message];
}