import 'package:sites_project/Features/Home/Domain/models/site.dart';
import 'package:sites_project/Features/Home/Domain/repository/site_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiteCubit extends Cubit<List<Site>> {
  final SiteRepository siteRepo;
  List<Site> allSites = [];

  SiteCubit(this.siteRepo) : super([]) {
    getsites();
  }

  Future<void> getsites() async {
    try {
      final sites = await siteRepo.getSites();
      allSites = sites;
      emit(sites);
    } catch (e) {
      throw Exception('Failed to get sites: $e');
    }
  }

  Future<void> filterSites(String typedtext) async {
    try {
      final typedtextlower = typedtext.toLowerCase();
      final filteredSites = allSites.where((site) {
        final siteNameLower = site.name.toLowerCase();
        return siteNameLower.contains(typedtextlower);
      }).toList();
      emit(filteredSites);
    } catch (e) {
      throw Exception('Failed to filter sites: $e');
    }
  }
}
