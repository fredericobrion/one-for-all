SELECT
	a.name AS "album",
  COUNT(f.song_id) AS "favoritadas"
FROM SpotifyClone.albums a
JOIN SpotifyClone.songs s
ON a.album_id = s.album_id
JOIN SpotifyClone.favorite_songs f
ON f.song_id = s.song_id
GROUP BY a.name
ORDER BY COUNT(f.song_id) DESC, a.name
LIMIT 3;
