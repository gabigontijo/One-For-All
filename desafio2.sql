SELECT count(c.cancoes_id) AS cancoes, count(distinct a.artista_id) AS artistas, count(distinct al.album_id) AS albuns
FROM SpotifyClone.Cancoes AS c
INNER JOIN SpotifyClone.Artista AS a
	on c.artista_id = a.artista_id
INNER JOIN SpotifyClone.Album AS al
	on c.album_id = al.album_id;
