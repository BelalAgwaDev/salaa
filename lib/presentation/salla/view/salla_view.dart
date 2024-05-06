import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/model/getProduct/model.dart';
import '../../base/viewModel/home_view_model.dart';
import '../../common/provider/bloc_provider.dart';
import '../../resource/color_manger.dart';

class SallaView extends StatefulWidget {
  const SallaView({super.key});

  @override
  State<SallaView> createState() => _SallaViewState();
}

class _SallaViewState extends State<SallaView> {
  late HomeViewModel _viewModel;
  final refreshController = RefreshController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = BlocProviderApp.of<HomeViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GetProductDaTaModel>(
      stream: _viewModel.outputGetProduct,
      builder: (context, snapshot) {
        return _getData(snapshot.data);
      },
    );
  }

  Widget _getData(GetProductDaTaModel? data) {
    if (data != null) {
      return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              "Total Price   ${data.data!.total}",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColor.darkBG3),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_checkout_rounded,
                  size: 25,
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SmartRefresher(
          onRefresh: onRefresh,
          controller: refreshController,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return cartData(data, index);
            },
            itemCount: data.data!.cartItems!.length,
          ),
        ),
      );
    }
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Widget cartData(GetProductDaTaModel? data, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
      child: Stack(
        children: [
          Card(
            elevation: 10,
            color: Colors.blue[50],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: AppColor.grayFont, width: 0.2)),
            child: SizedBox(
              height: 140,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 180, top: 20, right: 20),
                child: Text(
                  data!.data!.cartItems![index].product!.name,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: data.data!.cartItems![index].product!.image,
                height: 138,
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            left: 200,
            top: 65,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        '${data.data!.cartItems![index].product!.oldPrice} \$',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(width: 10),
                  ),
                  TextSpan(
                    text: '${data.data!.cartItems![index].product!.price} \$',
                    style: const TextStyle(
                      // color: Colors.grey,
                      fontSize: 14,
                      // decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 180,
            top: 90,
            child: Row(
              children: [
                StatefulBuilder(
                  builder: (context, setState) {
                    return IconButton(
                        onPressed: () {
                          setState(() {});
                          _viewModel
                              .deleteProduct(data.data!.cartItems![index].id);
                          onRefresh();
                        },
                        icon: Icon(
                          Icons.delete,
                          color: AppColor.red,
                        ));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${data.data!.cartItems![index].quantity}",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColor.darkBG3),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {});
                      data.data!.cartItems![index].quantity++;

                      if (data.data!.cartItems![index].quantity <= 0) {
                        _viewModel
                            .deleteProduct(data.data!.cartItems![index].id);
                        onRefresh();
                      } else {
                        _viewModel.updateProduct(
                            data.data!.cartItems![index].quantity,
                            data.data!.cartItems![index].id);
                        onRefresh();
                      }
                    },
                    icon: Icon(
                      Icons.add,
                      color: AppColor.darkBG3,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {});

                      data.data!.cartItems![index].quantity--;

                      if (data.data!.cartItems![index].quantity <= 0) {
                        _viewModel
                            .deleteProduct(data.data!.cartItems![index].id);
                        onRefresh();
                      } else {
                        _viewModel.updateProduct(
                            data.data!.cartItems![index].quantity,
                            data.data!.cartItems![index].id);
                        onRefresh();
                      }
                    },
                    icon: Icon(
                      Icons.remove,
                      color: AppColor.red,
                    )),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onRefresh() async {
    _viewModel.getProducts();
    refreshController.refreshCompleted();
  }
}
