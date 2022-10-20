 String sqlPeoples = '''
  CREATE TABLE IF NOT EXISTS peoples (  
    name TEXT PRIMARY KEY,  
    height TEXT, 
    mass TEXT,
    hair_color TEXT,
    skin_color TEXT,
    eye_color TEXT,
    birth_year TEXT,
    gender TEXT,
    homeworld TEXT,
    films TEXT,
    species TEXT,
    vehicles TEXT,
    starships TEXT,
    created TEXT,
    edited TEXT,
    url TEXT
  )
''';

String sqlFilms = '''
  CREATE TABLE IF NOT EXISTS films (  
    episode_id INTEGER PRIMARY KEY,  
    title TEXT, 
    opening_crawl TEXT,
    director TEXT,
    producer TEXT,
    release_date TEXT,
    characters TEXT,
    planets TEXT,
    starships TEXT,
    vehicles TEXT,
    species TEXT,
    created TEXT,
    edited TEXT,
    url TEXT
  )
''';

String sqlPlanets = '''
  CREATE TABLE IF NOT EXISTS planets (  
    name TEXT PRIMARY KEY,  
    rotation_period TEXT, 
    orbital_period TEXT,
    diameter TEXT,
    climate TEXT,
    gravity TEXT,
    terrain TEXT,
    surface_water TEXT,
    population TEXT,
    residents TEXT,
    films TEXT,
    created TEXT,
    edited TEXT,
    url TEXT
  )
''';

String sqlStarships = '''
  CREATE TABLE IF NOT EXISTS starships (  
    name TEXT PRIMARY KEY,  
    model TEXT, 
    manufacturer TEXT, 
    cost_in_credits TEXT, 
    length TEXT, 
    max_atmosphering_speed TEXT, 
    crew TEXT, 
    passengers TEXT, 
    cargo_capacity TEXT, 
    consumables TEXT, 
    hyperdrive_rating TEXT, 
    MGLT TEXT, 
    starship_class TEXT, 
    pilots TEXT, 
    films TEXT, 
    created TEXT,
    edited TEXT,
    url TEXT
  )
''';