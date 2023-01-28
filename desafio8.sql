SELECT a.artista_name AS artista, al.album_name AS album
FROM SpotifyClone.Artista AS a
INNER JOIN SpotifyClone.Album as al
ON a.artista_id = al.artista_id AND a.artista_name = 'Elis Regina'
ORDER BY album ASC
;