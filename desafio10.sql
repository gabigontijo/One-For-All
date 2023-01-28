SELECT c.cancoes_name as nome, count(c.cancoes_name) as reproducoes
FROM SpotifyClone.Cancoes AS c
INNER JOIN SpotifyClone.Historico_reproducao as h
ON c.cancoes_id = h.cancoes_id
INNER JOIN SpotifyClone.User as u
ON h.user_id = u.user_id AND (u.plano_id = 1 OR u.plano_id = 4)
GROUP BY c.cancoes_name
ORDER BY c.cancoes_name ASC;
