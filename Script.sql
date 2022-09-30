CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS executor (
	executor_id SERIAL PRIMARY KEY,
	executor_name VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS executor_genre(
	genre_id INTEGER REFERENCES genre(genre_id),
	executor_id INTEGER REFERENCES executor(executor_id),
	CONSTRAINT pk4 PRIMARY KEY (genre_id, executor_id)
);
CREATE TABLE IF NOT EXISTS album(
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(40) NOT NULL,
	album_year INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS executor_album(
	executor_id INTEGER REFERENCES executor(executor_id),
	album_id INTEGER REFERENCES album(album_id)
);
CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(40) NOT NULL,
	album_id INTEGER REFERENCES album(album_id),
	duration TIME NOT NULL
);
CREATE TABLE IF NOT EXISTS collection(
	collection_name VARCHAR(40) NOT NULL,
	collection_year INTEGER NOT NULL,
	album_id INTEGER REFERENCES album(album_id),
	track_id INTEGER REFERENCES track(track_id)
);