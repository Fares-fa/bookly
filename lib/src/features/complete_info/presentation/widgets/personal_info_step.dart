import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/features/complete_info/presentation/widgets/gender_option.dart';

class PersonalInfoStep extends StatelessWidget {
  const PersonalInfoStep({
    super.key,
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
                child: GenderOption(
                  label: 'Male',
                  icon: Icons.male,
                  selected: gender == 'male',
                  onTap: () => onGenderSelected('male'),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: GenderOption(
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
