SELECT u.user_name AS usuario, count(u.user_id) AS qt_de_musicas_ouvidas, ROUND(sum(c.cancoes_duracao)/60, 2) AS total_minutos FROM SpotifyClone.User u
INNER JOIN SpotifyClone.Historico_reproducao AS hr ON hr.user_id = u.user_id
INNER JOIN SpotifyClone.Cancoes AS c ON c.cancoes_id = hr.cancoes_id
GROUP BY u.user_id
ORDER BY u.user_name;