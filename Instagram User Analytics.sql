use ig_clone;

-- select * from users;

select username,created_at from users order by created_at limit 5;

-- select * from photos;

select users.id,username from users left join photos 
on users.id=photos.user_id
where photos.user_id is null;

-- select * from photos;
-- select * from likes;

-- select count(user_id) as count, photo_id from likes 
-- group by photo_id order by count desc;

select username,photos.id,image_url,count(*) as total
from photos 
join likes on photos.id=likes.photo_id
join users on photos.user_id= users.id
group by photo_id
order by total desc 
limit 1;

-- select * from tags;
-- select * from photo_tags;

SELECT tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

-- select tag_name,count(photo_id) as count_tag
-- from (select * from tags join photo_tags on tags.id=photo_tags.tag_id) as total 
-- group by tag_id order by count_tag desc limit 5;

-- select * from tags join photo_tags on tags.id=photo_tags.tag_id;

-- select * from users;

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM Users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- select extract(day from created_at) from users;

-- select * from users;
-- select * from photos;

select ((select count(*) from photos)/ (select count(*) from users));

-- select count(distinct users.id),count(photos.id) from users left join photos 
-- on users.id=photos.user_id;

-- select * from likes;
-- select * from photos;
-- select * from photos join likes on photos.id=likes.photo_id;

SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos);