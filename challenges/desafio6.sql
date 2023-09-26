SELECT
	FORMAT(MIN(p.price), 2) AS "faturamento_minimo",
  MAX(p.price) AS "faturamento_maximo",
  ROUND(AVG(p.price), 2) AS "faturamento_medio",
  ROUND(SUM(p.price), 2) AS "faturamento_total"
FROM SpotifyClone.users u
JOIN SpotifyClone.plans p
ON u.plan_id = p.plan_id;