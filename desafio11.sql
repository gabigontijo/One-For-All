SELECT cancoes_name as nome_musica,
CASE
	WHEN cancoes_name LIKE '%Bard%' THEN REPLACE(cancoes_name, 'Bard', 'QA')
	WHEN cancoes_name LIKE '%Amar%' THEN REPLACE(cancoes_name, 'Amar', 'Code Review')
	WHEN cancoes_name LIKE '%Pais' THEN REPLACE(cancoes_name, 'Pais', 'Pull Requests')
	WHEN cancoes_name LIKE '%SOUL' THEN REPLACE(cancoes_name, 'SOUL', 'CODE')
	WHEN cancoes_name LIKE '%SUPERSTAR' THEN REPLACE(cancoes_name, 'SUPERSTAR', 'SUPERDEV')
	ELSE 'nao atualizadas'
	END AS novo_nome
FROM SpotifyClone.Cancoes
WHERE cancoes_name LIKE '%Bard%' OR cancoes_name LIKE '%Amar%' OR cancoes_name LIKE '%Pais' OR cancoes_name LIKE '%SOUL'
OR cancoes_name LIKE '%SUPERSTAR'
ORDER BY nome_musica DESC, novo_nome DESC;