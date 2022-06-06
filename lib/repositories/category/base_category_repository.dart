import 'package:ecommerce_app/models/category_model.dart';

abstract class BaseCategryRepository {
  Stream<List<Category>> getAllCategories();
}
