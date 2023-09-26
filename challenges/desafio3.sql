SELECT 
  u.name AS "pessoa_usuaria",
  COUNT(r.song_id) AS "musicas_ouvidas",
  ROUND(SUM(s.duration)/60, 2) AS "total_minutos"
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.reproduction_history r
ON u.user_id = r.user_id
INNER JOIN SpotifyClone.songs s
ON s.song_id = r.song_id
GROUP BY u.name
ORDER BY u.name;
