SELECT p.name, s.title, l.bool
FROM playlist AS p
INNER JOIN song as s
ON p.id = s.playlist_id
INNER JOIN liked AS l
ON s.liked_id = l.id;
