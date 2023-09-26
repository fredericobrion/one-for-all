SELECT
	art.name AS "artista",
    CASE
		WHEN COUNT(f.song_id) >= 5 THEN "A"
        WHEN COUNT(f.song_id) >= 3 THEN "B"
        WHEN COUNT(f.song_id) >= 1 THEN "C"
        ELSE "-"
	END AS "ranking"
FROM SpotifyClone.artists art
LEFT JOIN SpotifyClone.albums alb
ON art.artist_id = alb.artist_id
LEFT JOIN SpotifyClone.songs s
ON alb.album_id = s.album_id
LEFT JOIN SpotifyClone.favorite_songs f
ON s.song_id = f.song_id
GROUP BY art.name
ORDER BY COUNT(f.song_id) DESC, art.name;
