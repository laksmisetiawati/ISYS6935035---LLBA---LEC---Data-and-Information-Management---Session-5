WITH Normalized AS (
    SELECT 
        p.idKaryawan,
        p.idKriteria,
        p.nilai,
        k.bobot,
        CASE 
            WHEN k.jenis = 'Benefit' THEN p.nilai / MAX(p.nilai) OVER (PARTITION BY p.idKriteria)
            WHEN k.jenis = 'Cost' THEN MIN(p.nilai) OVER (PARTITION BY p.idKriteria) / p.nilai
        END AS nilaiNormalisasi
    FROM Penilaian p
    JOIN Kriteria k ON p.idKriteria = k.idKriteria
),
FinalScores AS (
    SELECT 
        n.idKaryawan,
        SUM(n.nilaiNormalisasi * n.bobot) AS totalSkor
    FROM Normalized n
    GROUP BY n.idKaryawan
)
SELECT 
    k.idKaryawan, 
    k.namaKaryawan, 
    fs.totalSkor 
FROM FinalScores fs
JOIN Karyawan k ON fs.idKaryawan = k.idKaryawan
ORDER BY fs.totalSkor DESC;
