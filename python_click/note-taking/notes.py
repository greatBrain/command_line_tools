import click 
from datetime import datetime
import json

@click.command()
@click.argument("name", default="To-do-list")
@click.option("--content", prompt=True, help="Text conten of the note")
@click.option("--tags", help="Comma-separated list of tags")
def create(name:str, content:str, tags:str)->None:
    """ Creating a new note """
