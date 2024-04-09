import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/type_and_name_object/type_and_name_object.dart';
import 'package:eco/bloc/type_and_name_object/type_and_name_object_event.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SelectionSortPointsScreen extends StatefulWidget {
  const SelectionSortPointsScreen({super.key});

  @override
  State<SelectionSortPointsScreen> createState() => _SelectionSortPointsScreenState();
}

class _SelectionSortPointsScreenState extends State<SelectionSortPointsScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    /// Ищем пользователей по поиске
    void searchObject({required final BuildContext context, final String text = ''}) {
      context.read<TypeAndNameObjectBloc>().add(SearchSortPoints(search: text));
    }

    return BlocProvider(
        create: (context) => TypeAndNameObjectBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Точка сортировки',
              style: TextStyle(fontSize: 20),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(children: [
              BlocBuilder<TypeAndNameObjectBloc, TypeAndNameObjectState>(
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (final String value) => searchObject(text: value, context: context),
                    controller: controller,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                            color: ThemeManager.defaultPlaceholderColor,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                            color: ThemeManager.defaultPlaceholderColor,
                          )),
                      hintText: 'Поиск',
                      hintStyle: TextStyle(
                        color: ThemeManager.defaultPlaceholderColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Flexible(
                child: BlocBuilder<TypeAndNameObjectBloc, TypeAndNameObjectState>(
                  builder: (context, state) {
                    if (state is TypeAndNameObjectSuccess) {
                      return ListView.separated(
                        itemBuilder: (final BuildContext context, final int index) {
                          final String nameOfObject = state.data[index].name;
                          return InkWell(
                            onTap: () {
                              controller.text = nameOfObject;
                              searchObject(text: nameOfObject, context: context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              child: Text(nameOfObject),
                            ),
                          );
                        },
                        itemCount: state.data.length,
                        separatorBuilder: (final BuildContext context, final int index) {
                          return const Divider(height: 1);
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}
