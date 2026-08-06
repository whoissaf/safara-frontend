import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../services/api_service.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({super.key});

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _selectedCategory;
  final List<String> _categories = ['Theft', 'Scam', 'Violence', 'Natural Disaster', 'Traffic Accident', 'Health Emergency', 'Other'];
  final _locationController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _locationController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showAlert(String title, String message, bool isSuccess) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: NeoColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md), side: NeoBorders.thickSide),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(backgroundColor: isSuccess ? NeoColors.green : NeoColors.red, foregroundColor: NeoColors.surface, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm), side: NeoBorders.thinSide)),
            child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w900)),
          ),
        ],
      ),
    );
  }

  Future<void> _submitReport() async {
    if (!_formKey.currentState!.validate() || _selectedCategory == null) {
      _showAlert('Error', 'Please fill all fields and select a category.', false);
      return;
    }
    setState(() => _isLoading = true);
    final result = await ApiService.submitReport(
      userId: AppConstants.seedUserId,
      locationId: AppConstants.seedLocationId,
      category: _selectedCategory!,
      title: _titleController.text,
      description: _descriptionController.text,
    );
    setState(() => _isLoading = false);

    if (result['success'] == true) {
      _showAlert('Success', 'Report submitted successfully!', true);
      _locationController.clear();
      _titleController.clear();
      _descriptionController.clear();
      setState(() => _selectedCategory = null);
    } else {
      _showAlert('Failed', result['message'] ?? 'Failed to submit report.', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Report')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.hard, borderRadius: BorderRadius.circular(AppRadius.md)),
                child: Column(
                  children: [
                    TextFormField(controller: _locationController, decoration: const InputDecoration(labelText: 'Location', border: OutlineInputBorder()), validator: (v) => v == null || v.isEmpty ? 'Required' : null),
                    const SizedBox(height: AppSpacing.md),
                    DropdownButtonFormField<String>(value: _selectedCategory, decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder()), items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(), onChanged: (v) => setState(() => _selectedCategory = v), validator: (v) => v == null ? 'Required' : null),
                    const SizedBox(height: AppSpacing.md),
                    TextFormField(controller: _titleController, decoration: const InputDecoration(labelText: 'Title', border: OutlineInputBorder()), validator: (v) => v == null || v.isEmpty ? 'Required' : null),
                    const SizedBox(height: AppSpacing.md),
                    TextFormField(controller: _descriptionController, maxLines: 4, decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder(), alignLabelWithHint: true), validator: (v) => v == null || v.isEmpty ? 'Required' : null),
                    const SizedBox(height: AppSpacing.xl),
                    SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: _isLoading ? null : _submitReport, child: Text(_isLoading ? 'SUBMITTING...' : 'SUBMIT REPORT'))),
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
