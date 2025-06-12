import 'package:codehatch/pages/job_description_page.dart';
import 'package:codehatch/widgets/job_dropdown_btn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF6D00),
        title: const Text(
          'CodeHatch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 12,
                children: const [
                  CategoryChip(
                    icon: Icons.work_outline,
                    label: 'Öll störf',
                    isSelected: true,
                  ),
                  CategoryChip(
                    icon: Icons.school_outlined,
                    label: 'Öll námskeið',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          AppSearchBar(),
          AppDivider(),
          AppJobList(),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(child: Divider()),
            Expanded(child: JobDropdownButton()),
            Expanded(child: Divider()),
          ],
        ),
      ),
    );
  }
}

class AppJobList extends StatelessWidget {
  const AppJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) => JobCard(),
      separatorBuilder: (context, index) => SizedBox(height: 12),
    );
  }
}

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF2F2F2),
                  hintText: 'Leita…',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xffFF6D00),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.tune, size: 20),
              label: const Text(
                'Síur',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(34),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(34),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? const Color(0xffFF6D00) : Colors.white,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? const Color(0xffFF6D00) : Colors.white,
              ),
            ),
            const SizedBox(width: 2),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: isSelected ? const Color(0xffFF6D00) : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const JobDescriptionPage()),
      ),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.work, color: Colors.blue),
                      Text(
                        'Fyrirtæki',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.favorite, color: Colors.orange),
                      Text('TimeAgo', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text('Starfsheiti', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
