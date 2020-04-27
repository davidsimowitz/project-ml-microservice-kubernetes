#!/usr/bin/env bash

# USAGE:
# $ ./make_predictions.sh [HOST] [PORT]
#
# Example:
# $ ./make_prediction.sh 192.168.245.3 30611

# HOST defaults to localhost
if [ $1 ]; then
   HOST=$1
 else
   HOST="localhost"
fi

# PORT defaults to 8000
if [ $2 ]; then
   PORT=$2
 else
   PORT=8000
fi

echo "Port: $PORT"

# POST method predict
curl -d '{
   "CHAS":{
      "0":0
   },
   "RM":{
      "0":6.575
   },
   "TAX":{
      "0":296.0
   },
   "PTRATIO":{
      "0":15.3
   },
   "B":{
      "0":396.9
   },
   "LSTAT":{
      "0":4.98
   }
}'\
     -H "Content-Type: application/json" \
     -X POST http://$HOST:$PORT/predict
