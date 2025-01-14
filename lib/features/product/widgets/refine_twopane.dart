import 'package:dual_screen/dual_screen.dart';
import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/routing/routes.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/show_snack_bar.dart';

class TwoPaneScreen extends StatefulWidget {
  const TwoPaneScreen({
    super.key,
    required this.restorationId,
  });

  final String restorationId;

  @override
  TwoPaneScreenState createState() => TwoPaneScreenState();
}

class TwoPaneScreenState extends State<TwoPaneScreen> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(-1);
  final RestorableInt _currentSubIndex =
  RestorableInt(-1); // Track the selected subfilter

  final List<String> filtersList = [
    "Categories",
    "Brands",
    "Colours",
    "Price",
    "Discount",
  ];

  final Map<String, List<String>> categoriesForFilters = {
    "Categories": ["Electronics", "Clothing", "Furniture", "Books"],
    "Brands": ["Nike", "Adidas", "Samsung", "Apple", "Sony"],
    "Colours": ["Red", "Blue", "Green", "Black", "White"],
    "Price": ["Under \$50", "\$50 - \$100", "\$100 - \$200", "Above \$200"],
    "Discount": ["10% Off", "20% Off", "30% Off", "50% Off"],
  };

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'two_pane_selected_item');
    registerForRestoration(_currentSubIndex, 'two_pane_selected_subitem');
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    _currentSubIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TwoPane(
      paneProportion: 0.3,
      panePriority: TwoPanePriority.both,
      startPane: ListPane(
        selectedIndex: _currentIndex.value,
        filtersList: filtersList,
        onSelect: (index) {
          setState(() {
            _currentIndex.value = index;
            _currentSubIndex.value =
            -1; // Reset the selected subfilter when switching filters
          });
        },
        onClearAll: () {
          setState(() {
            _currentIndex.value = -1;
            _currentSubIndex.value = -1;
          });
        },
      ),
      endPane: DetailsPane(
        selectedIndex: _currentIndex.value,
        categories: _currentIndex.value == -1
            ? []
            : categoriesForFilters[filtersList[_currentIndex.value]]!,
        selectedSubIndex: _currentSubIndex.value,
        onSubSelect: (index) {
          setState(() {
            _currentSubIndex.value = index; // Set the selected subfilter
          });
        },
        onClose: () {
          setState(() {
           context.pop();
          });
        },
        onApplyAll: () {
          if(_currentIndex.value == -1 || _currentSubIndex.value == -1){
            showSnackBar(context,"select filter");
          }else{
          print(
              "Filter Applied: ${filtersList[_currentIndex.value]} -> "
                  "${categoriesForFilters[filtersList[_currentIndex.value]]![_currentSubIndex.value]}");
          Navigator.pushNamed(context, Routes.productsScreen);}
        },
      ),
    );
  }
}

class ListPane extends StatelessWidget {
  final ValueChanged<int> onSelect;
  final int selectedIndex;
  final List<String> filtersList;
  final VoidCallback? onClearAll;

  const ListPane({
    super.key,
    required this.onSelect,
    required this.selectedIndex,
    required this.filtersList,
      this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("FILTER BY"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: ListView(
                restorationId: 'filters_list_view',
                children: [
                  for (int index = 0; index < filtersList.length; index++)
                    ListTile(
                      onTap: () {
                        onSelect(index);
                      },
                      selected: selectedIndex == index,
                      title: Text(
                        filtersList[index],
                      ),
                    ),
                ],
              ),
            ),
          ),
          ActionButton(
            color: Colors.green,
            onPressed: onClearAll!,
          label:"Clear All",
          ),
        ],
      ),
    );
  }
}

class DetailsPane extends StatelessWidget {
  final VoidCallback? onClose;
  final int selectedIndex;
  final int selectedSubIndex; // Track selected subfilter index
  final List<String> categories;
  final ValueChanged<int> onSubSelect;
  final VoidCallback? onClearAll;
  final VoidCallback? onApplyAll;

  const DetailsPane({
    super.key,
    required this.selectedIndex,
    required this.categories,
    required this.selectedSubIndex,
    required this.onSubSelect,
    this.onClose,
      this.onClearAll,
     this.onApplyAll,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: onClose == null
            ? null
            : IconButton(icon: const Icon(Icons.close), onPressed: onClose),
        title: Text(
          selectedIndex == -1
              ? "Select a Filter"
              : "Categories for ${categories.isEmpty ? 'None' : categories.first}",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xfffafafa),
              child: categories.isEmpty
                  ? Center(
                child: Text(
                  "Please select a filter to see categories",
                ),
              )
                  : ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(categories[index]),
                    trailing: selectedSubIndex == index
                        ? const Icon(Icons.check,
                        color: Colors
                            .green) // Show checkmark for selected subfilter
                        : null,
                    onTap: () {
                      onSubSelect(index); // Set the selected subfilter
                    },
                  );
                },
              ),
            ),
          ),
          ActionButton(
            color: ColorsManager.errorColor,
            onPressed: onApplyAll!,
            label:"APPLY..",
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String label;

  const ActionButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      clipBehavior: Clip.none,
      minWidth: double.infinity,
      color: color,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}