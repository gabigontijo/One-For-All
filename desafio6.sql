SELECT FORMAT(MIN(p.plano_price), 2) AS faturamento_minimo, FORMAT(MAX(p.plano_price),2) AS faturamento_maximo , FORMAT(AVG(p.plano_price),2) AS faturamento_medio, FORMAT(sum(p.plano_price),2) AS faturamento_total
FROM SpotifyClone.User AS u
INNER JOIN SpotifyClone.Plano as p
ON u.plano_id = p.plano_id ;