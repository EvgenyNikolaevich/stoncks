# README

# Run app

Create role in DB:
```
psql
CREATE ROLE ruby WITH LOGIN CREATEDB ENCRYPTED PASSWORD 'ruby';
```

Install gems:

```
bundle install
```

Create DB and update it:

```
rails db:create
rails db:migrate
```

Run server:
```
rails s
```

After that you can send requests to the server.



# Send requests

Create stock with referenced bearer:
```
curl --location --request POST 'localhost:3000/stocks' \
--header 'Content-Type: application/json' \
--data-raw '{
    "data": {
        "name": "any",
        "bearer_id": 1
    }
}'
```

Get all stocks:
```
curl --location --request GET 'localhost:3000/stocks'
```

Update information about stock:
```
curl --location --request PUT 'localhost:3000/stocks/1' \
--header 'Content-Type: application/json' \
--data-raw '{
    "data": {
        "id": 1,
        "name": "new_name_for_stock"
    }
}'
```

Delete stock:
```
curl --location --request DELETE 'localhost:3000/stocks/1'
```