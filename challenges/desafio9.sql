SELECT
	COUNT(r.user_id) AS "musicas_no_historico"
FROM SpotifyClone.users u
JOIN SpotifyClone.reproduction_history r
ON u.user_id = r.user_id
WHERE u.name = "Barbara Liskov"
GROUP BY u.name;