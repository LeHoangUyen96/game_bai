import 'package:viet_trung_mobile_admin/data/response/feedback_detail_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_feedback_review_response.dart';

abstract class FeedbackRespositories {
  Future<ListFeedbackReviewResponse> onGetListFeedback();
  Future<ListFeedbackReviewResponse> onGetListFeedbackOneStar();
  Future<ListFeedbackReviewResponse> onGetListFeedbackTwoStar();
  Future<ListFeedbackReviewResponse> onGetListFeedbackThreeStar();
  Future<ListFeedbackReviewResponse> onGetListFeedbackFourStar();
  Future<ListFeedbackReviewResponse> onGetListFeedbackFiveStar();
  Future<ReviewDetailResponse> onGetReviewDetail(String id);
}
