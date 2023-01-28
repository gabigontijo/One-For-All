SELECT a.artista_name AS artista, al.album_name AS album, count(art.artista_id) AS seguidores
FROM SpotifyClone.Artista AS a
INNER JOIN SpotifyClone.Artista_seguidos as art
ON a.artista_id = art.artista_id
LEFT JOIN SpotifyClone.Album as al
ON a.artista_id = al.artista_id
GROUP BY al.album_name, a.artista_name
ORDER BY seguidores DESC, artista ASC, album ASC
;