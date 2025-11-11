import "package:u/utilities.dart";

part "params/auth_params.dart";
part "params/base_params.dart";
part "params/category_params.dart";
part "params/comment_params.dart";
part "params/content_params.dart";
part "params/contract_params.dart";
part "params/exam_params.dart";
part "params/follow_params.dart";
part "params/invoice_params.dart";
part "params/media_params.dart";
part "params/product_params.dart";
part "params/user_params.dart";
part "responses/auth_response.dart";
part "responses/base_response.dart";
part "responses/category_response.dart";
part "responses/comment_response.dart";
part "responses/content_response.dart";
part "responses/contract_response.dart";
part "responses/dashboard_response.dart";
part "responses/exam_response.dart";
part "responses/follower_following_count_response.dart";
part "responses/invoice_response.dart";
part "responses/media_response.dart";
part "responses/product_response.dart";
part "responses/user_response.dart";
part "services/auth_service.dart";
part "services/category_service.dart";
part "services/comment_service.dart";
part "services/content_service.dart";
part "services/contract_service.dart";
part "services/dashboard_service.dart";
part "services/exam_service.dart";
part "services/follow_service.dart";
part "services/invoice_service.dart";
part "services/media_service.dart";
part "services/product_service.dart";
part "services/user_service.dart";

class UServices {
  UServices({
    required this.baseUrl,
    required this.apiKey,
    required this.token,
  }) {
    dashboard = DashboardService(baseUrl: baseUrl, apiKey: apiKey, token: apiKey);
    auth = AuthService(baseUrl: baseUrl, apiKey: apiKey, token: token);
    category = CategoryService(baseUrl: baseUrl, apiKey: apiKey, token: token);
    exam = ExamService(baseUrl: baseUrl, apiKey: apiKey, token: token);
    user = UserService(baseUrl: baseUrl, apiKey: apiKey, token: token);
    product = ProductService(baseUrl: baseUrl, apiKey: apiKey, token: token);
    content = ContentService(baseUrl: baseUrl, apiKey: apiKey, token: token);
    comment = CommentService(baseUrl: baseUrl, apiKey: apiKey, token: token);
    follow = FollowService(baseUrl: baseUrl, apiKey: apiKey, token: token);
    contract = ContractService(baseUrl: baseUrl, apiKey: apiKey, token: token);
    invoice = InvoiceService(baseUrl: baseUrl, apiKey: apiKey, token: token);
  }

  String baseUrl;
  String apiKey;
  String? token;

  late AuthService auth;
  late CategoryService category;
  late DashboardService dashboard;
  late ExamService exam;
  late UserService user;
  late ProductService product;
  late ContentService content;
  late CommentService comment;
  late FollowService follow;
  late ContractService contract;
  late InvoiceService invoice;
}
