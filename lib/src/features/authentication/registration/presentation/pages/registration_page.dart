
import 'package:fake_ecommerce/src/features/authentication/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constant/constant_values.dart';
import '../../../core/data/data_source/local_data_sources/user_registration_data_source_impl.dart';
import '../../../core/data/models/registration_data_model.dart';
import '../providers/registration_provider.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<RegistrationPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<RegistrationPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight =  MediaQuery.of(context).size.height;
    final userRegistration = ref.watch(registrationProvider);
    final setRegistration = ref.read(registrationProvider);
    final authStatus = ref.watch(authProvider);

    return authStatus.when(
        data: (data){
          if(data == true){
            return const LoginPage();
          }else{
            return  GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign Up',
                                style: GoogleFonts.outfit(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Material(
                            elevation: 3,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: Container(
                              alignment: Alignment.center,
                              height: 59,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextFormField(
                                controller: _nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.person_outline,
                                    color: Colors.black,
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 22, top: 15),
                                  hintText: "Username",
                                  hintStyle: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Material(
                            elevation: 3,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: Container(
                              alignment: Alignment.center,
                              height: 59,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.black,
                                  ),
                                  contentPadding:
                                  const EdgeInsets.only(left: 22, top: 15),
                                  hintText: "Email",
                                  hintStyle: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Material(
                            elevation: 3,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: Container(
                              alignment: Alignment.center,
                              height: 59,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextField(
                                controller: _phoneNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.phone_outlined,
                                    color: Colors.black,
                                  ),
                                  contentPadding:
                                  const EdgeInsets.only(left: 22, top: 15),
                                  hintText: "Phone Number",
                                  hintStyle: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Material(
                            elevation: 3,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: Container(
                              alignment: Alignment.center,
                              height: 59,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.black,
                                  ),
                                  contentPadding:
                                  const EdgeInsets.only(left: 22, top: 15),
                                  hintText: "Password",
                                  hintStyle: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () async {

                              final regModel = RegistrationDataModel(
                                  userName:_nameController.text ,
                                  email: _emailController.text,
                                  password:   _passwordController.text,
                                  phoneNumber: _phoneNumberController.text);
                              setRegistration.register(regModel);
                              HapticFeedback.heavyImpact();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xffff7f56),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
        error: (err, stack) => const Text('Error'),
        loading: () => const Center(child: CircularProgressIndicator(),)

    );
  }
}


