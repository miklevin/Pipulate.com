---
title: FOSS SEO Awesome List
permalink: /software/
group: software
description: FOSS SEO Software
---

# {{ page.description }}

### Installing Linux & Pipulate

This is the page that SEOs should have been introduced to on Day 1. If you're
early in your career, congratulations! You'll run circles around the
competition, able to do so much more with so much less. Python and FOSS
software is really that awesome. To install Pipulate, <a
href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink
Me</a>.

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

Sooner or later, you're going to want to push row & column data into a Google
Spreadsheet. It can be as a datasource for Google Looker reports (previously
Google Data Studio), or to be used directly by your audience as a sort of poor
man's data dashboard. There's no shame in it. Some people use specialty
packages like GSheets for this, but I say use the Google Client libraries
directly. Here's how:

```python
import ohawf
import pandas as pd
from apiclient.discovery import build
from openpyxl.utils.cell import get_column_letter as a1

sheet_id = "[Paste your Google Sheet ID (from URL) Here]"

creds = ohawf.get()
service = build("sheets", "v4", credentials=creds)

table = [
    ("one", "two", "three"),
    ("four", "five", "six"),
    ("seven", "eight", "nine"),
    ("ten", "eleven", "twelve"),
]

end_row = len(table)
end_col = len(table[0])
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
print(result)
```

There's a ton you can do with the 
[Google Sheets API](https://developers.google.com/sheets/api/guides/concepts)
including reading data out, formatting, etc.

You're welcome.

### Connecting to Google Photos

If you've followed the examples so far, you know the general pattern to connect
to Google services of all sorts. You need only figure out the parameters for
the Google API Client's connection-building factory class like so:

```python 
import ohawf
from apiclient.discovery import build

creds = ohawf.get()
service = build("photoslibrary", "v1", credentials=creds, static_discovery=False)
```

While it's not classically SEO, you might be managing your visual assets in a
Google Photos account and would like to automate against it for building sites
or organizing assets. Point is, it's easy now that you know how to connect. So
if you want to step through 50 videos in your Google Photos whether it's in the
archive or not, you can do this which will show you the clickable links that
will let you view them, given your browser on both the Linux side and the
Windows side have been given login access to the account:

```python
import ohawf
from apiclient.discovery import build

creds = ohawf.get()
service = build("photoslibrary", "v1", credentials=creds, static_discovery=False)

npt = "" 
for count in range(50):
    args = {
        "pageSize": 100,
        "pageToken": npt,
        "filters": {"includeArchivedMedia": True, "mediaTypeFilter": {"mediaTypes": ["VIDEO"]}},
    }
    results = service.mediaItems().search(body=args).execute()
    npt = results.get("nextPageToken")
    if "mediaItems" in results:
        for item in results.get("mediaItems"):
            gid = item['id']
            url = item['productUrl']
        print(f'{count} {gid} {url}')
    if not npt:
        break
print('Done!')
```

This is quite rare code to be finding on the Internet. It works because of the
sample scopes I include with ohawf includes Google Photos. 

You're welcome.

### Making Jupyter Beep

In the above Google Photos example, I had the process stop after just 50
videos. Why? It could take a very long time. You're going to get up and walk
away, but wouldn't it be nice if you could hear the job finish? Call yourself
back when the script's done running with a loud beep?

This is a Jupyter trick, so you want to make sure you're in Jupyter. Most of
the code here really is making sure you're in Jupyter. It's also the first
Python function I've defined in these examples. Generally, you shouldn't have
to define new functions in your Jupyter code because they're made available by
the packages you're importing.

If you look carefully you'll see some of Python's most awesome features
demonstrated here such as anonymous functions (called lambdas), tuple unpacking
(symmetrical variable assignment) and shim substitution for unavailable
functions. It's all really demonstrated on the same line, really.

```python
try:
    from IPython.display import display, Audio

    is_jupyter = True
except:
    is_jupyter = False
    display, Audio = lambda x: x, lambda x: x


def beep():
    display(Audio("beep.wav", autoplay=True))


beep()
```

Now whenever you're running a long function like say a site-crawl, just throw a
beep at the end and go get yourself a coffee.

You're welcome.

### Crawling a Website

Did somebody say crawl a website? Not everything you do in SEO requires a
Google service. And you don't need ScreamingFrog either. Sometimes you can go
to the website itself and just crawl it with Python. The important thing to
know here is there's the "old way" and the "new way". The old way is
lightweight and fast, but doesn't always work. The new way involves using an
entire web browser but is slow. 

#### Setting User Agent in Requests or httpx

First, the old way. And we've got to learn to walk before we can crawl.  Even
though we're doing it the old way, Google and many sites like to believe it's a
real browser, so we set the often overlooked user agent:

```python
user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}
```

#### Using httpx For Easier Eventual Concurrency

This is where we would typically use the massively popular ***Requests***
package from Kenneth Reitz, but we want to set the stage for easy concurrency
so we're starting out with the Requests API-compatible httpx package:

```python
import httpx

url = "https://mikelev.in"
response = httpx.get(url, headers=headers)
print(response.text)
```

And there you go, that's a 1-page site-crawl. You're welcome. But wait! There's
more! Remember that first thing on this page about easy peasy databases based
on persistent Python dicts? This looks like a good time for storage!

#### Putting Python Site Crawl into Database

```python
import httpx
from sqlitedict import SqliteDict as sqldict

url = "https://mikelev.in"
response = httpx.get(url, headers=headers)
with sqldict("crawl.db") as db:
    db[url] = response
    db.commit()
```

Wait, what? Did I just write the entire Requests-like httpx response object to
a database on the hard drive? Yes indeedy I did. And I can reverse the process
too (notice no http call):

```python
from sqlitedict import SqliteDict as sqldict

with sqldict("crawl.db") as db:
    for url in db:
        response = db[url]
        print(url, response)
```

#### Extract Page Links With Beautiful Soup

Well there you go. Another million-dollar tip. But that's hardly a crawl you
say? I've only gotten 1 page and haven't extracted any of the data out of it.
Well all the code of the crawl would be too much to cram on this page, so let's
just do some quick tricks and I'll refer you to the real Jupyter Notebooks in
the Pipulate project for more extensive crawls. Let's extract some data with
beautiful soup! I always love a good Alice reference.

```python
from sqlitedict import SqliteDict as sqldict
from bs4 import BeautifulSoup as bsoup

url = "https://mikelev.in"
with sqldict("crawl.db") as db:
    response = db[url]
soup = bsoup(response.text, "html.parser")
ahrefs = soup.find_all("a")
for alink in ahrefs:
    print(alink)
```

And there's all the links on the page. Pretty astounding, right? There's a
whole bunch more about link.attrs if it has an hrefs attribute, turning
relative links to absolute, blah, blah. But let's extract the title from the
page we got. You'll find tons of advice trying to talk you out of using
Beautiful Soup. It's beautiful! Just use it. It's this easy:

#### Extract Page Title With Beautiful Soup

```python
from sqlitedict import SqliteDict as sqldict
from bs4 import BeautifulSoup as bsoup

url = "https://mikelev.in"
with sqldict("crawl.db") as db:
    response = db[url]
soup = bsoup(response.text, "html.parser")
title = soup.title.string.strip()
print(title)
```

Yeah, so pulling a bunch of the above stuff together and dropping a crawl into
a Google Sheet is a bit tricky because of relative vs. absolute links. Okay,
let's tackle that here before we move onto SERP scraping, Google Analytics and
the like. We need lists of URLs to work with for SEO after all. Sigh, okay.
Don't hurt yourself following this:

```python
from bs4 import BeautifulSoup as bsoup
from urllib.parse import urlparse, urljoin
from sqlitedict import SqliteDict as sqldict

url = "https://mikelev.in"
with sqldict("crawl.db") as db:
    response = db[url]

# URL is already homepage but this is a precaution
parts = urlparse(url)
homepage = f"{parts.scheme}://{parts.netloc}"

soup = bsoup(response.text, "html.parser")
ahrefs = soup.find_all("a")
seen = set()

for link in ahrefs:
    if "href" in link.attrs:
        href = link.attrs["href"]
        # Skip kooky protocols like email
        if ":" in href and "//" not in href:
            continue
        # Convert relative links to absolute
        if "://" not in href:
            href = urljoin(homepage, href)
        # Convert root slash to homepage
        if href == "/":
            href = homepage
        # Strip stuff after hash (not formal part of URL)
        if "#" in href:
            href = href[: href.index("#")]
        # Remove dupes and offsite links
        if href[:len(homepage)] == homepage:
            seen.add(href)
print(seen)
```

### Capturing Search Engine Results

### Taking Screenshot of Web Browser

### Listing Your Sites with Google Search Console (GSC)

### Pulling Data From GSC

### Listing Your Accounts, Web Properties & Views with Google Analytics (GA)

### Pulling Data From GA

### Pulling Data From Google Analytics G4 API

