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

Once Linux and Pipulate are installed, you need to have a Linux Terminal open
in order for Jupyter to be reachable at <a
href="http://localhost:8080">localhost:8080</a>. This is due to a limitation in
WSL and I expect this requirement to change. Windows Terminal may have
installed with Linux, but in case it didn't, grab it from the Microsoft Store.

Once you have JupyterLab displaying in your Web browser, you're in business.
Simply copy/paste any of the code in these examples into a new Notebook or go
into the repo named pipulate and run the code from the example files found
there. Those examples will match what you find here.

### Persistent Dict as Database

Before doing anything else, you need to understand how to make the Python data
type known as a ***dictionary***, or simply dict, persistent. With a persistent
dict, many requirements for a database you your day-to-day work seems to go
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

### Grabbing Data Quick & Easy

### Python Pandas and DataFrames

### Logging Into Google Services

### Listing Your Sites with Google Search Console (GSC)

### Pulling Data From GSC

### Listing Your Accounts, Web Properties & Views with Google Analytics (GA)

### Pulling Data From GA

### Pushing Data into a Google Spreadsheet.

### Pulling Data From Google Analytics G4 API

