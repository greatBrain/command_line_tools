import click
import json

'''A group is a set of related commands.'''
''' In a group command, the context object is used to pass information between commands.'''

@click.group("cli")
@click.pass_context
@click.argument("file")
def cli(ctx, file):
    """An example CLI for interfacing with a document"""

    with open(file, 'r') as _stream:
         _dict = json.load(_stream)

    ctx.obj = _dict


def main():
    cli(prog_name="cli")

if __name__ == '__main__':
   main()
