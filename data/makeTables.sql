USE musicApp;

set FOREIGN_KEY_CHECKS = 0;
DROP TABLE User;
DROP TABLE Artist;
DROP TABLE Album;
DROP TABLE Track;
DROP TABLE Playlist;
set FOREIGN_KEY_CHECKS = 1;


CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);

CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(255),
    Genre VARCHAR(255)
);

CREATE TABLE Album (
    AlbumID INT PRIMARY KEY,
    Title VARCHAR(255),
    ArtistID INT,
    Genre VARCHAR(255),
    ReleaseDate DATE,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

CREATE TABLE Track (
    TrackID INT PRIMARY KEY,
    Title VARCHAR(255),
    ArtistID INT,
    AlbumID INT,
    Duration TIME,
    ReleaseDate DATE,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID)
);

CREATE TABLE Playlist (
    PlaylistID INT PRIMARY KEY,
    UserID INT,
    Title VARCHAR(255),
    CreationDate DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
