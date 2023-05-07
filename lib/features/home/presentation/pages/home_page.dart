import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes/core/presentation/widgets/app_title.dart';
import 'package:recipes/core/utils/app_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(22.w),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppTitle(
                title: AppStrings.findBestRecipesTitle,
              ),
              20.verticalSpace,
              TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                onChanged: (value) {
                  // todo enable search
                },
                decoration: const InputDecoration(
                  hintText: AppStrings.searchHint,
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                  ),
                ),
              ),
              20.verticalSpace,

            ],
          ),
        ),
      ),
    );
  }
}
