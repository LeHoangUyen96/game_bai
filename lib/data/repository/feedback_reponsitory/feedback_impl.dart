import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/feedback_reponsitory/feedback_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/feedback_detail_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_feedback_review_response.dart';

class FeedbackImpl extends GetConnect implements FeedbackRespositories {
  @override
  Future<ListFeedbackReviewResponse> onGetListFeedback() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listFeedback;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListFeedbackReviewResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListFeedbackReviewResponse> onGetListFeedbackOneStar() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listFeedback + '?star=1';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListFeedbackReviewResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListFeedbackReviewResponse> onGetListFeedbackTwoStar() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listFeedback + '?star=2';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListFeedbackReviewResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListFeedbackReviewResponse> onGetListFeedbackThreeStar() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listFeedback + '?star=3';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListFeedbackReviewResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListFeedbackReviewResponse> onGetListFeedbackFourStar() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listFeedback + '?star=4';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListFeedbackReviewResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListFeedbackReviewResponse> onGetListFeedbackFiveStar() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listFeedback + '?star=5';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListFeedbackReviewResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ReviewDetailResponse> onGetReviewDetail(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.feedDetail + id;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ReviewDetailResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
