-- create database RegularExpressions
-- �û�
-- drop table Users
create table Users
(
UserID BIGINT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(32) UNIQUE,
Email NVARCHAR(128) UNIQUE,
Password NVARCHAR(128) NOT NULL,
RegisteredTime DATETIME NOT NULL DEFAULT GETDATE(),
LastLoginedTime DATETIME NOT NULL DEFAULT GETDATE(),
LastLoginedIP NVARCHAR(32) NOT NULL
)

-- ������ʽ
-- drop table Regexs
create table Regexs
(
RegexID BIGINT PRIMARY KEY IDENTITY(1,1),
Title NVARCHAR(64),
Description NVARCHAR(1024),
Pattern NVARCHAR(1024),
ReplacePattern NVARCHAR(1024),
PostUserID BIGINT,
PostedTime DATETIME NOT NULL DEFAULT GETDATE()
)

--��ǩ
-- drop table Tags
create table Tags
(
TagID BIGINT PRIMARY KEY IDENTITY(1,1),
Tag NVARCHAR(64) UNIQUE,
PostUserID BIGINT,
PostedTime DATETIME NOT NULL DEFAULT GETDATE()
)

-- �û��ղ�
-- drop table UserFavorites
create table UserFavorites
(
UserID BIGINT,
RegexID BIGINT
)

-- ������ʽ��ǩ
-- drop table RegexTags
create table RegexTags
(
RegexID BIGINT,
TagsID BIGINT
)

-- ������BUG
-- drop table Suggests
create table Suggests
(
SuggestID BIGINT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(32),
Email NVARCHAR(128),
Content NVARCHAR(3000),
IP NVARCHAR(32) NOT NULL,
PostedTime DATETIME NOT NULL DEFAULT GETDATE()
)

-- ��������
drop table Articles
create table Articles
(
ArticleID BIGINT PRIMARY KEY IDENTITY(1,1),
Title NVARCHAR(128) NOT NULL,
Description NVARCHAR(1000),
Content NTEXT,
Author NVARCHAR(32),
PubDate DATETIME NOT NULL DEFAULT GETDATE(),
LastUpdated DATETIME NOT NULL DEFAULT GETDATE(),
ViewCount BIGINT,
CommentCount BIGINT,
Audited BIT
)