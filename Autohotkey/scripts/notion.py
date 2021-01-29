import sys, os
sys.path.insert(0, r'C:\Users\gabri\AppData\Local\Programs\Python\Python39\Lib\site-packages')
if not sys.argv[1]:
    sys.exit(1)
# from tkinter import *

# master = Tk()

# variable = StringVar(master)
# variable.set("one") # default value

# w = OptionMenu(master, variable, "one", "two", "three")
# w.pack()

# mainloop()

from notion.client import NotionClient
from notion.block import TodoBlock
from datetime import datetime, date
from notion.utils import now
# Obtain the `token_v2` value by inspecting your browser cookies on a logged-in (non-guest) session on Notion.so
client = NotionClient(token_v2="dcd0c6662fa7a9b7355555817f6e3733dd4866c9914963fc4be3a2394f056163ff8d27c0cfb6918ec8b4abbe540b2e70c448f740a9192a93ede7ce18f199daf0659a0087aff3c35e64cd552bcc76")

# Replace this URL with the URL of the page you want to edit
cv = client.get_collection_view("https://www.notion.so/02ec0006937049caa591294e2c5e5a29?v=75b382630bb143d18cf296187ec293ea")
row = cv.collection.add_row()
row.name = sys.argv[1]
row.label = 'Work'
row.completed = datetime.now()
result = cv.default_query().execute()
print(result[-1]['title'])