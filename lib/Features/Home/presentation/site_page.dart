import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_project/Features/Home/Domain/repository/site_repo.dart';
import 'package:sites_project/Features/Home/presentation/site_cubit.dart';
import 'package:sites_project/Features/Home/presentation/site_view.dart';

class SiteHome extends StatelessWidget {
  final SiteRepository siteRepo;
  const SiteHome({super.key, required this.siteRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SiteCubit(siteRepo),
      child: const HomeView(),
    );
  }
}
