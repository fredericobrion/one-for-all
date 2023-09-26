SELECT
	faixa_etaria,
    COUNT(DISTINCT subconsulta.user_id) AS total_pessoas_usuarias,
    COUNT(fav.song_id) AS total_favoritadas
FROM(
SELECT 'Até 30 anos' AS faixa_etaria, 
           age,
           user_id
    FROM SpotifyClone.users AS u
    WHERE age <= 30
    UNION ALL
    SELECT 'Entre 31 e 60 anos' AS faixa_etaria, 
           age,
           user_id
    FROM SpotifyClone.users AS u
    WHERE age > 30 AND age <= 60
    UNION ALL
    SELECT 'Maior de 60 anos' AS faixa_etaria, 
           age,
           user_id
    FROM SpotifyClone.users AS u
    WHERE age > 60) as subconsulta
LEFT JOIN SpotifyClone.favorite_songs as fav ON subconsulta.user_id = fav.user_id
GROUP BY faixa_etaria;



