import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/z_general_controller.dart';
import 'package:mtax24/model/z_general_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class TextInput extends StatefulWidget with GetItStatefulWidgetMixin {
  final String hintText, errorText;
  final bool obscureText, haveBorder, showCursor, readOnly, multiLines, isRequired, isShowDialogOneInput;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final Function onChangedCustom;
  final Function onToggleCustom;
  final List<TextInputFormatter> formats;
  final int maxLength;
  TextInput({Key key, this.hintText, this.errorText, this.obscureText, this.haveBorder, this.showCursor, this.readOnly, this.multiLines, this.isRequired, this.textInputType, @required this.textEditingController, this.onChangedCustom, this.onToggleCustom, this.formats, this.maxLength, this.isShowDialogOneInput}) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> with GetItStateMixin {

  var generalController = GetIt.I<GeneralController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isShowDialogOneInput != null && widget.isShowDialogOneInput) {
      generalController.setToggleObscureInput(toggleObscureInput: widget.obscureText ?? false);
      generalController.setErrorText(errorText: widget.errorText ?? "");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if(widget.isShowDialogOneInput != null && widget.isShowDialogOneInput) {
      generalController.setToggleObscureInput(toggleObscureInput: false);
      generalController.setErrorText(errorText: "");
      widget.textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {

    final toggleObscureInput = watchX((GeneralModel x) => x.toggleObscureInput);
    final errorText = watchX((GeneralModel x) => x.errorText);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height_8),
          child: Stack(
            alignment: Alignment(.9, 0),
            children: [
              widget.isRequired != null && widget.isRequired ? Text("*", style: text60spRed) : Container(),
              TextField(
                maxLines: widget.multiLines == null || widget.multiLines == false ? 1 : null,
                obscureText:  widget.isShowDialogOneInput != null && widget.isShowDialogOneInput ? toggleObscureInput : (widget.obscureText ?? false),
                showCursor: widget.showCursor ?? false,
                maxLength: widget.maxLength ?? null,
                readOnly: widget.readOnly ?? false,
                inputFormatters: widget.formats ?? null,
                controller: widget.textEditingController,
                // style: text_fontsize14_black,
                keyboardType: widget.textInputType ?? TextInputType.text,
                decoration: InputDecoration(
                    isDense: true,
                    errorText: widget.isShowDialogOneInput != null && widget.isShowDialogOneInput ? (errorText.isEmpty ? null : errorText) : widget.errorText,
                    suffixIcon: widget.obscureText == null
                        ? null
                        : InkWell(
                        onTap: () {
                          if(widget.onToggleCustom != null) {
                            widget.onToggleCustom();
                          } else {
                            generalController.setToggleObscureInput(toggleObscureInput: !toggleObscureInput);
                          }
                        },
                        child: Icon(
                            (widget.isShowDialogOneInput != null && widget.isShowDialogOneInput ? toggleObscureInput : widget.obscureText)
                                ? Icons.remove_red_eye_rounded
                                : Icons.visibility_off,
                            color: Colors.grey.shade800)),
                    counterText: "",
                    labelText: widget.hintText,
                    hintStyle: text_label_in_register,
                    labelStyle: TextStyle(color: Colors.grey.shade800),
                    border: widget.haveBorder == null || widget.haveBorder == false
                        ? null
                        : OutlineInputBorder()),
                onChanged: (_) {
                  if(widget.textEditingController.text.isNotEmpty) {
                    generalController.setErrorText(errorText: "");
                  }
                  if(widget.onChangedCustom != null) {
                    widget.onChangedCustom(_);
                  }
                } ,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TextFieldNormalInput extends StatelessWidget {
  final String title, hintText, contentDialog, errorText;
  final bool isShowDialog,
      isRequired,
      obscureText,
      haveBorder,
      showCursor,
      readOnly,
      multiLines;

  final TextInputType textInputType;
  final TextInputType textInputAction;
  final TextEditingController textEditingController;
  final Function onChangedCustom;
  final Function onSubmittedCustom;
  final Function onToggleCustom;
  const TextFieldNormalInput(
      {Key key,
        this.title,
        this.hintText,
        this.contentDialog,
        this.errorText,
        this.isShowDialog,
        this.isRequired,
        this.obscureText,
        this.haveBorder,
        this.textInputType,
        this.textInputAction,
        this.textEditingController,
        this.onChangedCustom,
        this.onSubmittedCustom,
        this.onToggleCustom,
        this.multiLines,
        this.showCursor,
        this.readOnly,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Stack(
            children: [
              TextField(
                maxLines:
                multiLines == null || multiLines == false
                    ? 1
                    : null,
                obscureText: obscureText ?? false,
                showCursor: showCursor ?? false,
                readOnly: readOnly ?? false,
                controller: textEditingController,

                textInputAction: textInputAction ?? TextInputAction.done,
                // style: text_fontsize14_black,
                keyboardType: textInputType ?? TextInputType.text,
                decoration: InputDecoration(
                    isDense: true,
                    errorText: errorText,
                    suffixIcon: obscureText == null
                        ? null
                        : InkWell(
                        onTap: () {
                          onToggleCustom();
                        },
                        child: Icon(
                            obscureText
                                ? Icons.remove_red_eye_rounded
                                : Icons.visibility_off,
                            color: Colors.grey.shade800)),
                    labelText: hintText,
                    hintStyle: text_label_in_register,
                    labelStyle: TextStyle(color: Colors.grey.shade800),
                    border: haveBorder == null || haveBorder == false
                        ? null
                        : OutlineInputBorder()),
                onChanged: onChangedCustom,
                onSubmitted: onSubmittedCustom,
              ),
            ],
          ),
        ),
      ],
    );
  }
}