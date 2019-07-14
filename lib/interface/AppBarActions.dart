import 'package:flutter/material.dart';

/// This interface should be used for every widget. It contains the actions of a view.
abstract class AppBarActionsBase extends Widget {
  /// This method returns the actions of a widget.
  List<Widget> getAppBarActions();
}

abstract class AppBarActionsStateful extends StatefulWidget
    implements AppBarActionsBase {
  const AppBarActionsStateful({Key key}) : super(key: key);
}

abstract class AppBarActionsStateless extends StatelessWidget
    implements AppBarActionsBase {
  const AppBarActionsStateless({Key key}) : super(key: key);
}
