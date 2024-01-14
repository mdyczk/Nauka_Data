-- Usuniecie cudzyslowów z kategorii 
UPDATE 
  Content 
SET 
  Category = REPLACE(Category, '"', '')


-- Usuniecie tabeli bez typu reakcji
DELETE FROM 
  Reactions 
WHERE 
  Type IS NULL


-- Wyswwietlenie pierwszych 10 wierszy wyczyszczonej tabeli
SELECT 
  TOP 10 r.Content_Id as ID_Kontentu, 
  r.Type as Typ_Reakcji, 
  r.Datetime as DataICzas, 
  c.Type as Typ_Kontentu, 
  c.Category as Kategoria_Kontentu, 
  rt.Sentiment as Odczucie, 
  rt.Score as Wynik 
FROM 
  Reactions r 
  JOIN Content c on c.Content_ID = r.Content_ID 
  JOIN ReactionTypes rt on rt.Type = r.Type


-- Wybranie top 5 kategorii 
SELECT 
  TOP 5 c.Category, 
  SUM(rt.Score) as Wynik 
FROM 
  Reactions r 
  JOIN Content c on c.Content_ID = r.Content_ID 
  JOIN ReactionTypes rt on rt.Type = r.Type 
GROUP BY 
  c.Category 
ORDER BY 
  Wynik DESC
