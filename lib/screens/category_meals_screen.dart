import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    String categoryId = routeArgs['id'];
    String categoryTitle = routeArgs['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
            duration: categoryMeal[index].duration,
            imageUrl: categoryMeal[index].imageUrl,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
