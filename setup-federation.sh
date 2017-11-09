#!/bin/sh

docker-compose exec downstream rabbitmqctl set_parameter federation-upstream federation-upstream '{"uri":"amqps://myuser:mypass@upstream","expires":3600000}'
docker-compose exec downstream rabbitmqctl set_policy federation-policy "^federation\.*" '{"federation-upstream-set":"all"}' --priority 0 --apply-to exchanges
