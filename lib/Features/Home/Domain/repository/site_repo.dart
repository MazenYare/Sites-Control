import 'package:sites_project/Features/Home/Domain/models/site.dart';

abstract class SiteRepository {
  // wanna just to get Site Data
  Future<List<Site>> getSites();
}
