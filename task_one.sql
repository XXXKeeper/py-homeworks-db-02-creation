CREATE TABLE IF NOT EXISTS styles (
  title VARCHAR(40) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS styles_artists (
	style_title VARCHAR(40) REFERENCES styles(title),
	artist_id INTEGER REFERENCES artists(id),
	CONSTRAINT pk PRIMARY KEY (style_title, artist_id)
);

CREATE TABLE IF NOT EXISTS albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(80) NOT NULL,
  year_release date NOT NULL CHECK (year_release >= '1980-01-01')
);

CREATE TABLE IF NOT EXISTS artist_album (
	artist_id INTEGER REFERENCES artists(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT pk PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS songs (
  id SERIAL PRIMARY KEY,
  album_id INTEGER NOT NULL REFERENCES albums(id),
  title VARCHAR(80) NOT NULL,
  duration INTEGER NOT NULL CHECK (duration > 30)
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	song_id INTEGER NOT NULL REFERENCES songs(id),
	title VARCHAR(80) NOT NULL,
	year_release date NOT NULL CHECK (year_release >= '2000-01-01')
);

CREATE TABLE IF NOT EXISTS songs_collection (
	song_id INTEGER REFERENCES songs(id),
	collection_id INTEGER REFERENCES collection(id),
	CONSTRAINT pk PRIMARY KEY (song_id, collection_id)
);
