// import '../main.dart';

import 'package:flash_cards/domain/models/flash_group.dart';
import 'package:forui/forui.dart';

import '../../main.dart';

final newFlashGroupBloc = NewFlashGroupBloc();

class NewFlashGroupBloc {
  final flashGroupRM = RM.inject(() => FlashGroup());

  FlashGroup flashGroup([FlashGroup? _flashGroup]) {
    if (_flashGroup != null) {
      flashGroupRM
        ..state = _flashGroup
        ..notify();
    }
    return flashGroupRM.state;
  }

  void success() => navigator.back(flashGroup());
  void cancel() => navigator.back();

  void name(String name) => flashGroup(flashGroup()..name = name);
}

class NewFlashGroupDialog extends UI {
  const NewFlashGroupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return FDialog(
      title: 'New FlashGroup'.text(),
      direction: Axis.horizontal,
      body: Column(
        children: [
          FTextField(
            initialValue: newFlashGroupBloc.flashGroup().name,
            minLines: 2,
            maxLines: 3,
            onChange: newFlashGroupBloc.name,
          ).pad(),
          // FTileGroup.builder(
          //   divider: FTileDivider.full,
          //   maxHeight: 200,
          //   count: Colors.primaries.length,
          //   tileBuilder: (context, index) {
          //     final color = Colors.primaries.elementAt(index);
          //     return FTile(
          //       enabled: color != newFlashGroupBloc.flashGroup().color,
          //       title: color.colorName.text(),
          //       onPress: () => newFlashGroupBloc.color(color),
          //     );
          //   },
          // ).pad(),
        ],
      ),
      actions: [
        FButton.icon(
          child: FIcon(FAssets.icons.saveOff),
          onPress: newFlashGroupBloc.cancel,
        ),
        FButton.icon(
          child: FIcon(FAssets.icons.save),
          onPress: newFlashGroupBloc.success,
        ),
      ],
    );

    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     // final FormController controller = FormController();
    //     return AlertDialog(
    //       title: const Text('Edit profile'),
    //       content: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const Text(
    //               'Make changes to your profile here. Click save when you\'re done'),
    //           // const Gap(16),
    //           // ConstrainedBox(
    //           //   constraints: const BoxConstraints(maxWidth: 400),
    //           //   child: Form(
    //           //     // controller: controller,
    //           //     child: const FormTableLayout(
    //           //       rows: [
    //           //         FormField<String>(
    //           //           key: FormKey(#name),
    //           //           label: Text('Name'),
    //           //           child: TextField(
    //           //             initialValue: 'Thito Yalasatria Sunarya',
    //           //           ),
    //           //         ),
    //           //         // FormField<String>(
    //           //         //   key: FormKey(#username),
    //           //         //   label: Text('Username'),
    //           //         //   child: TextField(
    //           //         //     initialValue: '@sunaryathito',
    //           //         //   ),
    //           //         // ),
    //           //       ],
    //           //     ),
    //           //   ).withPadding(vertical: 16),
    //           // ),
    //         ],
    //       ),
    //       actions: [
    //         // PrimaryButton(
    //         //   child: const Text('Save changes'),
    //         //   onPressed: () {
    //         //     Navigator.of(context).pop(controller.values);
    //         //   },
    //         // ),
    //       ],
    //     );
    //   },
    // );

    // return Dialog(
    //     // title: 'new flash_group'.text(),
    //     // child: ShadSelect<MaterialColor>(
    //     //   placeholder: Text('placeholder'),
    //     //   initialValue: newFlashGroup().color,
    //     //   options: Colors.primaries.map(
    //     //     (color) {
    //     //       return ShadOption(
    //     //         value: color,
    //     //         child: color.colorName.toLowerCase().text(),
    //     //       );
    //     //     },
    //     //   ).toList(),
    //     //   selectedOptionBuilder: (context, value) =>
    //     //       value.colorName.toLowerCase().text(),
    //     //   onChanged: (color) {
    //     //     newFlashGroup(
    //     //       newFlashGroup()..color = color!,
    //     //     );
    //     //   },
    //     // ).pad(),
    //     // description: ShadInput(
    //     //   placeholder: Text('name of flash_group'),
    //     //   initialValue: newFlashGroup().name,
    //     //   onChanged: (name) => newFlashGroup(newFlashGroup()..name = name),
    //     // ).pad(),
    //     // actions: [
    //     //   ShadButton(
    //     //     backgroundColor: newFlashGroup().color,
    //     //     icon: Icon(
    //     //       Icons.save,
    //     //     ),
    //     //     onPressed: () {
    //     //       RM.navigate.back(newFlashGroup());
    //     //     },
    //     //     child: 'save flash_group'.text(),
    //     //   ).pad(),
    //     // ],
    //     );
  }
}
