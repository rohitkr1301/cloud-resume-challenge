import azure.functions as func
import datetime
import json
import logging
import os
from azure.cosmos import CosmosClient

cosmos_endpoint = os.getenv("COSMOS_ENDPOINT")
cosmos_key = os.getenv("COSMOS_KEY")
cosmos_client = CosmosClient(cosmos_endpoint, cosmos_key)

database = cosmos_client.get_database_client("cloudresume-db" )
container = database.get_container_client("visitors")


app = func.FunctionApp()

@app.route(route="visitors")
def get_visitor_count(req: func.HttpRequest) -> func.HttpResponse:
    auth_level=func.AuthLevel.ANONYMOUS

    logging.warning("endpoint check:%s ", bool(cosmos_endpoint))
    logging.warning("key check: %s", bool(cosmos_key))

    item = container.read_item("visitor-counter", "visitor-counter")
    item["count"] = item["count"] + 1
    item = container.replace_item("visitor-counter", item)
    count = item["count"]

    data = {"count" : count}
    data = json.dumps(data)
    return func.HttpResponse(data, mimetype = "application/json")




