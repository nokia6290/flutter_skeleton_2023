import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String title;
  final String description;
  final int? errorCode;

  const AppError(this.title, this.description, [this.errorCode]);

  @override
  List<Object?> get props => [
        title,
        description,
        errorCode,
      ];
}
