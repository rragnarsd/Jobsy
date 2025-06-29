import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isRegisterMode = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _toggleAuthMode() {
    context.read<AuthUserProvider>().clearError();
    setState(() {
      _isRegisterMode = !_isRegisterMode;
      _formKey.currentState?.reset();
    });
  }

  void _togglePasswordVisibility() =>
      setState(() => _obscurePassword = !_obscurePassword);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Consumer<AuthUserProvider>(
              builder: (context, authProvider, child) {
                final isLoading =
                    authProvider.status == AuthStatus.authenticating;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isRegisterMode ? 'Create Account' : 'Welcome Back',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isRegisterMode
                          ? 'Sign up to get started with Jobsy'
                          : 'Sign in to continue with Jobsy',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: JobsyColors.greyColor.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 32),
                    AppTextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Icon(Icons.email),
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value?.emailError,
                    ),
                    const SizedBox(height: 16),
                    AppTextFormField(
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      prefixIcon: const Icon(Icons.lock),
                      suffix: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      labelText: 'Password',
                      obscureText: _obscurePassword,
                      validator: (value) => value?.passwordError,
                    ),
                    const SizedBox(height: 16),
                    if (_isRegisterMode) ...[
                      AppTextFormField(
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Name',
                        keyboardType: TextInputType.name,
                        validator: (value) => null,
                      ),
                      const SizedBox(height: 16),
                      AppTextFormField(
                        controller: _phoneNumberController,
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(Icons.phone),
                        labelText: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        validator: (value) => null,
                      ),
                      const SizedBox(height: 20),
                    ],
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: JobsyColors.primaryColor,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 26,
                                height: 26,
                                child: CircularProgressIndicator(
                                  color: JobsyColors.whiteColor,
                                  strokeWidth: 3,
                                ),
                              )
                            : Text(
                                _isRegisterMode ? 'Register' : 'Sign In',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: JobsyColors.whiteColor,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _isRegisterMode
                                ? 'Already have an account?'
                                : 'Don\'t have an account?',
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = _toggleAuthMode,
                            text: _isRegisterMode ? ' Sign In' : ' Register',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: JobsyColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthUserProvider>();
    authProvider.clearError();

    await authProvider.authenticate(
      register: _isRegisterMode,
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      name: _nameController.text.trim(),
      phoneNumber: _phoneNumberController.text.trim(),
    );

    if (!mounted) return;

    final error = authProvider.authErrorMessage;
    if (error != null) {
      context.showToast(
        title: error,
        type: ToastType.error,
        backgroundColor: JobsyColors.errorColor,
        textColor: JobsyColors.whiteColor,
        duration: const Duration(seconds: 5),
      );
    }
  }
}
