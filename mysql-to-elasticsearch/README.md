# MySQL to ElasticSearch with Logstash



localhost:8080

```
insert into books (title) values ('Thus Spoke Zarathustra');
insert into books (title) values ('The Shining');
```


localhost:5601

```
GET books/_search 
{
  "query": {
    "match_all": {}
  }
}
```
