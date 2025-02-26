import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_project/Features/Home/Data/repository/firestore_site_repo.dart';
import 'package:sites_project/Features/Home/Domain/repository/site_repo.dart';
import 'package:sites_project/Features/Home/presentation/site_cubit.dart';
import 'package:sites_project/Features/Home/presentation/site_page.dart';
import 'package:sites_project/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ignore: non_constant_identifier_names
  final FirebaseSiteRepo = FirestoreSiteRepo();

  runApp(MyApp(
    siteRepo: FirebaseSiteRepo,
  ));
}

class MyApp extends StatelessWidget {
  final SiteRepository siteRepo;
  const MyApp({super.key, required this.siteRepo});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SiteCubit(siteRepo)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SiteHome(
          siteRepo: siteRepo,
        ),
      ),
    );
  }
}
