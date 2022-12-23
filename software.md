---
title: FOSS SEO Awesome List
permalink: /software/
group: software
description: FOSS SEO Software
---

# {{ page.description }}

### Installing Linux & Pipulate

To install Pipulate, <a href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink Me</a>.

### Using JupyterLab

After the Drink Me script is finished running, Linux and Pipulate will both be
installed on your Windows system and JupyterLab will soon be reachable in a Web
browser at <a href="http://localhost:8080">localhost:8080</a>. You will however
have to open a Linux Terminal to "wake up" Jupyter. This is due to a limitation
in WSL and I expect this requirement to change soon. Windows Terminal may have
installed with Linux, but in case it didn't, grab it from the Microsoft Store.

Once you have JupyterLab displaying in your Web browser, you're in business.
Simply copy/paste any of the code in these examples into a new Notebook or go
into the repo named pipulate and run the code from the example files found
there. Those examples will match what you find here.

### Use Persistent Dicts as Ridiculously Easy Databases

Before doing anything else, you need to understand how to make the Python
***dictionary*** datatype, or simply ***dict***, persistent. With a persistent
dict, many requirements for a database in your day-to-day work seems to go
away. A persistent dict really is a database, but you hardly have to think
about it that way.

```python
from sqlitedict import SqliteDict as sqldict

with sqldict("name.db") as db:
    db["some key"] = "Some Value"
    db.commit()
```

Now even after you've powered down your computer and come back later, you can
reverse the process and get back the values you set:

```python
from sqlitedict import SqliteDict as sqldict

with sqldict("name.db") as db:
    for key in db:
    data = db[key]
    print(data)
```

This is a million-dollar trick that gives you a lightweight NoSQL database for
every occasion. Use it as a real database. Use it as a cache. It's fast and run
by the instance of SQLite3 that comes built into Python.

You're welcome.

### Grabbing Data Quick & Easy

```python
import pandas as pd

url = 'https://www.worldometers.info/geography/alphabetical-list-of-countries/'
df = pd.read_html(url)[0]
df.to_csv("countries.csv", index=False)
```

That will drop a comma separated value file (CSV) on your drive in the same
location as where you created the Jupyter Notebook. The file will contain a
list of countries with populations, land area and density from the table that
was displaying on that URL. This trick doesn't always work, but when it does,
it's glorious. The process can be reversed as follows, and is another way to
get database-like functionality without all the fuss.

```python
df = pd.read_csv("countries.csv")
```

You're welcome.

### Python Pandas and DataFrames

In case you didn't notice, we're already using Python Pandas from the above
example. But this is where you get to understand DataFrames most often seen as
the variable df. DataFrames are row-and-column table data like you would find
in a tab in Excel or a table in SQL. The best way to represent table data with
native Python objects (not Pandas) is as a list of tuples:

```python
table = [
    ("one", "two", "three"),
    ("four", "five", "six"),
    ("seven", "eight", "nine"),
    ("ten", "eleven", "twelve"),
]
```

...which you can then turn into a Pandas DataFrame object like so:

```python
df = pd.DataFrame(table, columns=["A", "B", "C"])
```

And from there you can save it out as a CSV file or use it in further
manipulations of row & column data such as joins, aggregations and unions. For
you Excel users, that's VLookups, Pivot Tables and combining tabs, but it's a
lot nicer in Python Pandas. Data Science, yay!

You're welcome.

### Logging Into Google Services

Actually just logging in can be the hardest part of many API projects,
especially those involving Google Services. At this point, everyone else would
be telling you to register as a Google Developer, make a project at the Cloud
Console, download a client.json file, yadda, yadda not here. What you do is:

```python
import ohawf

creds = ohawf.get()
```

This will cause a login prompt to pop up for browser-based authentication.
Anyone with a Google account can do this without going through the rigmarole of
the console.developers.google.com site. I did that and made a pip installable
package to spare you the grief. Okay, so you have authorized credentials. What
now? We build a service!

```python 
import ohawf
from apiclient.discovery import build

creds = ohawf.get()
service = build("sheets", "v4", credentials=creds)
```

This is now connected to Google Sheets. Guess what comes next!

### Pushing Data Into a Google Sheet

Sooner or later, you're going to want to push that Pandas DataFrame into a
Google Spreadsheet. It can be as a datasource for Google Looker reports
(previously Google Data Studio), or to be used directly by your audience as a
sort of poor man's data dashboard. There's no shame in it. Some people use
specialty packages like GSheets for this, but I say use the Google Client
libraries directly. Here's how:

```python
import ohawf
import pandas as pd
from apiclient.discovery import build
from openpyxl.utils.cell import get_column_letter as a1

sheet_id = "[copy/paste the Google Sheet ID from URL to here]"

creds = ohawf.get()
service = build("sheets", "v4", credentials=creds)

table = [
    ("one", "two", "three"),
    ("four", "five", "six"),
    ("seven", "eight", "nine"),
    ("ten", "eleven", "twelve"),
]

df = pd.DataFrame(table, columns=["A", "B", "C"])

end_row, end_col = df.shape
end_range = f"{a1(end_col)}{end_row}"
range_names = f"A1:{end_range}"

result = (
    service.spreadsheets()
    .values()
    .update(
        spreadsheetId=sheet_id,
        range=range_names,
        valueInputOption="USER_ENTERED",
        body={"values": table},
    )
    .execute()
)
print("Done")
```

There's a ton you can do with the 
[Google Sheets API](https://developers.google.com/sheets/api/guides/concepts)
including reading data out, formatting, etc.

You're welcome.

### Listing Your Sites with Google Search Console (GSC)

### Pulling Data From GSC

### Listing Your Accounts, Web Properties & Views with Google Analytics (GA)

### Pulling Data From GA

### Pushing Data into a Google Spreadsheet.

### Pulling Data From Google Analytics G4 API

