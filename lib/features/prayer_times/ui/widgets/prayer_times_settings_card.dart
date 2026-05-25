import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../logic/entity/country_city_catalog.dart';
import '../../logic/entity/prayer_settings.dart';

class PrayerTimesSettingsCard extends StatefulWidget {
  const PrayerTimesSettingsCard({
    required this.settings,
    required this.onSave,
    required this.onUseCurrentLocation,
    super.key,
  });

  final PrayerSettings settings;
  final Future<void> Function(PrayerSettings settings) onSave;
  final Future<void> Function() onUseCurrentLocation;

  @override
  State<PrayerTimesSettingsCard> createState() =>
      _PrayerTimesSettingsCardState();
}

class _PrayerTimesSettingsCardState extends State<PrayerTimesSettingsCard> {
  late PrayerLocationMode _locationMode;
  late CountryCity _selectedCountry;
  late String _selectedCity;
  late int _calculationMethod;
  late int _madhab;
  bool _isBusy = false;

  @override
  void initState() {
    super.initState();
    _locationMode = widget.settings.locationMode;
    _calculationMethod = widget.settings.calculationMethod;
    _madhab = widget.settings.madhab;
    _selectedCountry =
        CountryCityCatalog.findCountry(widget.settings.country) ??
        CountryCityCatalog.defaultCountry();
    _selectedCity = _selectedCountry.cities.contains(widget.settings.city)
        ? widget.settings.city!
        : _selectedCountry.cities.first;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              localizations.prayerLocation,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            SegmentedButton<PrayerLocationMode>(
              segments: [
                ButtonSegment(
                  value: PrayerLocationMode.gps,
                  icon: const Icon(Icons.my_location_outlined),
                  label: Text(localizations.useCurrentLocation),
                ),
                ButtonSegment(
                  value: PrayerLocationMode.manual,
                  icon: const Icon(Icons.location_city_outlined),
                  label: Text(localizations.manualLocation),
                ),
              ],
              selected: {_locationMode},
              onSelectionChanged: _isBusy
                  ? null
                  : (selection) {
                      setState(() => _locationMode = selection.first);
                    },
            ),
            const SizedBox(height: 12),
            if (_locationMode == PrayerLocationMode.manual) ...[
              DropdownButtonFormField<String>(
                initialValue: _selectedCountry.country,
                decoration: InputDecoration(
                  labelText: localizations.chooseCountry,
                ),
                items: CountryCityCatalog.countries
                    .map(
                      (entry) => DropdownMenuItem(
                        value: entry.country,
                        child: Text(entry.country),
                      ),
                    )
                    .toList(),
                onChanged: _isBusy
                    ? null
                    : (country) {
                        if (country == null) {
                          return;
                        }
                        final selected =
                            CountryCityCatalog.findCountry(country) ??
                            CountryCityCatalog.defaultCountry();
                        setState(() {
                          _selectedCountry = selected;
                          _selectedCity = selected.cities.first;
                        });
                      },
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                key: ValueKey(_selectedCountry.country),
                initialValue: _selectedCity,
                decoration: InputDecoration(
                  labelText: localizations.chooseCity,
                ),
                items: _selectedCountry.cities
                    .map(
                      (city) =>
                          DropdownMenuItem(value: city, child: Text(city)),
                    )
                    .toList(),
                onChanged: _isBusy
                    ? null
                    : (city) {
                        if (city != null) {
                          setState(() => _selectedCity = city);
                        }
                      },
              ),
              const SizedBox(height: 12),
            ],
            DropdownButtonFormField<int>(
              initialValue: _calculationMethod,
              decoration: InputDecoration(
                labelText: localizations.calculationMethod,
              ),
              items: const [
                DropdownMenuItem(value: 2, child: Text('ISNA')),
                DropdownMenuItem(value: 3, child: Text('Muslim World League')),
                DropdownMenuItem(value: 4, child: Text('Umm Al-Qura')),
                DropdownMenuItem(value: 5, child: Text('Egyptian Authority')),
              ],
              onChanged: _isBusy
                  ? null
                  : (value) {
                      if (value != null) {
                        setState(() => _calculationMethod = value);
                      }
                    },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              initialValue: _madhab,
              decoration: InputDecoration(labelText: localizations.madhab),
              items: [
                DropdownMenuItem(
                  value: 0,
                  child: Text(localizations.standardMadhab),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text(localizations.hanafiMadhab),
                ),
              ],
              onChanged: _isBusy
                  ? null
                  : (value) {
                      if (value != null) {
                        setState(() => _madhab = value);
                      }
                    },
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: _isBusy ? null : _save,
                  icon: const Icon(Icons.save_outlined),
                  label: Text(localizations.savePrayerSettings),
                ),
                OutlinedButton.icon(
                  onPressed: _isBusy ? null : _useLocation,
                  icon: const Icon(Icons.my_location_outlined),
                  label: Text(localizations.useCurrentLocation),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    setState(() => _isBusy = true);
    try {
      await widget.onSave(
        widget.settings.copyWith(
          locationMode: _locationMode,
          calculationMethod: _calculationMethod,
          madhab: _madhab,
          city: _selectedCity,
          country: _selectedCountry.country,
        ),
      );
    } on Object catch (error) {
      if (mounted) {
        _showError(error);
      }
    } finally {
      if (mounted) {
        setState(() => _isBusy = false);
      }
    }
  }

  Future<void> _useLocation() async {
    setState(() => _isBusy = true);
    try {
      await widget.onUseCurrentLocation();
      if (mounted) {
        setState(() => _locationMode = PrayerLocationMode.gps);
      }
    } on Object catch (error) {
      if (mounted) {
        _showError(error);
      }
    } finally {
      if (mounted) {
        setState(() => _isBusy = false);
      }
    }
  }

  void _showError(Object error) {
    final localizations = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          error.toString().trim().isEmpty
              ? localizations.currentLocationUnavailable
              : '${localizations.currentLocationUnavailable}\n$error',
        ),
      ),
    );
  }
}
