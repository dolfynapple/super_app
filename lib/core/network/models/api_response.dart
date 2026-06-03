class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json)? fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: fromJsonT != null ? fromJsonT(json['data']) : null,
    );
  }

  final bool success;
  final String message;
  final T? data;
}
