import 'package:clothes/data/repositories/authentication/authentication_repository.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:clothes/util/login_signup/network_manager.dart';
import 'package:clothes/util/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? "";
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? "";
    super.onInit();
  }

  /// Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in....', TImages.productImage3);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if(!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data If Remember Me is selected
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}