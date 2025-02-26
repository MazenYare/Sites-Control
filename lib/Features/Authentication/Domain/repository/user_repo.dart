import 'package:sites_project/Features/Home/Domain/models/site.dart';

abstract class UserRepository {
  Future<List<Site>> getUser();
  Future<void> updateUser();
  Future<void> isLoggedIn();
  Future<void> logIn();
  Future<void> logout();
}
