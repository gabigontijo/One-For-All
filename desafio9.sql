SELECT count(art.user_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.User AS u
INNER JOIN SpotifyClone.Artista_seguidos as art
ON art.user_id = u.user_id AND u.user_name = 'Barbara Liskov';