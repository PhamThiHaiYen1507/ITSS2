import '../exceptions/api_exception.dart';
import 'package:either_dart/either.dart';

typedef ApiResponseData<T> = Either<ApiException<T>, T>;
