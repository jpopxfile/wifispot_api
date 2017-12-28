# Introduction

## Ruby Version: 
ruby 2.3.1p112

# JSON API

This is a JSON API that has 2 features:
* Returns n nearest wifispots in Japan, from provided x (longitude) and y (latitude) coordinates
* Returns n matches in name/address of wifispots in Japan matching provided keyword

For both, the count and language(Japanese/English) can be specified.

## GPS
### /api/v1/(jp/en)/wifispots/gps
Example: /api/v1/jp/wifispots/gps?distance=1000&count=5&y_coord=35.76410755&x_coord=140.3845965

Example response: 
```
[{"name_jp":"成田国際空港","address_jp":"成田市三里塚字御料牧場1-1","distance":0.05899369716644287,"y_coord":35.7641,"x_coord":140.385},{"name_jp":"成田空港駅","address_jp":"成田市三里塚御料牧場","distance":44.363338718393166,"y_coord":35.7638,"x_coord":140.384},{"name_jp":"成田国際空港","address_jp":"成田市古込字古込1-1","distance":679.1025986456873,"y_coord":35.7735,"x_coord":140.388},{"name_jp":"空港第２ビル駅","address_jp":"成田市古込字古込","distance":810.9734048555628,"y_coord":35.7741,"x_coord":140.392},{"name_jp":"株式会社東交通","address_jp":"山武郡芝山町香山新田57-157-1","distance":969.2215219260569,"y_coord":35.7553,"x_coord":140.398}]
```
Parameters:
* Distance (The max radius distance from the given coordinates. Default is 500m)
* Count (The max number of results to return. Default is 5)
* Y_coord (Latitude. Required) 
* X_coord (Longitude. Required)
* Lang (jp/en. Default is jp)

Any request lacking the x/y coordinates will return a 204 code.




## Search
### api/v1/(jp/en)/wifispots/search
Example: api/v1/jp/wifispots/search?s=新宿&count=10

Example response:
```
[{"name_jp":"新宿駅","address_jp":"新宿区新宿3丁目","y_coord":35.6912,"x_coord":139.703},{"name_jp":"四ツ谷(丸ノ内線)","address_jp":"新宿区四谷1-1","y_coord":35.6855,"x_coord":139.73},{"name_jp":"四ツ谷(南北線)","address_jp":"新宿区四谷1-3","y_coord":35.6864,"x_coord":139.729},{"name_jp":"四谷三丁目","address_jp":"新宿区四谷3-8","y_coord":35.6876,"x_coord":139.721},{"name_jp":"新宿御苑前","address_jp":"新宿区新宿1-7-2","y_coord":35.6889,"x_coord":139.71},{"name_jp":"新宿三丁目(丸ノ内線)","address_jp":"新宿区新宿3-14-1","y_coord":35.6916,"x_coord":139.705},{"name_jp":"新宿三丁目(副都心線)","address_jp":"新宿区新宿5-18-22","y_coord":35.6937,"x_coord":139.706},{"name_jp":"新宿","address_jp":"新宿区西新宿1丁目 西口地下街1号","y_coord":35.6905,"x_coord":139.697},{"name_jp":"西新宿","address_jp":"新宿区西新宿6-7-51","y_coord":35.6942,"x_coord":139.693},{"name_jp":"高田馬場(東西線)","address_jp":"新宿区高田馬場1-35-2","y_coord":35.7127,"x_coord":139.704}]
```
Parameters:
* s (Search keyword)
* Lang (jp/en. Default is jp)

Any request lacking the s will return a 204 code.


# Configuration
## config/database.yml.example
Set the username and password for Mysql and save the file as database.yml


## Creating and initializing the database
```
rake db:create
rake db:migrate
rake import:wifispot
```


# Testing
## Cloning test database:
```
mysqldump -u <user> -p wifispot_api_development > temp.sql
mysql -u <user> -p wifispot_api_test < temp.sql
```

## Running tests
```
rspec spec/controllers/wifispots_controllers_spec.rb
```
