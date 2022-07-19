


import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:salaa/domain/model/getFvor/get_favor_model.dart';
import 'package:salaa/presentation/resource/strings_manger.dart';


import '../../../app/di.dart';
import '../../base/viewModel/home_view_model.dart';
import '../../resource/color_manger.dart';

class ProductFavorDetails extends StatefulWidget {
final ProductGetFavoriteDataModel? products;
   const ProductFavorDetails(this.products,    {Key? key}) : super(key: key);

  @override
  State<ProductFavorDetails> createState() => _ProductFavorDetailsState();
}

class _ProductFavorDetailsState extends State<ProductFavorDetails> {
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
                 Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: widget.products!.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                  ),

              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 40,),
                child: Text(widget.products!.name,
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
                      "${widget.products!.price}\$",
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _viewModel.addProducts(widget.products!.id);


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
                  widget.products!.description,
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
