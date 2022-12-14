// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:linting_tool/layout/adaptive.dart';
import 'package:linting_tool/model/profile.dart';
import 'package:linting_tool/widgets/saved_rule_tile.dart';

class RulesPage extends StatelessWidget {
  final RulesProfile profile;

  const RulesPage({
    required this.profile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayLarge(context);
    final isTablet = isDisplayMedium(context);
    var textTheme = Theme.of(context).textTheme;
    final startPadding = isTablet
        ? 60.0
        : isDesktop
            ? 120.0
            : 4.0;
    final endPadding = isTablet
        ? 60.0
        : isDesktop
            ? 120.0
            : 4.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          profile.name,
          style: textTheme.subtitle2!.copyWith(
            color: textTheme.bodyText1!.color,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            label: const Text('Back'),
          ),
        ),
        leadingWidth: 160.0,
        toolbarHeight: 38.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: ListView.separated(
        padding: EdgeInsetsDirectional.only(
          start: startPadding,
          end: endPadding,
          top: isDesktop ? 28 : 0,
          bottom: isDesktop ? kToolbarHeight : 0,
        ),
        itemCount: profile.rules.length,
        cacheExtent: 5,
        itemBuilder: (context, index) {
          return SavedRuleTile(
            rule: profile.rules[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 4),
      ),
    );
  }
}
