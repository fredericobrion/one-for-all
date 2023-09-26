SELECT
	u.name AS "pessoa_usuaria",
  IF(MAX(YEAR(r.reproduction_date)) >= 2021, "Ativa", "Inativa") AS "status_pessoa_usuaria"
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.reproduction_history r
ON u.user_id = r.user_id
GROUP BY u.name
ORDER BY u.name;