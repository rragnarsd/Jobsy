import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class JobDescriptionPage extends StatelessWidget {
  const JobDescriptionPage({super.key, required this.jobId});

  final String jobId;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final job = context.watch<WorkplaceProvider>().getJobById(jobId);

    if (job == null) {
      return Scaffold(
        appBar: AppBar(title: Text(local.job_description)),
        body: Center(child: Text(local.job_not_found)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(local.job_description),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: JobsyColors.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobHeader(job: job),
                  JobTitle(job: job),
                  JobDescription(job: job),
                  const SizedBox(height: 8),
                  Divider(
                    endIndent: 16,
                    indent: 16,
                    color: JobsyColors.greyColor.withValues(alpha: 0.3),
                  ),
                  JobResponsibility(job: job),
                  Divider(
                    endIndent: 16,
                    indent: 16,
                    color: JobsyColors.greyColor.withValues(alpha: 0.3),
                  ),
                  JobQualification(job: job),
                ],
              ),
            ),
          ),
          JobDeadline(job: job),
          JobLanguageSkills(job: job),
          JobLocation(job: job),
          JobType(job: job),
          JobProfession(job: job),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class JobProfession extends StatelessWidget {
  const JobProfession({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                local.job_tags,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: job.professions
                    .map(
                      (profession) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: JobsyColors.greyColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Text(
                            profession,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobType extends StatelessWidget {
  const JobType({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                local.job_type,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: JobsyColors.greyColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(job.jobType, style: theme.textTheme.bodyMedium),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobLocation extends StatelessWidget {
  const JobLocation({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final workplace = context.watch<WorkplaceProvider>().getWorkplaceById(
      job.workplaceId,
    );
    //TODO - Add Map
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.job_location,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  color: JobsyColors.greyColor.withValues(alpha: 0.3),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 8,
                children: [
                  Text(
                    job.isRemote ? 'Remote' : workplace?.location ?? 'N/A',
                    style: theme.textTheme.bodyLarge,
                  ),
                  job.isRemote
                      ? const SizedBox.shrink()
                      : const Icon(
                          Icons.keyboard_arrow_right,
                          size: 24,
                          color: JobsyColors.whiteColor,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobLanguageSkills extends StatelessWidget {
  const JobLanguageSkills({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                local.language_skills,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              if (job.languageSkills.isNotEmpty)
                ...List.generate(job.languageSkills.length * 2 - 1, (index) {
                  if (index.isOdd) {
                    return const SizedBox(height: 16);
                  }
                  final skill = job.languageSkills[index ~/ 2];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          const Placeholder(
                            fallbackHeight: 20,
                            fallbackWidth: 40,
                          ),
                          Text(skill, style: theme.textTheme.bodyLarge),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: JobsyColors.greyColor),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              child: Text(
                                local.requirement,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }
}

class JobDeadline extends StatelessWidget {
  const JobDeadline({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local.ad_published,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    job.publishedDate?.toShortFormattedDate() ?? 'N/A',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  color: JobsyColors.greyColor.withValues(alpha: 0.3),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local.application_deadline,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    job.deadline?.toShortFormattedDate() ?? 'N/A',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  color: JobsyColors.greyColor.withValues(alpha: 0.3),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: JobsyColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  label: Text(local.apply, style: theme.textTheme.titleLarge),
                  icon: const Icon(
                    Icons.person,
                    size: 24,
                    color: JobsyColors.whiteColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    //TODO - Add save logic
                    onPressed: () {},
                    icon: Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: JobsyColors.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(local.save, style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  IconButton(
                    //TODO - Add share logic
                    onPressed: () {},
                    icon: Row(
                      children: [
                        const Icon(
                          Icons.share,
                          color: JobsyColors.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(local.share, style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobQualification extends StatelessWidget {
  const JobQualification({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.education_requirements,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          ...job.qualifications.map(
            (qualification) =>
                Text('• $qualification', style: theme.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class JobResponsibility extends StatelessWidget {
  const JobResponsibility({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            local.responsibilities,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          ...job.responsibilities.map(
            (responsibility) =>
                Text('• $responsibility', style: theme.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class JobDescription extends StatelessWidget {
  const JobDescription({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        job.description,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class JobTitle extends StatelessWidget {
  const JobTitle({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(job.title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}

class JobHeader extends StatelessWidget {
  const JobHeader({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final workplace = context.watch<WorkplaceProvider>().getWorkplaceById(
      job.workplaceId,
    );

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Placeholder(fallbackHeight: 100, fallbackWidth: 100),
              //TODO
              //   Image.asset(workplace.logoUrl ?? '', width: 100, height: 100),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workplace?.name ?? 'N/A',
                    style: theme.textTheme.titleLarge,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () =>
                        context.push('/workplace-details/${workplace?.id}'),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.about_company,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: JobsyColors.primaryColor,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_right, size: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
