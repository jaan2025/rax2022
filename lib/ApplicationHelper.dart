import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class ApplicationHelper {
  static  ProgressDialog ? pr;
  static showProgressDialog(BuildContext context) async {
    /* Timer(
         const Duration(seconds: 60),
             () => dismissProgressDialog());*/
    pr = ProgressDialog(context, type: ProgressDialogType.normal,
        isDismissible: true,
        showLogs: false);
    pr!.style(
        message: 'Please wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: const CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: const TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    await pr!.show();

  }

  static dismissProgressDialog() async {
    if(pr!.isShowing()) {
      pr!.hide();
    }
  }
}