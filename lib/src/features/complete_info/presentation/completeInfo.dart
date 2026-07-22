import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/shared/widgets/primary_button.dart';
import 'package:bookly/src/features/complete_info/presentation/widgets/complete_info_header.dart';
import 'package:bookly/src/features/complete_info/presentation/widgets/personal_info_step.dart';
import 'package:bookly/src/features/complete_info/presentation/widgets/interests_step.dart';

class CompleteInfo extends StatefulWidget {
  const CompleteInfo({super.key});

  @override
  State<CompleteInfo> createState() => _CompleteInfoState();
}

class _CompleteInfoState extends State<CompleteInfo> {
  int _step = 0;

  final _personalInfoFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  DateTime? _dateOfBirth;
  String? _gender;
  bool _showDateOfBirthError = false;
  bool _showGenderError = false;

  final Set<String> _selectedInterests = {};

  static const _interests = [
    (label: 'Food', emoji: '🍔'),
    (label: 'Cafes', emoji: '☕'),
    (label: 'Hotels', emoji: '🏨'),
    (label: 'Spa & Wellness', emoji: '💆'),
    (label: 'Bars', emoji: '🍸'),
    (label: 'Shopping', emoji: '🛍️'),
    (label: 'Lab Test', emoji: '🔬'),
  ];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickDateOfBirth() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(now.year - 100),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _dateOfBirth = picked;
        _showDateOfBirthError = false;
      });
    }
  }

  void _handleContinueFromPersonalInfo() {
    final isFormValid = _personalInfoFormKey.currentState?.validate() ?? false;
    setState(() {
      _showDateOfBirthError = _dateOfBirth == null;
      _showGenderError = _gender == null;
    });
    if (isFormValid && _dateOfBirth != null && _gender != null) {
      setState(() => _step = 1);
    }
  }

  void _toggleInterest(String label) {
    setState(() {
      if (_selectedInterests.contains(label)) {
        _selectedInterests.remove(label);
      } else {
        _selectedInterests.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tt = context.theme.textTheme;
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompleteInfoHeader(
                step: _step,
                showBackButton: _step > 0,
                onBack: () => setState(() => _step = 0),
              ),
              SizedBox(height: AppSpacing.lg.w),
              Expanded(
                child: _step == 0
                    ? PersonalInfoStep(
                        formKey: _personalInfoFormKey,
                        tt: tt,
                        nameController: _nameController,
                        dateOfBirth: _dateOfBirth,
                        gender: _gender,
                        showDateOfBirthError: _showDateOfBirthError,
                        showGenderError: _showGenderError,
                        onPickDateOfBirth: _pickDateOfBirth,
                        onGenderSelected: (gender) => setState(() {
                          _gender = gender;
                          _showGenderError = false;
                        }),
                      )
                    : InterestsStep(
                        tt: tt,
                        interests: _interests,
                        selectedInterests: _selectedInterests,
                        onToggleInterest: _toggleInterest,
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PrimaryButton(
            label: 'Continue',
            onPressed: _step == 0
                ? _handleContinueFromPersonalInfo
                : (_selectedInterests.isEmpty
                    ? null
                    : () => GoRouter.of(context).go(AppRoutes.home)),
            isFullWidth: true,
          ),
        ),
      ),
    );
  }
}
