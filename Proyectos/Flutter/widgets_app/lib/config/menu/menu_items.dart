import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
    });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Counter riverpod',
    subTitle: 'Introduccion a riverpod',
    link: '/counter',
    icon:Icons.add
  ),
MenuItem(
    title: 'Botones',
    subTitle: 'varios botones en Flutter',
    link: '/buttons',
    icon:Icons.smart_button_outlined
  ),
MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon:Icons.credit_card
  ),
MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon:Icons.refresh_rounded
  ),
MenuItem(
    title: 'snackbars y diálogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon:Icons.info_outline
  ),
MenuItem(
    title: 'Animated container',
    subTitle: 'Statefull widwet animado',
    link: '/animated',
    icon:Icons.check_box_outline_blank_rounded
  ),
MenuItem(
    title: 'Ui controls',
    subTitle: 'una serie de controles de flutter',
    link: '/ui-controls',
    icon:Icons.car_rental_outlined
  ),
MenuItem(
    title: 'Introducciòn a la aplicación',
    subTitle: 'Tutorial de la app',
    link: '/tutorial',
    icon:Icons.accessibility_rounded
  ),
MenuItem(
    title: 'Infinite scroll y pull',
    subTitle: 'listas infinitas y pull to refresh',
    link: '/infinite',
    icon:Icons.list_alt_outlined
  ),

];