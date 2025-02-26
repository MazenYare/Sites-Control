import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'site_indicator.dart';

class SiteCard extends StatefulWidget {
  final String siteName;
  final String siteType;
  final String siteZone;
  final String siteArea;

  const SiteCard({
    super.key,
    required this.siteName,
    required this.siteType,
    required this.siteZone,
    required this.siteArea,
  });

  @override
  State<StatefulWidget> createState() => _SiteCardState();
}

class _SiteCardState extends State<SiteCard> {
  final List<Color> lightColors = [
    Colors.lightBlue.shade100,
    Colors.lightGreen.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    final Color cardColor =
        lightColors[widget.siteName.hashCode % lightColors.length];

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topRight,
            colors: [
              // ignore: deprecated_member_use
              cardColor.withOpacity(0.7),
              cardColor,
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                widget.siteName,
                maxFontSize: 40,
                minFontSize: 10,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SiteIndicator(
                    label: widget.siteType,
                    color: Colors.green,
                  ),
                  SiteIndicator(
                    label: widget.siteArea,
                    color: Colors.red.shade400,
                  ),
                  SiteIndicator(
                    label: widget.siteZone,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
