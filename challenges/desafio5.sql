SELECT
	s.name AS "cancao",
    COUNT(s.song_id) AS "reproducoes"
FROM SpotifyClone.reproduction_history r
INNER JOIN SpotifyClone.songs s
ON s.song_id = r.song_id
GROUP BY s.name
ORDER BY
	COUNT(s.song_id) DESC,
    s.name
LIMIT 2;