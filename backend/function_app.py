import azure.functions as func
import datetime
import json
import logging

app = func.FunctionApp()

# @app.route(route="visitors")
# def get_visitor_count(req: func.HttpRequest) -> func.HttpResponse:
#     return func.HttpResponse("Hello from Azure Functions")

@app.route(route="pythonapi")
def get_python_text(req: func.HttpRequest) -> func.HttpResponse:
    return func.HttpResponse("hello from python")
