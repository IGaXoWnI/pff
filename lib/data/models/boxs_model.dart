class BoxsModel {
  int? boxsId;
  String? boxsName;
  String? boxsDescription;
  String? boxsImage;
  String? boxsLogo;
  int? boxsCount;
  int? boxsActive;
  double? boxesPrice;
  int? boxesDiscount;
  String? boxsDate;
  int? boxsCategorie;
  int? restaurantId;
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDescription;
  String? categoriesDatetime;

  BoxsModel(
      {this.boxsId,
      this.boxsName,
      this.boxsDescription,
      this.boxsImage,
      this.boxsLogo,
      this.boxsCount,
      this.boxsActive,
      this.boxesPrice,
      this.boxesDiscount,
      this.boxsDate,
      this.boxsCategorie,
      this.restaurantId,
      this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesDescription,
      this.categoriesDatetime});

  BoxsModel.fromJson(Map<String, dynamic> json) {
    boxsId = json['boxs_id'];
    boxsName = json['boxs_name'];
    boxsDescription = json['boxs_description'];
    boxsImage = json['boxs_image'];
    boxsLogo = json['boxs_logo'];
    boxsCount = json['boxs_count'];
    boxsActive = json['boxs_active'];
    boxesPrice = json['boxes_price'];
    boxesDiscount = json['boxes_discount'];
    boxsDate = json['boxs_date'];
    boxsCategorie = json['boxs_categorie'];
    restaurantId = json['restaurant_id'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDescription = json['categories_description'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boxs_id'] = this.boxsId;
    data['boxs_name'] = this.boxsName;
    data['boxs_description'] = this.boxsDescription;
    data['boxs_image'] = this.boxsImage;
    data['boxs_logo'] = this.boxsLogo;
    data['boxs_count'] = this.boxsCount;
    data['boxs_active'] = this.boxsActive;
    data['boxes_price'] = this.boxesPrice;
    data['boxes_discount'] = this.boxesDiscount;
    data['boxs_date'] = this.boxsDate;
    data['boxs_categorie'] = this.boxsCategorie;
    data['restaurant_id'] = this.restaurantId;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_description'] = this.categoriesDescription;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
