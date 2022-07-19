import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../../../domain/model/home/category.dart';
import '../../base/viewModel/home_view_model.dart';
import '../../categoryDetails/view/category_details_view.dart';
import '../../common/provider/bloc_provider.dart';

import '../../resource/app_size.dart';
import '../../resource/color_manger.dart';
import '../../resource/image_manger.dart';
import '../../resource/strings_manger.dart';
import '../../search/view_model.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late HomeViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = BlocProvider.of<HomeViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Lottie.asset(AppJson.splash),
        title:  Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: const Text(AppStrings.salla).tr(),
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>const SearchView()
                ));
          }, icon: const Icon(Icons.search)),
          const SizedBox(width: AppSizeMange.s10),
        ],
      ),
      body: StreamBuilder<CategoryModel>(
        stream: _viewModel.outputCategoryData,
        builder: (context, snapshot) {
          return _getCategory(snapshot.data);
        },
      ),
    );
  }

  Widget _getCategory(CategoryModel? data) {
    if (data != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
        child: ListView.separated(
          itemCount: data.data!.data!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                    onTap: () async{
                      _viewModel
                          .getCategoryData(data.data!.data![index].id);
                              await  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryDetailsView(),
                                    ));

                    },
                    child: _container(data, index));
              },


          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
        ),
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(70.0),
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
  }

  Widget _container(CategoryModel? data, int index) {
    return Card(
      color: AppColor.darkBG3,
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 120,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: data!.data!.data![index].image,
                  fit: BoxFit.cover,
                  height: 100,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const Spacer(),
            Text(data.data!.data![index].name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 20, color: AppColor.white)),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColor.white),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}
