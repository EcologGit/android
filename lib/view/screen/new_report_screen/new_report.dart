import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/type_and_name_object/type_and_name_object.dart';
import 'package:eco/main.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class NewReportScreen extends StatefulWidget {
  const NewReportScreen({super.key});

  @override
  State<NewReportScreen> createState() => _NewReportScreenState();
}

class _NewReportScreenState extends State<NewReportScreen> {
  @override
  Widget build(BuildContext context) {
    final myRoute = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Новый отчет',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoOfObject(myRoute: myRoute),
              AddingPhoto(),
              DescriptionReport(),
              RatingWidget(),
              WasteWidget(),
              Text('*Поля, обязательные к заполнению'),
              PublishReport(),
            ].withSpaceBetween(height: 12),
          ),
        ),
      ),
    );
  }
}

class InfoOfObject extends StatefulWidget {
  const InfoOfObject({
    required this.myRoute,
    super.key,
  });

  final StackRouter myRoute;

  @override
  State<InfoOfObject> createState() => _InfoOfObjectState();
}

class _InfoOfObjectState extends State<InfoOfObject> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text('Информация об объекте', style: Theme.of(context).textTheme.titleMedium),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 25,
                        )
                      ],
                    ),
                    title: Text('Тип и название объекта'),
                    visualDensity: VisualDensity(vertical: -2),
                    onTap: () {
                      context.pushRoute(TypeAndNameObjectRoute());
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 25,
                    ),
                    title: Text('Точка сортировки'),
                    visualDensity: VisualDensity(vertical: -2),
                    onTap: () {
                      widget.myRoute.push(SelectionSortPointsRoute());
                    },
                  ),
                ].withDividerBetween()),
          ),
        ),
      ],
    );
  }
}

class AddingPhoto extends StatelessWidget {
  const AddingPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Фото *', style: Theme.of(context).textTheme.titleMedium),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: ThemeManager.defaultColorDart),
            onPressed: () {},
            child: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 12,
                  color: Colors.white,
                ),
                Text(
                  'ДОБАВИТЬ ФОТО',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DescriptionReport extends StatelessWidget {
  const DescriptionReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Описание *', style: Theme.of(context).textTheme.titleMedium),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextFormField(
            maxLines: 5,
            minLines: 5,
            maxLength: 300,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              border: InputBorder.none,
              hintText: 'Расскажите, как все прошло',
              hintStyle: TextStyle(
                color: ThemeManager.defaultPlaceholderColor,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Рейтинг',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.routeRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Доступность',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                  height: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '0',
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                      contentPadding: EdgeInsets.only(left: 5),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                    ),
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.natureRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Красота',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                  height: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '0',
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                      contentPadding: EdgeInsets.only(left: 5),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                    ),
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.sortRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Чистота',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                  height: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '0',
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                      contentPadding: EdgeInsets.only(left: 5),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                    ),
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ].withSpaceBetween(height: 12),
        ),
      ),
    );
  }
}

class WasteWidget extends StatelessWidget {
  const WasteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Собранные отходы',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.plasticRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Пластик',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                        ),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    const Text(
                      'кг',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.butteryRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Батарейки',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                        ),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    const Text(
                      'кг',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.lampRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Лампочки',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                        ),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    const Text(
                      'кг',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.paperRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Макулатура',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                        ),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    const Text(
                      'кг',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.metalRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Металл',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                        ),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    const Text(
                      'кг',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.glassRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Стекло',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                        ),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    const Text(
                      'кг',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ].withSpaceBetween(height: 12),
        ),
      ),
    );
  }
}

class PublishReport extends StatelessWidget {
  const PublishReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TypeAndNameObjectBloc(),
      child: BlocBuilder<TypeAndNameObjectBloc, TypeAndNameObjectState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: ThemeManager.defaultColorDart),
                  onPressed: () {
                    context.read<TypeAndNameObjectBloc>().add(CreateReport());
                  },
                  child: const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    children: [
                      Icon(
                        Icons.upload,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        'ОПУБЛИКОВАТЬ',
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 0.4, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Wrap(
                  spacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.save,
                      size: 16,
                    ),
                    Text('СОХРАНИТЬ ЧЕРНОВИК')
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
