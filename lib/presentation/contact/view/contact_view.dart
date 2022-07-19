import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salaa/presentation/resource/strings_manger.dart';

import '../../../domain/model/contactUs/contact_us_model.dart';
import '../../base/viewModel/home_view_model.dart';
import '../../common/provider/bloc_provider.dart';
import '../../resource/color_manger.dart';
import '../webView/web_view.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  late HomeViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = BlocProvider.of<HomeViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<ContactUsModel>(
        stream: _viewModel.outputContact,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: AppColor.grayFont, width: 0.2)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          _container(context, AppStrings.facebook.tr(),
                              snapshot.data!.data!.data![0].image, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebDataView(snapshot.data!.data!.data![0].value)
                                    ));
                              }),
                          const SizedBox(height: 10,),
                          _container(context, AppStrings.instagram.tr(),
                              snapshot.data!.data!.data![1].image, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebDataView(snapshot.data!.data!.data![1].value)
                                    ));
                              }),
                          const SizedBox(height: 10,),
                          _container(context, AppStrings.twitter.tr(),
                              snapshot.data!.data!.data![2].image, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebDataView(snapshot.data!.data!.data![2].value)
                                    ));
                              }),
                          const SizedBox(height: 10,),
                          _container(context, AppStrings.gmail.tr(),
                              snapshot.data!.data!.data![3].image, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebDataView(snapshot.data!.data!.data![3].value)
                                    ));
                              }),
                          const SizedBox(height: 10,),
                          _container(context, AppStrings.phone.tr(),
                              snapshot.data!.data!.data![4].image, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebDataView(snapshot.data!.data!.data![4].value)
                                    ));
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }

  Widget _container(
      context, String name, String image, GestureTapCallback function) {
    return GestureDetector(
      onTap: function,
      child: Card(
        color: AppColor.darkBG3,
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 75,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              CachedNetworkImage(
                imageUrl: image,
                color: Colors.yellow[800],
                height: 45,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, color: AppColor.white)),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, color: AppColor.white),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
