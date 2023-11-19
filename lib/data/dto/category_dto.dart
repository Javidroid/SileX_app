import 'package:tfg_v2/domain/model/social/plan_category.dart';

class PlanCategoryDto {
  final String idCategory;
  final String name;
  final List<String> subcategories;

  PlanCategoryDto({
    required this.idCategory,
    required this.name,
    required this.subcategories,
  });

  factory PlanCategoryDto.fromJson(Map<String, dynamic> json) {
    return PlanCategoryDto(
      idCategory: json["_id"],
      name: json["name"],
      subcategories: List<String>.from(json["subcategories"].map((x) => x)),
    );
  }

  PlanCategory toModel() {
    return PlanCategory(
      idCategory: idCategory,
      name: name,
      subcategories: subcategories,
    );
  }
}
