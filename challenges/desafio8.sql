SELECT
	art.name AS "artista",
    alb.name AS "album"
FROM SpotifyClone.artists art
JOIN SpotifyClone.albums alb
ON art.artist_id = alb.artist_id
WHERE art.name = "Elis Regina"
ORDER BY alb.name;
