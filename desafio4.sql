SELECT u.user_name AS usuario, IF(hr.data_reproducao <> 1, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.User AS u
Left JOIN SpotifyClone.Historico_reproducao AS hr ON hr.user_id = u.user_id and YEAR(hr.data_reproducao) >= 2021
GROUP BY usuario, status_usuario
order by usuario asc;