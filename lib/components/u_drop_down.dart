import "package:u/utilities.dart";

class UCategorySelector extends StatefulWidget {
  const UCategorySelector({
    required this.onCategorySelected,
    required this.onSubCategorySelected,
    this.hint1,
    this.hint2,
    super.key,
  });

  final String? hint1;
  final String? hint2;
  final void Function(UCategoryResponse? category) onCategorySelected;
  final void Function(UCategoryResponse? subCategory) onSubCategorySelected;

  @override
  State<UCategorySelector> createState() => _UCategorySelectorState();
}

class _UCategorySelectorState extends State<UCategorySelector> {
  final Rx<PageState> pageState = PageState.initial.obs;

  final RxList<UCategoryResponse> categories = <UCategoryResponse>[].obs;
  final RxList<UCategoryResponse> subCategories = <UCategoryResponse>[].obs;

  final Rxn<UCategoryResponse> selectedCategory = Rxn<UCategoryResponse>();
  final Rxn<UCategoryResponse> selectedSubCategory = Rxn<UCategoryResponse>();

  final UCategoryResponse nullCategory = UCategoryResponse(
    id: "___",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    jsonData: UCategoryJson(),
    tags: <int>[],
    title: "___",
  );

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() {
    pageState.loading();
    U.services.category.read(
      p: UCategoryReadParams(
        tags: <int>[TagCategory.dorm.number],
        selectorArgs: const CategorySelectorArgs(
          children: CategorySelectorArgs(),
          childrenDebt: 2,
        ),
      ),
      onOk: (UResponse<List<UCategoryResponse>> res) {
        if (res.result.isNullOrEmpty()) {
          pageState.loaded();
          return;
        }

        categories.assignAll(res.result!);
        categories.insert(0, nullCategory);
        _selectCategory(categories.first);
        pageState.loaded();
      },
      onError: (UResponse<dynamic> res) {
        pageState.error();
        UToast.snackBar(message: res.message);
      },
      onException: (String msg) {
        pageState.error();
        UToast.snackBar(message: msg);
      },
    );
  }

  void _selectCategory(UCategoryResponse category) {
    if (category.id == "___") {
      selectedCategory(category);
      selectedSubCategory(null);
      widget.onCategorySelected(null);
      _selectSubCategory(null);
      return;
    }
    selectedCategory(category);
    widget.onCategorySelected(category);

    final List<UCategoryResponse> children = category.children ?? <UCategoryResponse>[];
    subCategories.assignAll(children);
    subCategories.insert(0, nullCategory);

    if (children.isNotEmpty) {
      _selectSubCategory(children.first);
    } else {
      selectedSubCategory.value = null;
      _selectSubCategory(null);
    }
  }

  void _selectSubCategory(UCategoryResponse? subCategory) {
    selectedSubCategory.value = subCategory;
    widget.onSubCategorySelected(subCategory);
  }

  @override
  Widget build(BuildContext context) => Obx(
    () {
      if (pageState.isLoading()) {
        return const CircularProgressIndicator().alignAtCenter();
      }

      return Column(
        children: <Widget>[
          UTextFieldAutoComplete<UCategoryResponse>(
            hintText: widget.hint1,
            selectedItem: selectedCategory.value!,
            items: categories,
            labelBuilder: (UCategoryResponse i) => i.title,
            onChanged: (UCategoryResponse? i) {
              if (i != null) {
                _selectCategory(i);
              }
            },
          ).pSymmetric(vertical: 4),
          if (subCategories.isNotEmpty && selectedSubCategory.value != null)
            UTextFieldAutoComplete<UCategoryResponse>(
              hintText: widget.hint2,
              selectedItem: selectedSubCategory.value!,
              items: subCategories,
              labelBuilder: (UCategoryResponse i) => i.title,
              onChanged: (UCategoryResponse? i) {
                if (i != null) {
                  _selectSubCategory(i);
                }
              },
            ).pSymmetric(vertical: 4),
        ],
      );
    },
  );
}
