import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/shared/widgets/primary_button.dart';
import 'package:bookly/src/features/complete_info/presentation/widgets/complete_info_header.dart';

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
                    ? _PersonalInfoStep(
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
                    : _InterestsStep(
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

class _PersonalInfoStep extends StatelessWidget {
  const _PersonalInfoStep({
    required this.formKey,
    required this.tt,
    required this.nameController,
    required this.dateOfBirth,
    required this.gender,
    required this.showDateOfBirthError,
    required this.showGenderError,
    required this.onPickDateOfBirth,
    required this.onGenderSelected,
  });

  final GlobalKey<FormState> formKey;
  final TextTheme tt;
  final TextEditingController nameController;
  final DateTime? dateOfBirth;
  final String? gender;
  final bool showDateOfBirthError;
  final bool showGenderError;
  final VoidCallback onPickDateOfBirth;
  final ValueChanged<String> onGenderSelected;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Complete Your Information',
              style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w600)),
          const Text(
              'Add your name and details to personalize your experience'),
          SizedBox(height: 24.h),
          TextFormField(
            decoration: const InputDecoration(
                hint: Text('Enter your full name'),
                fillColor: Colors.transparent),
            controller: nameController,
            textInputAction: TextInputAction.next,
            validator: (value) => (value == null || value.trim().isEmpty)
                ? 'Please enter your full name'
                : null,
          ),
          SizedBox(height: 16.h),
          InkWell(
            onTap: onPickDateOfBirth,
            child: InputDecorator(
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                isDense: true,
                suffixIcon: const Icon(Icons.calendar_today_outlined),
                errorText: showDateOfBirthError
                    ? 'Please select your date of birth'
                    : null,
              ),
              child: SizedBox(
                height: 30,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dateOfBirth == null
                        ? 'Select your date of birth'
                        : '${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}',
                    style: tt.bodyMedium?.copyWith(
                        color: dateOfBirth == null
                            ? cs.onSurfaceVariant
                            : cs.onSurface),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text('Gender', style: tt.bodyLarge),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: _GenderOption(
                  label: 'Male',
                  icon: Icons.male,
                  selected: gender == 'male',
                  onTap: () => onGenderSelected('male'),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _GenderOption(
                  label: 'Female',
                  icon: Icons.female,
                  selected: gender == 'female',
                  onTap: () => onGenderSelected('female'),
                ),
              ),
            ],
          ),
          if (showGenderError) ...[
            SizedBox(height: 8.h),
            Text('Please select your gender',
                style: tt.bodySmall?.copyWith(color: cs.error)),
          ],
        ],
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: AnimatedContainer(
        height: 50,
        duration: Durations.short1,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selected ? cs.primary : cs.outlineVariant,
            width: selected ? 2 : 1,
          ),
          color: selected ? cs.primary.withValues(alpha: 0.08) : null,
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Icon(icon, color: selected ? cs.primary : cs.onSurfaceVariant),
              Text(label,
                  style: tt.bodyMedium?.copyWith(
                      color: selected ? cs.primary : cs.onSurfaceVariant,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}

class _InterestsStep extends StatelessWidget {
  const _InterestsStep({
    required this.tt,
    required this.interests,
    required this.selectedInterests,
    required this.onToggleInterest,
  });

  final TextTheme tt;
  final List<({String label, String emoji})> interests;
  final Set<String> selectedInterests;
  final ValueChanged<String> onToggleInterest;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose Your Interests',
            style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w600)),
        const Text('Get specific about things you love'),
        SizedBox(height: 24.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: [
            for (final interest in interests)
              _InterestOption(
                label: interest.label,
                emoji: interest.emoji,
                selected: selectedInterests.contains(interest.label),
                onTap: () => onToggleInterest(interest.label),
              ),
          ],
        ),
      ],
    );
  }
}

class _InterestOption extends StatelessWidget {
  const _InterestOption({
    required this.label,
    required this.emoji,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String emoji;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(50.r),
      onTap: onTap,
      child: AnimatedContainer(
        duration: Durations.short1,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(
            color: selected ? cs.primary : cs.outlineVariant,
            width: selected ? 2 : 1,
          ),
          color: selected ? cs.primary.withValues(alpha: 0.08) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
            Text(label,
                style: tt.bodyMedium?.copyWith(
                    color: selected ? cs.primary : cs.onSurfaceVariant,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
