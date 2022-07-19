
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salaa/domain/model/category/category_model.dart';
import 'package:salaa/presentation/base/viewModel/home_view_model.dart';
import 'package:salaa/presentation/resource/strings_manger.dart';

import '../../../app/di.dart';

import '../../resource/color_manger.dart';

class ProductCategoryView extends StatefulWidget {
  final DataProductCategoryDaTADetailsModel dataProductCategoryDaTADetailsModel;
  const ProductCategoryView(this.dataProductCategoryDaTADetailsModel, {Key? key}) : super(key: key);

  @override
  State<ProductCategoryView> createState() => _ProductCategoryViewState();
}

class _ProductCategoryViewState extends State<ProductCategoryView> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.products).tr(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  items: widget.dataProductCategoryDaTADetailsModel.images
                      .map((e) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: e,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                  ))
                      .toList(),
                  options: CarouselOptions(
                      height: 300.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.easeInOutBack,
                      scrollDirection: Axis.horizontal)),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 40,),
                child: Text(widget.dataProductCategoryDaTADetailsModel.name,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelMedium),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 15, bottom: 10),
                    child: Text(
                      "${widget.dataProductCategoryDaTADetailsModel.price}\$",
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      _viewModel.addProducts(widget.dataProductCategoryDaTADetailsModel.id);


                    },
                    child: Card(
                      elevation: 2,
                      color: AppColor.darkBG3,
                      child: SizedBox(
                          width: 130,
                          height: 50,
                          child: Center(
                            child: Text(AppStrings.add,
                                style: Theme.of(context).textTheme.labelSmall).tr(),
                          )),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColor.darkFont,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 15),
                child: Text(
                  AppStrings.description,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ).tr(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 50),
                child: Text(
                  widget.dataProductCategoryDaTADetailsModel.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
