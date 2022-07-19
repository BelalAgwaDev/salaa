import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:salaa/presentation/base/viewModel/home_view_model.dart';
import 'package:salaa/presentation/widget/search.dart';

import '../../domain/model/category/category_model.dart';

import '../common/provider/bloc_provider.dart';
import '../productsDetails/view/product_search.dart';
import '../resource/color_manger.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();



}

class _SearchViewState extends State<SearchView> {

  late HomeViewModel viewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = BlocProvider.of<HomeViewModel>(context);

  }

  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: searchBar(context, function: (value) {

        }, clear: () {
         viewModel.search(_search.text);

        }, search: _search),
      ),
      body: StreamBuilder<CategoryDaTADetailsModel>(
        stream: viewModel.outputSearch,
        builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        top: 15,
                        right: 8,
                        left: 8,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      childAspectRatio: 1 / 2,
                      children: List.generate(
                        snapshot.data!.data!.data!.length,
                            (index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductSearchDetails(snapshot.data!.data!.data![index]),
                                ));


                          },




                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(width: 1.5, color: AppColor.lightGrey)),
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        // left: 120.0, top: 15.0, bottom: 20
                                ),
                                    child:  IconButton(
                                          onPressed: () {
                                            viewModel.getFavor(snapshot.data!.data!.data![index].id);

                                            setState(() {

                                            });

                                          },
                                          icon:
                                          viewModel.favorites[snapshot.data!.data!.data![index].id]!   ?  Icon(
                                            Icons.favorite,
                                            color: AppColor.red,
                                            size: 30,
                                          ):
                                          Icon(
                                            Icons.favorite_border,
                                            color: AppColor.grayFont,


                                            size: 30,
                                          ),
                                        )),


                                Center(
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot.data!.data!.data![index].image,
                                    height: 160,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                    const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 15, right: 15),
                                  child: Text(
                                   snapshot.data!.data!.data![index].name,
                                    style: Theme.of(context).textTheme.labelMedium,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 22.0, top: 10),
                                  child: Text(
                                    "${snapshot.data!.data!.data![index].price}\$",
                                    style: Theme.of(context).textTheme.labelLarge,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //itemCount: data.data!.products!.length,
                      ),
                    ),

                    const SizedBox(height: 100,)
                  ],
                ),
              ));
        } else {
          return const Padding(
            padding: EdgeInsets.all(500),
            child: Center(child:  CircularProgressIndicator.adaptive()),
          );
        }
      },),
    );
  }
}
