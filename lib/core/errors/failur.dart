import 'package:dio/dio.dart';

abstract class Failer {
  final String errorMessage;

  Failer(this.errorMessage);
}

class ServerFailer extends Failer {
  ServerFailer(super.errorMessage);
 
  factory ServerFailer.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailer('Connection Time Out');
      case DioExceptionType.sendTimeout:
        return ServerFailer('Send Time Out');
      case DioExceptionType.receiveTimeout:
        return ServerFailer('Receive Time Out');
      case DioExceptionType.badCertificate:
        return ServerFailer('Check Your connection');
      case DioExceptionType.badResponse:
        return ServerFailer('Check Your connection');
      case DioExceptionType.cancel:
        return ServerFailer('Connection has Canceld');
      case DioExceptionType.connectionError:
        return ServerFailer('Connection Error');
      case DioExceptionType.unknown:
        return ServerFailer('Check Your Connection');
      default:
        return ServerFailer('opps There was an Erro');
    }
  }
}
