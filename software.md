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

### Persistent Dict as Database

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

Probably the hardest common thing to need to do as a Python SEO is to log into
Google Services. There are a number of ways to do it, but here's the most
common for Jupyter Notebooks:

```python
# Import the necessary libraries
from google.oauth2.credentials import Credentials

# Load the API credentials from the JSON file
creds = Credentials.from_authorized_user_info(info=None, filename='client_secrets.json')
```

...which begs the question, how do you get a client_secrets.json file? To get a client_secrets.json file from Google for authenticating credentials, you will need to create a Google API project and enable the API that you want to use. You can do this by visiting the Google API Console (https://console.developers.google.com/).

Here are the steps to create a client_secrets.json file:

1. Go to the Google API Console and sign in with your Google account.
1. Click the "Select a project" dropdown in the top menu and select "Create a new project".
1. Give your project a name and click the "Create" button.
1. After your project is created, click the "Enable APIs and Services" button.
1. In the search bar, type the name of the API that you want to use (e.g. "Google Drive API") and click on the API when it appears in the search results.
1. Click the "Enable" button to enable the API.
1. After enabling the API, go to the "Credentials" page in the Google API Console.
1. Click the "Create credentials" button and select "OAuth client ID" from the dropdown menu.
1. Follow the prompts to create an OAuth 2.0 client ID. You will need to specify the type of application that you are building (e.g. "Web application") and provide the redirect URI for your application.
1. After creating the OAuth 2.0 client ID, you will be given a client ID and a client secret. Download the JSON file containing your API credentials by clicking the "Download" button. Save this file to your computer and rename it to "client_secrets.json".

You can then use the "client_secrets.json" file to authenticate with Google and get login credentials in Python. You can use the Google API client library for Python to do this.

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

And your Google Sheet will be updated. If this doesn't work immediately for
you, you need to get ohawf wired to your own authentication.

You're welcome.

### Listing Your Sites with Google Search Console (GSC)

### Pulling Data From GSC

### Listing Your Accounts, Web Properties & Views with Google Analytics (GA)

### Pulling Data From GA

### Pushing Data into a Google Spreadsheet.

### Pulling Data From Google Analytics G4 API

