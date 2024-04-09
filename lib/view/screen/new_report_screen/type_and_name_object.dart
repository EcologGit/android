import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/type_and_name_object/type_and_name_object.dart';
import 'package:flutter/material.dart';

import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TypeAndNameObjectScreen extends StatefulWidget {
  const TypeAndNameObjectScreen({super.key});

  @override
  State<TypeAndNameObjectScreen> createState() => _TypeAndNameObjectScreenState();
}

class CheckboxValueClass {
  String name;
  typeOfObjects id;
  CheckboxValueClass({
    required this.name,
    required this.id,
  });

  CheckboxValueClass copyWith({
    String? name,
    typeOfObjects? id,
  }) {
    return CheckboxValueClass(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}

enum typeOfObjects { place, route, event }

class _TypeAndNameObjectScreenState extends State<TypeAndNameObjectScreen> {
  List<CheckboxValueClass> checkboxValues = [
    CheckboxValueClass(name: 'Место', id: typeOfObjects.place),
    CheckboxValueClass(name: 'Маршрут', id: typeOfObjects.route),
    CheckboxValueClass(name: 'Мероприятие', id: typeOfObjects.event)
  ];

  typeOfObjects place = typeOfObjects.place;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    /// Ищем пользователей по поиске
    void searchObject(
        {required final int index, required final BuildContext context, final String text = ''}) {
      return switch (index) {
        0 => context.read<TypeAndNameObjectBloc>().add(SearchPlace(search: text)),
        1 => context.read<TypeAndNameObjectBloc>().add(SearchRoute(search: text)),
        2 => context.read<TypeAndNameObjectBloc>().add(SearchEvent(search: text)),
        _ => context.read<TypeAndNameObjectBloc>().add(SearchPlace(search: text)),
      };
    }

    return BlocProvider(
        create: (context) => TypeAndNameObjectBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Тип объекта',
              style: TextStyle(fontSize: 20),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(children: [
              Container(
                height: 145,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 45,
                      child: RadioListTile<typeOfObjects>(
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: Colors.white,
                        fillColor: const MaterialStatePropertyAll<Color?>(ThemeManager.activeColor),
                        hoverColor: Colors.white,
                        overlayColor: const MaterialStatePropertyAll<Color?>(Colors.white),
                        title: Text(checkboxValues[index].name),
                        value: checkboxValues[index].id,
                        groupValue: place,
                        onChanged: (typeOfObjects? value) {
                          setState(() {
                            place = value!;
                            currentIndex = index;
                          });
                          controller.clear();
                        },
                      ),
                    );
                  },
                  itemCount: 3,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    indent: 20,
                  ),
                ),
              ),
              SizedBox(height: 50),
              BlocBuilder<TypeAndNameObjectBloc, TypeAndNameObjectState>(
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (final String value) =>
                        searchObject(text: value, context: context, index: currentIndex),
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
                              searchObject(text: nameOfObject, context: context, index: currentIndex);
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
