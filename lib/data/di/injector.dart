import 'package:viet_trung_mobile_admin/data/repository/address_reponsitory/address_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/auth_repository/auth_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile_admin/data/repository/bag_reponsitory/bag_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/dashboard_product_reponsitory/dashboard_product_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/dashboard_product_reponsitory/dashboard_product_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/repository/exchange_rate_reponsitory/exchange_rate_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/exchange_rate_reponsitory/exchange_rate_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/feedback_reponsitory/feedback_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/feedback_reponsitory/feedback_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/repository/packing_admin_reponsitory/packing_admin_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/packing_admin_reponsitory/packing_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/report_reponsitory/report_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/report_reponsitory/report_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/repository/role_admin_reponsitory/role_admin_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/role_admin_reponsitory/role_admin_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/dashboard_reponsitoy/dashboard_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/dashboard_reponsitoy/dashboard_reponsitoy.dart';
import 'package:viet_trung_mobile_admin/data/repository/find_user_reponsitory/find_user_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/find_user_reponsitory/find_user_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/home_reponsitory/home_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/home_reponsitory/home_repositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_staff_reponsitory/manager_staff_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_staff_reponsitory/manager_staff_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_user_reponsitory/manager_user_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_user_reponsitory/manager_user_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/notification_repository/notification_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/notification_repository/notification_repository.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_admin_repository/order_admin_imp.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_repository/order_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/profile_repository/profile_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile_admin/data/repository/rating_order_reponsitory/rating_order_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/rating_order_reponsitory/rating_order_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/setting_reponsitory/setting_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/setting_reponsitory/setting_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/transport_admin_reponsitory/transport_admin_impl.dart';
import 'package:viet_trung_mobile_admin/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';

class Injector {
  factory Injector() {
    return Injector._internal();
  }

  Injector._internal();

  AuthRepository get auth => AuthImpl();
  ProfileRepositories get profile => ProfileImpl();
  HomeRepositories get home => HomeImpl();
  NotificationRepository get notification => NotificationImpl();
  AddressRepository get address => AddressImpl();

  BagRepositories get bag => BagImpl();
  SettingRepositories get setting => SettingImpl();
  FindUserRepositories get findUser => FindUserImpl();

  OrderRepositories get order => OrderImpl();
  OrderAdminRepositories get orderAmin => OrderAdminImpl();
  RoleAdminRepositories get role => RoleAdminImpl();
  TransportAdminRepositories get transport => TransportAdminImpl();
  DashboardRepositories get dashboard => DashboardImpl();
  RatingOrderRepositories get ratingOrder => RatingOrderImpl();
  ManagerStaffRepositories get managerStaff => ManagerStaffImpl();
  ManagerUserRepositories get managerUser => ManagerUserImpl();
  PackingAdminRepositories get packing => PackingAdminImpl();
  DashboardProductRepositories get dashboardProduct => DashboardProductImpl();
  ExchangeRateRepositories get exchangeRate => ExchangeRateImpl();
  FeedbackRespositories get feedback => FeedbackImpl();
  ReportRepositories get report => ReportImpl();
}
