TRUNCATE TABLE peeps, users, tags RESTART IDENTITY;

INSERT INTO users ("username","password","email") VALUES 
('mister1','1234','mister1@gmail.com'),
('mrs2','1234','mrs2@gmail.com'),
('miss3','1234','miss3@gmail.com');

INSERT INTO peeps ("user_id","time","content") VALUES 
(1,'2022-11-01 12:18:57','I cant beleeve this isnt twitter'),
(1,'2022-11-02 12:19:57','Anyone checked out this new and improved twitter?!'),
(2,'2022-11-03 18:18:57','I doubt it will be as good as before'),
(3,'2022-11-03 20:18:57','After giving it some thought I think Im gonna give it a go'),
(3,'2022-11-01 01:20:27','Hi guys so nice to be on this platform'),
(3,'2022-11-01 13:01:47','Anyone else njoyin the sunshin today?'),
(3,'2022-11-02 12:18:51','Who says chitter is full of people who cant spell!'),
(3,'2022-11-03 17:51:53','not loads of users on here yet mind'),
(3,'2022-11-04 01:42:13','Big shout out to my friend mr1'),
(3,'2022-11-04 02:45:12','please someone buy my stuff');

INSERT INTO tags ("peep_id","user_id") VALUES 
(9,1),
(2,2);

