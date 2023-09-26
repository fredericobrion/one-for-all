SELECT
	art.name AS "artista",
  alb.name AS "album",
  COUNT(f.artist_id) AS "pessoas_seguidoras"
FROM SpotifyClone.artists art
JOIN SpotifyClone.albums alb
ON art.artist_id = alb.artist_id
JOIN SpotifyClone.artists_followers f
ON f.artist_id = art.artist_id
GROUP BY alb.name, art.name
ORDER BY COUNT(f.artist_id) DESC, art.name, alb.name;

