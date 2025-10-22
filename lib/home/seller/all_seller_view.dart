import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myphsar/base_colors.dart';
import 'package:myphsar/base_widget/custom_scaffold.dart';
import 'package:myphsar/base_widget/myphsar_text_view.dart';

import '../../base_widget/custom_appbar_view.dart';
import '../../base_widget/input_text_field_icon.dart';
import '../../base_widget/not_found.dart';
import '../../base_widget/reload_button.dart';
import '../all_product/shimmer_placeholder_view.dart';
import 'seller_controller.dart';
import 'seller_item_banner_view.dart';

class AllSellerView extends StatefulWidget {
  const AllSellerView({super.key});

  @override
  State<AllSellerView> createState() => _AllSellerViewState();
}

class _AllSellerViewState extends State<AllSellerView> {
  ScrollController scrollController = ScrollController();

  GlobalKey<FormState> searchKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    Get.find<SellerController>().getAllSeller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backGroundColor: ColorResource.bgItemColor,
      appBar: customAppBarView(
          context: context,
          titleText: '',
          flexibleSpace: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 60, right: 15),
              child: InputTextFieldWithIcon(
                focusNode: focusNode,
                formKey: searchKey,
                onTextChange: (search) =>
                {Get.find<SellerController>().searchShop(search)},
                onSubmit: (val) => {
                  Get.find<SellerController>().searchShop(val.toString()),
                },
                hintTxt: "search_shop".tr,
                imageIcon: Image.asset(
                  "assets/images/search_ic.png",
                  width: 19,
                  height: 19,
                ),
                textInputAction: TextInputAction.search,
              ),
            ),
          )),
      body: Get.find<SellerController>().obx(
              (state) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top:5),
              child: SellerItemBannerView(
                callDataApiFunction,
                scrollController: scrollController,
              ),
            ),
          ),
          onLoading: shopShimmerView(context),
          onError: (s) =>
              onErrorReloadButton(context, s.toString(), height: MediaQuery.of(context).size.height, onTap: () {
                Get.find<SellerController>().getAllSeller();
              }),
          onEmpty:   notFound(context, 'not_found'.tr)),
    );
  }

  void callDataApiFunction(int offset) {
    Get.find<SellerController>().getAllSeller();
  }
}
