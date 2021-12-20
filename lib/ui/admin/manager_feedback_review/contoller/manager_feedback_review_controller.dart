import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/feedback_reponsitory/feedback_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/response/list_feedback_review_response.dart';

class ManagerFeedbackReviewController extends GetxController
    with SingleGetTickerProviderMixin {
  int positionSelected = 0;
  RefreshController refreshListAllController =
      RefreshController(initialRefresh: false);
  RefreshController refreshListOneStarController =
      RefreshController(initialRefresh: false);
  RefreshController refreshListTwoStarController =
      RefreshController(initialRefresh: false);
  RefreshController refreshListThreeStarController =
      RefreshController(initialRefresh: false);
  RefreshController refreshListFourStarController =
      RefreshController(initialRefresh: false);
  RefreshController refreshListFiveStarController =
      RefreshController(initialRefresh: false);
  TabController? tabController;
  ListFeedbackReviewResponse? listResponse;
  ListFeedbackReviewResponse? oneStarResponse;
  ListFeedbackReviewResponse? twoStarResponse;
  ListFeedbackReviewResponse? threeStarResponse;
  ListFeedbackReviewResponse? fourStarResponse;
  ListFeedbackReviewResponse? fiveStarResponse;
  FeedbackRespositories? respositories;

  @override
  void onInit() {
    super.onInit();
    respositories = Injector().feedback;
    getListFeedback();
    getListFeedbackOneStar();
    getListFeedbackTwoStar();
    getListFeedbackThreeStar();
    getListFeedbackFourStar();
    getListFeedbackFiveStar();
  }

  void onSelect(int index) {
    positionSelected = index;
    update();
  }

  void getListFeedback() {
    respositories!.onGetListFeedback().then((value) {
      listResponse = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void getListFeedbackOneStar() {
    respositories!.onGetListFeedbackOneStar().then((value) {
      oneStarResponse = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void getListFeedbackTwoStar() {
    respositories!.onGetListFeedbackTwoStar().then((value) {
      twoStarResponse = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void getListFeedbackThreeStar() {
    respositories!.onGetListFeedbackThreeStar().then((value) {
      threeStarResponse = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void getListFeedbackFourStar() {
    respositories!.onGetListFeedbackFourStar().then((value) {
      fourStarResponse = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void getListFeedbackFiveStar() {
    respositories!.onGetListFeedbackFiveStar().then((value) {
      fiveStarResponse = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onRefreshListAll() async {
    refreshListAllController.refreshCompleted();
  }

  void onLoadingListAll() async {
    refreshListAllController.refreshCompleted();
  }

  void onRefreshListOneStar() async {
    refreshListAllController.refreshCompleted();
  }

  void onLoadingListOneStar() async {
    refreshListAllController.refreshCompleted();
  }

  void onRefreshListTwoStar() async {
    refreshListAllController.refreshCompleted();
  }

  void onLoadingListThreeStar() async {
    refreshListAllController.refreshCompleted();
  }

  void onRefreshListFourStar() async {
    refreshListAllController.refreshCompleted();
  }

  void onLoadingListFourStar() async {
    refreshListAllController.refreshCompleted();
  }

  void onRefreshListThreeStar() async {
    refreshListAllController.refreshCompleted();
  }

  void onLoadingListTwoStar() async {
    refreshListAllController.refreshCompleted();
  }

  void onRefreshListFiveStar() async {
    refreshListAllController.refreshCompleted();
  }

  void onLoadingListFiveStar() async {
    refreshListAllController.refreshCompleted();
  }
}
