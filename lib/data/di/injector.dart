
import 'package:viet_trung_mobile/data/repository/address_reponsitory/address_impl.dart';
import 'package:viet_trung_mobile/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_impl.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_impl.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/repository/home_reponsitory/home_impl.dart';
import 'package:viet_trung_mobile/data/repository/home_reponsitory/home_repositories.dart';
import 'package:viet_trung_mobile/data/repository/notification_repository/notification_impl.dart';
import 'package:viet_trung_mobile/data/repository/notification_repository/notification_repository.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_impl.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/data/repository/setting_reponsitory/setting_impl.dart';
import 'package:viet_trung_mobile/data/repository/setting_reponsitory/setting_reponsitory.dart';

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

}