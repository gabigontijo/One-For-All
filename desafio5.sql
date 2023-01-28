SELECT c.cancoes_name AS cancao,count(h.cancoes_id) AS reproducoes
	FROM SpotifyClone.Historico_reproducao AS h
	INNER JOIN SpotifyClone.Cancoes AS c ON h.cancoes_id = c.cancoes_id
    GROUP BY cancao
	ORDER BY reproducoes DESC, cancao ASC
    LIMIT 2;