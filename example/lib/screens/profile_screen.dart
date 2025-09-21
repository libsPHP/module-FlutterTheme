import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _profileFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();

  // Profile form controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _prefixController = TextEditingController();
  final _suffixController = TextEditingController();
  final _dobController = TextEditingController();
  final _taxVatController = TextEditingController();

  // Address form controllers
  final _addressFirstNameController = TextEditingController();
  final _addressLastNameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _regionController = TextEditingController();
  final _postcodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _companyController = TextEditingController();

  String? _selectedGender;
  bool _isSubscribed = false;
  bool _isDefaultShipping = false;
  bool _isDefaultBilling = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadProfileData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _middleNameController.dispose();
    _prefixController.dispose();
    _suffixController.dispose();
    _dobController.dispose();
    _taxVatController.dispose();
    _addressFirstNameController.dispose();
    _addressLastNameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    _postcodeController.dispose();
    _countryController.dispose();
    _telephoneController.dispose();
    _companyController.dispose();
  }

  void _loadProfileData() {
    final provider = context.read<AppProvider>();
    if (provider.currentCustomer != null) {
      _firstNameController.text = provider.currentCustomer!.firstName;
      _lastNameController.text = provider.currentCustomer!.lastName;
      _isSubscribed =
          false; // Default value since we don't have this in SimpleCustomer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.person), text: 'Profile'),
            Tab(icon: Icon(Icons.location_on), text: 'Addresses'),
            Tab(icon: Icon(Icons.bar_chart), text: 'Statistics'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          if (!provider.isAuthenticated) {
            return _buildNotAuthenticatedView();
          }

          if (!provider.isInitialized) {
            return _buildNotInitializedView();
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildProfileTab(provider),
              _buildAddressesTab(provider),
              _buildStatisticsTab(provider),
              _buildSettingsTab(provider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNotAuthenticatedView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_off, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Not Authenticated',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please log in to view your profile',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildNotInitializedView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Magento not configured',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please configure Magento API in the Config tab first',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab(AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _profileFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(
                            'Personal Information',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      if (provider.currentCustomer != null) ...[
                        _InfoRow(
                          icon: Icons.person,
                          label: 'Name',
                          value:
                              '${provider.currentCustomer!.firstName} ${provider.currentCustomer!.lastName}',
                        ),
                        const SizedBox(height: 8),
                        _InfoRow(
                          icon: Icons.email,
                          label: 'Email',
                          value: provider.currentCustomer!.email,
                        ),
                        const SizedBox(height: 8),
                        _InfoRow(
                          icon: Icons.badge,
                          label: 'Customer ID',
                          value: provider.currentCustomer!.id,
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Edit Profile',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _prefixController,
                              decoration: const InputDecoration(
                                labelText: 'Prefix',
                                border: OutlineInputBorder(),
                                hintText: 'Mr., Mrs., Dr.',
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: _firstNameController,
                              decoration: const InputDecoration(
                                labelText: 'First Name *',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _middleNameController,
                              decoration: const InputDecoration(
                                labelText: 'Middle Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _lastNameController,
                              decoration: const InputDecoration(
                                labelText: 'Last Name *',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _suffixController,
                              decoration: const InputDecoration(
                                labelText: 'Suffix',
                                border: OutlineInputBorder(),
                                hintText: 'Jr., Sr., III',
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedGender,
                              decoration: const InputDecoration(
                                labelText: 'Gender',
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: 'male',
                                  child: Text('Male'),
                                ),
                                DropdownMenuItem(
                                  value: 'female',
                                  child: Text('Female'),
                                ),
                                DropdownMenuItem(
                                  value: 'other',
                                  child: Text('Other'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _dobController,
                              decoration: const InputDecoration(
                                labelText: 'Date of Birth',
                                border: OutlineInputBorder(),
                                hintText: 'YYYY-MM-DD',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now().subtract(
                                    const Duration(days: 365 * 18),
                                  ),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (date != null) {
                                  _dobController.text = date
                                      .toIso8601String()
                                      .split('T')[0];
                                }
                              },
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        controller: _taxVatController,
                        decoration: const InputDecoration(
                          labelText: 'Tax/VAT Number',
                          border: OutlineInputBorder(),
                          hintText: 'Optional',
                        ),
                      ),

                      const SizedBox(height: 16),

                      SwitchListTile(
                        title: const Text('Subscribe to newsletter'),
                        subtitle: const Text(
                          'Receive updates and promotional offers',
                        ),
                        value: _isSubscribed,
                        onChanged: (value) {
                          setState(() {
                            _isSubscribed = value;
                          });
                        },
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: provider.isLoading
                              ? null
                              : () => _updateProfile(provider),
                          icon: provider.isLoading
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.save),
                          label: const Text('Update Profile'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (provider.error != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    border: Border.all(color: Colors.red.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error, color: Colors.red.shade700),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          provider.error!,
                          style: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressesTab(AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Addresses',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              ElevatedButton.icon(
                onPressed: () => _showAddAddressDialog(provider),
                icon: const Icon(Icons.add),
                label: const Text('Add Address'),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              children: [
                _buildDemoAddressCard(
                  'Home Address',
                  '123 Main Street\nAnytown, CA 12345\nUnited States',
                  '+1 (555) 123-4567',
                  isDefault: true,
                ),
                const SizedBox(height: 8),
                _buildDemoAddressCard(
                  'Work Address',
                  '456 Business Ave\nSuite 100\nAnytown, CA 12346\nUnited States',
                  '+1 (555) 987-6543',
                  isDefault: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoAddressCard(
    String title,
    String address,
    String phone, {
    required bool isDefault,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isDefault)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Default',
                      style: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(address),
            const SizedBox(height: 4),
            Text(phone, style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 12),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Edit address functionality would be implemented here',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text('Edit'),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: isDefault
                      ? null
                      : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Delete address functionality would be implemented here',
                              ),
                            ),
                          );
                        },
                  icon: const Icon(Icons.delete, size: 16),
                  label: const Text('Delete'),
                  style: TextButton.styleFrom(
                    foregroundColor: isDefault ? Colors.grey : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsTab(AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Statistics',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _StatisticRow(
                      icon: Icons.shopping_bag,
                      label: 'Total Orders',
                      value: '12',
                      color: Colors.blue,
                    ),
                    const Divider(),
                    _StatisticRow(
                      icon: Icons.attach_money,
                      label: 'Total Spent',
                      value: '\$1,234.56',
                      color: Colors.green,
                    ),
                    const Divider(),
                    _StatisticRow(
                      icon: Icons.favorite,
                      label: 'Wishlist Items',
                      value: '5',
                      color: Colors.red,
                    ),
                    const Divider(),
                    _StatisticRow(
                      icon: Icons.shopping_cart,
                      label: 'Cart Items',
                      value: '${provider.currentCart.itemsCount}',
                      color: Colors.orange,
                    ),
                    const Divider(),
                    _StatisticRow(
                      icon: Icons.star,
                      label: 'Loyalty Points',
                      value: '150',
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activity',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),

                    _ActivityItem(
                      icon: Icons.shopping_bag,
                      title: 'Order #1001 placed',
                      subtitle: 'Total: \$89.99',
                      timestamp: '2 days ago',
                    ),
                    const SizedBox(height: 8),
                    _ActivityItem(
                      icon: Icons.favorite,
                      title: 'Added item to wishlist',
                      subtitle: 'Wireless Headphones',
                      timestamp: '1 week ago',
                    ),
                    const SizedBox(height: 8),
                    _ActivityItem(
                      icon: Icons.person,
                      title: 'Profile updated',
                      subtitle: 'Contact information',
                      timestamp: '2 weeks ago',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTab(AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Settings',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 16),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notifications'),
                    subtitle: const Text('Manage email and push notifications'),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Notification settings updated'),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: const Text('Privacy Settings'),
                    subtitle: const Text('Control data sharing and privacy'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Privacy settings would open here'),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    subtitle: const Text('English (US)'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Language settings would open here'),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.attach_money),
                    title: const Text('Currency'),
                    subtitle: const Text('USD'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Currency settings would open here'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text('Change Password'),
                    subtitle: const Text('Update your account password'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showChangePasswordDialog();
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    title: const Text('Delete Account'),
                    subtitle: const Text('Permanently delete your account'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showDeleteAccountDialog();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateProfile(AppProvider provider) async {
    if (_profileFormKey.currentState!.validate()) {
      // In a real implementation, this would call the profile service
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _showAddAddressDialog(AppProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Address'),
        content: Form(
          key: _addressFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _addressFirstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _addressLastNameController,
                        decoration: const InputDecoration(
                          labelText: 'Last Name *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _companyController,
                  decoration: const InputDecoration(
                    labelText: 'Company',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _streetController,
                  decoration: const InputDecoration(
                    labelText: 'Street Address *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(
                          labelText: 'City *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _regionController,
                        decoration: const InputDecoration(
                          labelText: 'State/Region *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _postcodeController,
                        decoration: const InputDecoration(
                          labelText: 'ZIP/Postal Code *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _countryController,
                        decoration: const InputDecoration(
                          labelText: 'Country *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _telephoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text('Default shipping address'),
                  value: _isDefaultShipping,
                  onChanged: (value) {
                    setState(() {
                      _isDefaultShipping = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Default billing address'),
                  value: _isDefaultBilling,
                  onChanged: (value) {
                    setState(() {
                      _isDefaultBilling = value ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_addressFormKey.currentState!.validate()) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Address added successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                _clearAddressForm();
              }
            },
            child: const Text('Add Address'),
          ),
        ],
      ),
    );
  }

  void _clearAddressForm() {
    _addressFirstNameController.clear();
    _addressLastNameController.clear();
    _streetController.clear();
    _cityController.clear();
    _regionController.clear();
    _postcodeController.clear();
    _countryController.clear();
    _telephoneController.clear();
    _companyController.clear();
    setState(() {
      _isDefaultShipping = false;
      _isDefaultBilling = false;
    });
  }

  void _showChangePasswordDialog() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: currentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password changed successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Change Password'),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Account deletion would be processed here'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }
}

class _StatisticRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatisticRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String timestamp;

  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ),
        Text(
          timestamp,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
        ),
      ],
    );
  }
}
