/*Query1: ηθοποιοί που έπαιξαν σε παραπάνω από μια ταινία*/
SELECT p.person_id,p.name, count(m.movie_id)
FROM person p
INNER JOIN cast_table m
ON p.person_id=m.person_id
GROUP BY p.person_id
HAVING Count(m.movie_id)>2

/*Query2: οι ηθοποιοί που έχουν παίξει σε comedy*/
SELECT Distinct p.name
FROM person p,cast_table ct,movie_keywords mk, keyword k
where p.person_id=ct.person_id AND ct.movie_id=mk.movie_id
AND mk.keyword_id=k.k_id
GROUP BY p.person_id,k.keyword
HAVING k.keyword LIKE '%comedy%'

/*Query3: το πλήθος των ηθοποιών που έχουν παίξει σε κάθε collection*/
SELECT c.name, count(p.person_id) 
FROM person p,movie m,cast_table ct,movie_collection mc, collection c
where p.person_id=ct.person_id AND ct.movie_id=m.m_id AND m.m_id=mc.movie_id
AND mc.collection_id=c.id
Group by c.name