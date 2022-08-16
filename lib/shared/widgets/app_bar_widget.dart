import 'package:flutter/material.dart';

class SharedAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final List<Widget> actions;

  final Widget? leading;

  const SharedAppBarWidget({
    Key? key,
    required this.actions,
   
    this.leading,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
    );
  }
}
