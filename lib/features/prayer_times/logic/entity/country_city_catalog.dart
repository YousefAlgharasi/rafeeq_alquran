class CountryCity {
  const CountryCity({required this.country, required this.cities});

  final String country;
  final List<String> cities;
}

class CountryCityCatalog {
  const CountryCityCatalog._();

  static const countries = [
    CountryCity(
      country: 'Yemen',
      cities: [
        "Sana'a",
        'Aden',
        'Taiz',
        'Hodeidah',
        'Ibb',
        'Mukalla',
        'Dhamar',
        'Seiyun',
      ],
    ),
    CountryCity(
      country: 'Saudi Arabia',
      cities: [
        'Makkah',
        'Madinah',
        'Riyadh',
        'Jeddah',
        'Dammam',
        'Khobar',
        'Tabuk',
        'Abha',
      ],
    ),
    CountryCity(
      country: 'United Arab Emirates',
      cities: [
        'Abu Dhabi',
        'Dubai',
        'Sharjah',
        'Ajman',
        'Ras Al Khaimah',
        'Fujairah',
      ],
    ),
    CountryCity(
      country: 'Qatar',
      cities: ['Doha', 'Al Rayyan', 'Al Wakrah', 'Al Khor'],
    ),
    CountryCity(
      country: 'Kuwait',
      cities: ['Kuwait City', 'Hawalli', 'Salmiya', 'Al Ahmadi'],
    ),
    CountryCity(
      country: 'Oman',
      cities: ['Muscat', 'Salalah', 'Nizwa', 'Sohar', 'Sur'],
    ),
    CountryCity(
      country: 'Bahrain',
      cities: ['Manama', 'Muharraq', 'Riffa', 'Isa Town'],
    ),
    CountryCity(
      country: 'Egypt',
      cities: ['Cairo', 'Alexandria', 'Giza', 'Mansoura', 'Aswan', 'Luxor'],
    ),
    CountryCity(
      country: 'Jordan',
      cities: ['Amman', 'Zarqa', 'Irbid', 'Aqaba'],
    ),
    CountryCity(
      country: 'Palestine',
      cities: ['Jerusalem', 'Gaza', 'Hebron', 'Nablus', 'Ramallah'],
    ),
    CountryCity(
      country: 'Turkey',
      cities: ['Istanbul', 'Ankara', 'Izmir', 'Bursa', 'Konya'],
    ),
    CountryCity(
      country: 'United States',
      cities: [
        'New York',
        'Los Angeles',
        'Chicago',
        'Houston',
        'Phoenix',
        'Dearborn',
        'Washington',
      ],
    ),
    CountryCity(
      country: 'United Kingdom',
      cities: ['London', 'Birmingham', 'Manchester', 'Leeds', 'Glasgow'],
    ),
    CountryCity(
      country: 'Canada',
      cities: ['Toronto', 'Montreal', 'Vancouver', 'Calgary', 'Ottawa'],
    ),
    CountryCity(
      country: 'Malaysia',
      cities: ['Kuala Lumpur', 'George Town', 'Johor Bahru', 'Kota Kinabalu'],
    ),
    CountryCity(
      country: 'Indonesia',
      cities: ['Jakarta', 'Surabaya', 'Bandung', 'Medan', 'Makassar'],
    ),
    CountryCity(
      country: 'Pakistan',
      cities: ['Karachi', 'Lahore', 'Islamabad', 'Rawalpindi', 'Peshawar'],
    ),
    CountryCity(
      country: 'India',
      cities: ['Delhi', 'Mumbai', 'Hyderabad', 'Lucknow', 'Bengaluru'],
    ),
  ];

  static CountryCity defaultCountry() => countries.first;

  static CountryCity? findCountry(String? country) {
    if (country == null || country.trim().isEmpty) {
      return null;
    }

    final normalized = country.trim().toLowerCase();
    for (final entry in countries) {
      if (entry.country.toLowerCase() == normalized) {
        return entry;
      }
    }
    return null;
  }
}
