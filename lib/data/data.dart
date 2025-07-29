import 'package:u/utilities.dart';

part "params/auth_params.dart";
part "params/base_params.dart";
part "params/category_params.dart";
part "params/comment_params.dart";
part "params/content_params.dart";
part "params/exam_params.dart";
part "params/media_params.dart";
part "params/product_params.dart";
part "params/user_params.dart";
part "responses/auth_response.dart";
part "responses/base_response.dart";
part "responses/category_response.dart";
part "responses/comment_response.dart";
part "responses/dashboard_response.dart";
part "responses/exam_response.dart";
part "responses/media_response.dart";
part "responses/product_response.dart";
part "responses/user_response.dart";
part "services/auth_service.dart";
part "services/category_service.dart";
part "services/dashboard_service.dart";
part "services/exam_service.dart";
part "services/user_service.dart";

class UServices {
  final String baseUrl;

  late AuthService auth;
  late CategoryService category;
  late DashboardService dashboard;
  late ExamService exam;
  late UserService user;

  UServices({required this.baseUrl}) {
    auth = AuthService(baseUrl: baseUrl);
    category = CategoryService(baseUrl: baseUrl);
    dashboard = DashboardService(baseUrl: baseUrl);
    exam = ExamService(baseUrl: baseUrl);
    user = UserService(baseUrl: baseUrl);
  }
}