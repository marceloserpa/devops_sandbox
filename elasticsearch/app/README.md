# Elasticsearch POC


Create index for movie on Elasticsearch:

```
curl -X POST -d '{"id": "1", "category": "horror", "title": "Paranormal Activity", "synopsis": "After moving into a suburban home, a couple becomes increasingly disturbed by a nightly demonic presence."}' -H "Content-Type: application/json" localhost:9000/movies
curl -X POST -d '{"id": "2", "category": "horror", "title": "Saw", "synopsis": "Two strangers, who awaken in a room with no recollection of how they got there, soon discover they are pawns in a deadly game perpetrated by a notorious serial killer."}' -H "Content-Type: application/json" localhost:9000/movies
curl -X POST -d '{"id": "3", "category": "horror", "title": "Friday the 13th", "synopsis": "A group of young adults discover a boarded up Camp Crystal Lake, where they soon encounter Jason Voorhees a serial killler and his deadly intentions."}' -H "Content-Type: application/json" localhost:9000/movies
curl -X POST -d '{"id": "4", "category": "comedy", "title": "Scary Movie", "synopsis": "A year after disposing of the body of a man they accidentally killed, a group of dumb teenagers are stalked by a bumbling serial killer"}' -H "Content-Type: application/json" localhost:9000/movies
curl -X POST -d '{"id": "5", "category": "comedy", "title": "SuperBad", "synopsis": "Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry."}' -H "Content-Type: application/json" localhost:9000/movies
curl -X POST -d '{"id": "6", "category": "comedy", "title": "Friday", "synopsis": "Two homies, Smokey (Chris Tucker) and Craig Jones (Ice Cube), smoke a dope dealers weed and try to figure a way to get the two hundred dollars they owe to the dealer by 10 p.m. that same night."}' -H "Content-Type: application/json" localhost:9000/movies
```

Search a movie

```
curl -X POST -d '{"term": "friday"}' -H "Content-Type: application/json" localhost:9000/movies/search | jq
```