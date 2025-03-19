CREATE TABLE Penilaian(
    idPenilaian INT NOT NULL,
    idKaryawan INT NOT NULL,
    idKriteria INT NOT NULL,
    nilai INT NOT NULL,
    PRIMARY KEY (idPenilaian),
    FOREIGN KEY (idKaryawan) REFERENCES Karyawan(idKaryawan)
    FOREIGN KEY (idKriteria) REFERENCES Kriteria(idKriteria)
);
