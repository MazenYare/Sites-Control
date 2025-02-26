import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_project/Features/Home/Domain/models/site.dart';
import 'package:sites_project/Features/Home/presentation/site_cubit.dart';
import 'package:sites_project/Features/Home/presentation/widgets/site_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    context.read<SiteCubit>().filterSites(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _searchController,
        ),
      ),
      body: BlocBuilder<SiteCubit, List<Site>>(
        builder: (context, sites) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sites.length,
                    itemBuilder: (context, index) {
                      final site = sites[index];
                      return SiteCard(
                        siteArea: site.area,
                        siteName: site.name,
                        siteType: site.type,
                        siteZone: site.zone,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
