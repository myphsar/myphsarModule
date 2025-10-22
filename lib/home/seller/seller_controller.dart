import 'dart:math';

import 'package:get/get.dart';
import 'package:myphsar/base_controller.dart';
import 'package:myphsar/base_provider.dart';

import 'seller_model.dart';

class SellerController extends BaseController {
  final BaseProvider _baseProvider;

  SellerController(this._baseProvider);

  final _allSellerModel = <SellerModel>[].obs;
  final _sellerItemModel = <SellerModel>[].obs;

  List<SellerModel> get getSellerItemModel => _sellerItemModel;

  void searchShop(String keySearch) {
    var search = keySearch.toLowerCase();
    _sellerItemModel.clear();

    if (keySearch.isEmpty) {
      _sellerItemModel.addAll(_allSellerModel);
      return;
    }

    for (var product in _allSellerModel) {
      if (product.name!.toLowerCase().contains(search)) {
        _sellerItemModel.add(product);
      }
    }
    notifySuccessResponse(_allSellerModel.length);
  }

  List<int> shuffleNumbers(int min, int max) {
    final List<int> numbers = List<int>.generate(max - min + 1, (i) => min + i);
    final Random random = Random();

    for (int i = numbers.length - 1; i > 0; i--) {
      int j = random.nextInt(i + 1);
      // Swap elements
      int temp = numbers[i];
      numbers[i] = numbers[j];
      numbers[j] = temp;
    }
    return numbers;
  }

  Future radomSeller(List<SellerModel> sellerModel) async{

    shuffleNumbers(0, sellerModel.length-1).forEach((index){
      _allSellerModel.add(sellerModel[index]);
    });
    _sellerItemModel.addAll(_allSellerModel);
  }

  Future getAllSeller() async {
    List<SellerModel>  allSellerList = [];
    change(true, status: RxStatus.loading());
    await _baseProvider.getAllSellerApiProvider().then((value) async => {
      if (value.statusCode == 200)
        {
          value.body.forEach((value) => {
            allSellerList.add(SellerModel.fromJson(value)),
          }),

          await radomSeller(allSellerList),
          notifySuccessResponse(allSellerList.length)
        }
      else
        {notifyErrorResponse("${value.statusCode}\n${value.statusText}")}
    });
  }
}
