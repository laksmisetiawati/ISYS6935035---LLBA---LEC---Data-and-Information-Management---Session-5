CREATE TABLE Karyawan(
    idKaryawan INT NOT NULL,
    namaKaryawan VARCHAR(255) NOT NULL,
    alamatKaryawan TEXT NOT NULL,
    handphoneKaryawan CHAR(16) NOT NULL,
    pendidikanKaryawan VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password CHAR(32) NOT NULL,
    idLevel INT NOT NULL,
    proses VARCHAR(255) NULL,
    PRIMARY KEY (idKaryawan),
    FOREIGN KEY (idLevel) REFERENCES Level(idLevel)
);
