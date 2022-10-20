import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LocaleTexts {
  LocaleTexts(this.locale);

  final Locale locale;

  static LocaleTexts of(BuildContext context) =>
      Localizations.of<LocaleTexts>(context, LocaleTexts)!;

  static List<String> languages() => ['pt', 'en'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';
}

class LocaleTextsDelegate extends LocalizationsDelegate<LocaleTexts> {
  const LocaleTextsDelegate();

  @override
  bool isSupported(Locale locale) =>
      LocaleTexts.languages().contains(locale.toString());

  @override
  Future<LocaleTexts> load(Locale locale) =>
      SynchronousFuture<LocaleTexts>(LocaleTexts(locale));

  @override
  bool shouldReload(LocaleTextsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  {
    'search': {
      'pt': 'Buscar',
      'en': 'Search',
    },
    'results': {
      'pt': 'resultados',
      'en': 'results',
    },
    'back': {
      'pt': 'Voltar',
      'en': 'Back',
    },
    'settings': {
      'pt': 'Configurações',
      'en': 'Settings',
    },
    'theme': {
      'pt': 'Tema',
      'en': 'Theme',
    },
    'current': {
      'pt': 'Atual',
      'en': 'Current',
    },
    'language': {
      'pt': 'Linguagem',
      'en': 'Language',
    },
    'character': {
      'pt': 'Personagem',
      'en': 'Character',
    },
    'genre': {
      'pt': 'Gênero',
      'en': 'Genre',
    },
    'birth': {
      'pt': 'Nascimento',
      'en': 'Birth',
    },
    'homeworld': {
      'pt': 'Planeta de Origem',
      'en': 'Homeworld',
    },
    'planet_name': {
      'pt': 'Nome do Planeta',
      'en': 'Planet Name',
    },
    'diameter': {
      'pt': 'Diâmetro',
      'en': 'Diameter',
    },
    'terrain': {
      'pt': 'Terreno',
      'en': 'Terrain',
    },
    'starship': {
      'pt': 'Nave',
      'en': 'Starship',
    },
    'starship_name': {
      'pt': 'Nome da Nave',
      'en': 'Starship Name',
    },
    'capacity': {
      'pt': 'Capacidade',
      'en': 'Capacity',
    },
    'film': {
      'pt': 'Filme',
      'en': 'Film',
    },
    'films': {
      'pt': 'Filmes',
      'en': 'Films',
    },
    'opening_crawl': {
      'pt': 'Abertura',
      'en': 'Opening Crawl',
    },
    'producers': {
      'pt': 'Produtores',
      'en': 'Producers',
    },
    'director': {
      'pt': 'Diretor',
      'en': 'Director',
    },
    'portuguese': {
      'pt': 'Portugues',
      'en': 'Portuguese',
    },
    'english': {
      'pt': 'Ingles',
      'en': 'English',
    },
    'male': {
      'pt': 'Masculino',
      'en': 'Male',
    },
    'female': {
      'pt': 'Feminino',
      'en': 'Female',
    },
    'unknown': {
      'pt': 'Desconhecido',
      'en': 'Unknown',
    },
  },
].reduce((a, b) => a..addAll(b));
