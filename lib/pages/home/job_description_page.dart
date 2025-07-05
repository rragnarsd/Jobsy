import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/providers/favorites_provider.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_buttons.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
          JobInfo(job: job),
          JobDeadline(job: job),
          JobLanguageSkills(job: job),
          JobLocation(job: job),
          JobType(jobType: job.jobType),
          JobProfession(job: job),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class JobInfo extends StatelessWidget {
  const JobInfo({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JobHeader(job: job),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                job.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                job.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
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
                    .map((profession) => JobTag(text: profession))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobTag extends StatelessWidget {
  const JobTag({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: JobsyColors.greyColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class JobType extends StatelessWidget {
  const JobType({super.key, required this.jobType});

  final String jobType;

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
              JobTag(text: jobType),
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
    final local = AppLocalizations.of(context)!;
    final workplace = context.watch<WorkplaceProvider>().getWorkplaceById(
      job.workplaceId,
    );

    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                local.job_location,
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
              GestureDetector(
                onTap: () {
                  if (!job.isRemote) {
                    //TODO - Add Map
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 8,
                  children: [
                    Text(
                      job.isRemote
                          ? local.remote
                          : workplace?.location ?? 'N/A',
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
              ...job.languageSkills.mapIndexed((index, skill) {
                return LanguageItem(
                  job: job,
                  title: skill.title,
                  flagUrl: skill.flagUrl,
                  index: index,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.flagUrl,
    required this.title,
    required this.index,
    required this.job,
  });

  final JobModel job;
  final String flagUrl;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(
        bottom: index < job.languageSkills.length - 1 ? 16 : 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: flagUrl,
                width: 40,
                height: 20,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12),
              Text(title, style: theme.textTheme.bodyLarge),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: JobsyColors.greyColor),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  local.requirement,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ],
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
                child: AppIconElevatedButton(
                  text: local.apply,
                  icon: Icons.person,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 8),
              JobSaveAndSharebtns(jobId: job.id),
            ],
          ),
        ),
      ),
    );
  }
}

class JobSaveAndSharebtns extends StatelessWidget {
  const JobSaveAndSharebtns({super.key, required this.jobId});

  final String jobId;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final favoritesProvider = context.watch<FavoritesProvider>();
    final isFavorite = favoritesProvider.favorites.contains(jobId);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: favoritesProvider.isLoading
              ? null
              : () async {
                  if (isFavorite) {
                    await favoritesProvider.removeFavorite(jobId);
                  } else {
                    await favoritesProvider.addFavorite(jobId);
                  }
                },
          icon: Row(
            children: [
              Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : JobsyColors.primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                isFavorite ? local.unsave : local.save,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: shareJob,
          icon: Row(
            children: [
              const Icon(Icons.share, color: JobsyColors.primaryColor),
              const SizedBox(width: 8),
              Text(local.share, style: theme.textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }

  void shareJob() {
    SharePlus.instance.share(
      ShareParams(title: 'Share the latest job', text: 'Check out this job'),
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
              CachedNetworkImage(
                imageUrl: workplace!.logoUrl ?? '',
                width: 100,
                height: 100,
                placeholder: (_, __) =>
                    const Placeholder(fallbackHeight: 100, fallbackWidth: 100),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(workplace.name, style: theme.textTheme.titleLarge),
                  TextButton(
                    style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () =>
                        context.push('/workplace-details/${workplace.id}'),
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
