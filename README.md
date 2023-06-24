
# Project
Say2Millions is a crowd sourced blog, where a lucky user is randomly picked by the system and the chosen user can create the next blog article.

### Setup  
```bundle install```   
```rails rails_admin:install```    
```rails assets:precompile```    
```rails db:setup```    
### DB Setup 
```
CREATE SCHEMA say2millions;
DROP USER 'say2millions'@'%' ;
CREATE USER 'say2millions'@'%' IDENTIFIED BY 'say2millions';
GRANT ALL ON say2millions.* TO 'say2millions'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'say2millions'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

ALTER DATABASE say2millions CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE say2millions;
SELECT DATABASE();

```

### Author
Vinayak srinivas [Linkedin](https://linkedin.com/in/vinayakcs)

### License
Creative Commons Attribution (CC BY)

### Demo
[![Demo](https://img.youtube.com/vi/fc6KC4aa9bU/maxresdefault.jpg)](https://www.youtube.com/watch?v=fc6KC4aa9bU)
