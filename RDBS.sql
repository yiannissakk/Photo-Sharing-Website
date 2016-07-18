DROP TABLE Pictures;
DROP TABLE Users;
DROP TABLE Albums;
DROP TABLE Comments;
DROP TABLE Tag;
DROP TABLE Likes;
DROP TABLE Friends;
DROP TABLE leavesAComment;
DROP TABLE hasATag;
DROP TABLE isInAlbum;
DROP TABLE hasAComment;
DROP SEQUENCE Pictures_picture_id_seq;
DROP SEQUENCE Users_user_id_seq;
DROP SEQUENCE Comments_comment_id_seq;
DROP SEQUENCE Albums_album_id_seq;

CREATE SEQUENCE Users_user_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 14
  CACHE 1;

CREATE SEQUENCE Pictures_picture_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 14
  CACHE 1;

CREATE SEQUENCE Albums_album_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 14
  CACHE 1;

CREATE SEQUENCE Comments_comment_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 14
  CACHE 1;

CREATE TABLE Users
(
  user_id int4 NOT NULL DEFAULT nextval('Users_user_id_seq'),
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  role_name varchar(255) NOT NULL DEFAULT 'RegisteredUser',
  firstname varchar(255) NOT NULL,
  lastname varchar(255) NOT NULL,
  gender varchar(255),
  dob varchar(255),
  hometown varchar(255),
  UNIQUE(email),
  CONSTRAINT users_pk PRIMARY KEY (user_id)
);

CREATE TABLE Pictures
(
  picture_id int4 NOT NULL DEFAULT nextval('Pictures_picture_id_seq'),
  caption varchar(255) NOT NULL,
  imgdata bytea NOT NULL,
  size int4 NOT NULL,
  content_type varchar(255) NOT NULL,
  thumbdata bytea NOT NULL,
  album_id integer /*NOT NULL*/,
  PRIMARY KEY (picture_id),
  CONSTRAINT album_delete
  FOREIGN KEY (album_id) REFERENCES Albums(albumid) 
  ON DELETE CASCADE
); 




CREATE TABLE Comments(
  commentid int4 NOT NULL DEFAULT nextval('Comments_comment_id_seq'),
  userid int4 NOT NULL,
  pictureid int4 NOT NULL,
  itext varchar(255) NOT NULL,
  commentdate varchar(255),
  PRIMARY KEY(commentid)
  /*CONSTRAINT user_delete1
  FOREIGN KEY (user_id) REFERENCES Users(user_id) 
  ON DELETE CASCADE,
  CONSTRAINT picture_delete 
  FOREIGN KEY (picture_id) REFERENCES Pictures(picture_id) 
  ON DELETE CASCADE*/ 
  );


CREATE TABLE Albums(
  albumid integer DEFAULT nextval('Albums_album_id_seq'),
  name varchar(255),
  dateofcreation varchar(255),
  userid integer NOT NULL,
  PRIMARY KEY(albumid),
  CONSTRAINT user_delete2
  FOREIGN KEY (userid) REFERENCES Users(user_id)
  ON DELETE CASCADE
  );

CREATE SEQUENCE Albums_album_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 14
  CACHE 1;

]

CREATE TABLE Tag(
  word varchar(255)
  );

CREATE TABLE Likes(
  useridL integer NOT NULL,
  pictureidL integer NOT NULL,
  PRIMARY KEY (useridL, pictureidL),
  CONSTRAINT user_delete3 
  FOREIGN KEY (useridL) REFERENCES Users(user_id)
  ON DELETE CASCADE,
  CONSTRAINT photo_delete3
  FOREIGN KEY (pictureidL) REFERENCES Pictures(picture_id)
  ON DELETE CASCADE
  );
  
CREATE TABLE Friends(
  userid1 integer,
  userid2 integer,
  CONSTRAINT user_delete4 FOREIGN KEY(userid1) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY(userid2) REFERENCES Users(user_id)
  /*CONSTRAINT user_delete5*/
  /*FOREIGN KEY(user_y) REFERENCES Users(user_id)*/
  /*ON DELETE CASCADE*/
  );

INSERT INTO Users (email, password, firstname, lastname, gender, dob, hometown) VALUES ('anonymous', 'anonymous', 'anonymous', 'anonymous','anonymous', 'anonymous', 'anonymous');
INSERT INTO Users (email, password, firstname, lastname, gender, dob, hometown) VALUES ('test@bu.edu', 'test', 'test', 'male','test', '31/10/1995', 'test');
