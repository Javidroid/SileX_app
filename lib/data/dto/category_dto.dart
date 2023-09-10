import 'package:tfg_v2/domain/model/category.dart';

class CategoryDto {
  final String idCategory;
  final String name;
  final List<String> subcategories;

  CategoryDto({
    required this.idCategory,
    required this.name,
    required this.subcategories,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      idCategory: json["_id"],
      name: json["name"],
      subcategories: List<String>.from(json["subcategories"].map((x) => x)),
    );
  }

  Category toModel() {
    return Category(
      idCategory: idCategory,
      name: name,
      subcategories: subcategories,
    );
  }
}
