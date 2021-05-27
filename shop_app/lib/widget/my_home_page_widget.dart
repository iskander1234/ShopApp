import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/modules/product.dart';
import 'package:shop_app/widget/my_gome_page_grid_title.dart';

class MyHomePageWidget extends StatelessWidget{
  final bool showFav;
  MyHomePageWidget(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productData = showFav?Provider.of<ProductsData>(context).favoriteProducts:Provider.of<ProductsData>(context).productItem;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        childAspectRatio: 3/2,
      ),
      itemBuilder: (context,index){
        return ChangeNotifierProvider.value(
        value: productData[index],
        child: MyHomePageGridTitle(),
        );
      },
      itemCount: productData.length,
    );
}
}