import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';

class CustomRouter {
  static final _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static BuildContext get context => _navigatorKey.currentContext!;

  late final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  static Future<T?> push<T extends Object>(
    String routeName, {
    Object? arguments,
  }) async {
    var result = await _navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );

    return result as T?;
  }

  static bool canPop() => _navigatorKey.currentState!.canPop();

  static void pop<T extends Object?>([T? result]) =>
      _navigatorKey.currentState!.pop<T>(result);

  static Future<T?> replace<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigatorKey.currentState!.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  static Future<T?> pushNewStack<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  }) {
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
      newRouteName,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future<T?> popAndPush<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigatorKey.currentState!.popAndPushNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  static Future<T?> showBottomSheet<T>(
    Widget Function(BuildContext) builder, {
    bool? enableDrag,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool? isDismissible,
    Color? backgroundColor,
    bool? useRootNavigator,
    bool? isScrollControlled,
    BoxConstraints? constraints,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      elevation: elevation,
      constraints: constraints,
      barrierColor: barrierColor,
      routeSettings: routeSettings,
      enableDrag: enableDrag ?? true,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible ?? true,
      useRootNavigator: useRootNavigator ?? false,
      isScrollControlled: isScrollControlled ?? false,
      clipBehavior: clipBehavior ?? Clip.antiAliasWithSaveLayer,
      transitionAnimationController: transitionAnimationController,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
      builder: builder,
    );
  }

  static Future<T?> showModal<T>(
    Widget content, {
    String? title,
    List<Widget>? actions,
    bool dismissable = true,
  }) =>
      showDialog<T?>(
        barrierDismissible: dismissable,
        context: _navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () => Future.value(dismissable),
            child: AlertDialog(
              content: content,
              scrollable: true,
              actions: actions,
              contentPadding: const EdgeInsets.all(20),
              title: title != null
                  ? Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.neutralMain500,
                      ),
                    )
                  : null,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          );
        },
      );
}
