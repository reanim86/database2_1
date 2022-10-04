CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) UNIQUE
);
CREATE TABLE IF NOT EXISTS executor (
	executor_id SERIAL PRIMARY KEY,
	executor_name VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS executor_genre (
	genre_id INTEGER REFERENCES genre(genre_id),
	executor_id INTEGER REFERENCES executor(executor_id),
	CONSTRAINT pk4 PRIMARY KEY (genre_id, executor_id)
);
CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(40) NOT NULL,
	album_year INTEGER NOT null
		check(album_year >= 1000 and album_year <= 2100)
);
CREATE TABLE IF NOT EXISTS executor_album (
	executor_id INTEGER REFERENCES executor(executor_id),
	album_id INTEGER REFERENCES album(album_id),
	CONSTRAINT pk2 PRIMARY KEY (executor_id, album_id)
);
CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(40) NOT NULL,
	album_id INTEGER REFERENCES album(album_id),
	duration INTEGER NOT null
		check(duration >= 30 and duration <= 1000)
);
CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY key,
	collection_name VARCHAR(40) NOT NULL,
	collection_year INTEGER NOT null
		check(collection_year >= 1000 and collection_year <= 2100)
);
CREATE TABLE IF NOT exists track_collection (
	track_id INTEGER references track(track_id),
	collection_id INTEGER references collection(collection_id),
	CONSTRAINT pk3 PRIMARY KEY (track_id, collection_id)
);
