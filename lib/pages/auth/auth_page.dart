import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleAuthMode() {
    final authProvider = context.read<AuthProvider>();
    authProvider.clearError();
    authProvider.toggleAuthMode();
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      authProvider.isRegister
                          ? 'Create Account'
                          : 'Welcome Back',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      authProvider.isRegister
                          ? 'Sign up to get started with Jobsy'
                          : 'Sign in to continue with Jobsy',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: JobsyColors.greyColor.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    AppTextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Icon(Icons.email),
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value?.emailError,
                    ),
                    const SizedBox(height: 16.0),
                    AppTextFormField(
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      prefixIcon: const Icon(Icons.lock),
                      suffix: GestureDetector(
                        onTap: authProvider.togglePasswordVisibility,
                        child: Icon(
                          !authProvider.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      labelText: 'Password',
                      obscureText: authProvider.obscurePassword,
                      validator: (value) => value?.passwordError,
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: authProvider.isLoading ? null : submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: JobsyColors.primaryColor,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: authProvider.isLoading
                            ? const SizedBox(
                                width: 26,
                                height: 26,
                                child: CircularProgressIndicator(
                                  color: JobsyColors.whiteColor,
                                  strokeWidth: 3,
                                ),
                              )
                            : Text(
                                authProvider.isRegister
                                    ? 'Register'
                                    : 'Sign In',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: JobsyColors.whiteColor,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: authProvider.isRegister
                                ? 'Already have an account?'
                                : 'Don\'t have an account?',
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = _toggleAuthMode,
                            text: authProvider.isRegister
                                ? ' Sign In'
                                : ' Register',
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

    final authProvider = context.read<AuthProvider>();

    authProvider.clearError();

    if (authProvider.isRegister) {
      await authProvider.signUpWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } else {
      await authProvider.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }

    if (authProvider.authErrorMessage != null) {
      if (!mounted) return;

      context.showToast(
        title: authProvider.authErrorMessage!,
        type: ToastType.error,
        textColor: JobsyColors.whiteColor,
        backgroundColor: JobsyColors.errorColor,
        duration: const Duration(seconds: 5),
      );
      return;
    }

    if (!mounted) return;
    context.go('/home');
  }
}
