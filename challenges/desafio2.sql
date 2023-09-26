SELECT 
	COUNT(s.name) AS "cancoes",
    COUNT(DISTINCT art.name) AS "artistas",
    COUNT(DISTINCT alb.name) AS "albuns"
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.albums AS alb
ON s.album_id = alb.album_id
INNER JOIN SpotifyClone.artists AS art
ON art.artist_id = alb.artist_id;