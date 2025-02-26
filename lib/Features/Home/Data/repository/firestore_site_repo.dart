import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sites_project/Features/Home/Data/models/firestore_site.dart';
import 'package:sites_project/Features/Home/Domain/models/site.dart';
import 'package:sites_project/Features/Home/Domain/repository/site_repo.dart';

class FirestoreSiteRepo implements SiteRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<Site>> getSites() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('Sites').get();
      List<Site> sites = querySnapshot.docs.map((doc) {
        FireStoreSite fireStoreSite =
            FireStoreSite.fromMap(doc.data() as Map<String, dynamic>);
        return Site(
          name: fireStoreSite.name,
          area: fireStoreSite.area,
          zone: fireStoreSite.zone,
          type: fireStoreSite.type,
        );
      }).toList();
      return sites;
    } catch (e) {
      throw Exception('Failed to get sites: $e');
    }
  }
}
