---
title: Awesome FOSS SEO Examples
permalink: /software/
group: software
description: Pipulate FOSS SEO Software
---

# {{ page.description }}

Study this page to learn many of the best tricks needed for SEO, plus many of
the techniques that make Python a joy to use, and complex deliverables simple.

#### What You Will Find on This Page

1. TOC
{:toc}

### A Word on Python

#### Python is Not What You Think

Think of Python as just helping you think better where the imprecise spoken
word fails. Python builds on some very well designed principles or assumptions.
A good example is that files are your #1 means of organizing, and files can
***import*** other files whose contents get automatically bundled up into a
neat and tidy ***namespace***. For example, let's say you have a file on your
drive...

#### Import Fu

    foo.py

Let's say the contents of foo.py is only the following single line of code:

```python
bar = 123
```

Understand? You only one one file so far and it only has 1 line of content. Now
we introduce a 2nd file called filename.py and inside that, you put only these
two lines:

```python
import foo

print(foo.bar)
```

...which when run output:

    >> 123

So by importing import foo.py from filename.py gives filename.py access to the
***bar*** value in foo's ***namespace***. 

> If this sounds like blah blah blah, get JupyterLab installed on your machine
> right now and test this. You need this Ah-Ha! moment to proceed.

A namspace is a space for names. The same names can exist in different
namespaces without colliding with each other. If you want to simplify it, think
of it in terms of each namespace being a different universe in the multiverse
and different spider-people can exist so long as they don't all try to:

```python
from spiderverse import *
```

This would be a mess. If you did that, you would only end up with one
spider-person because all instances would collide in the same namespace and
only the last one technically imported would survive &#151; probably Chuck
Norris Spiderman. In order to have all he spider-people in the same main
namespace without having to type spiderverse all the time, you'd use the
rename-on-import trick that pandas and numpy always do:

```python
import pandas as pd
import numpy as np
import spiderverse as sv
```

Now you could refer to the spider-people individually:

```python
sv.spiderpig
sv.spidergwen
sv.peniparker
```

#### You Gotta Grok Namespaces

It's essential to understand namespaces. Python's creator Guido van Rossum made
certain language design choices which have become the gifts that keep giving.
Other languages have done similar things, but few do it quite so well as
Python, meaning users can just chug along doing work without thinking about it
much. It all easily ***internalizes***.

#### Don't Fear the OO

Namespaces give you benefits of ***Object Oriented*** design without knowing or
having to think about it. In other words, Guido is keeping you and the rest of
the world organized by forcing every file to be its own ***namespace*** by
convention. Common wisdom says you can avoid **OO** design in Python if you
want to, but you really can't. You'll just get the benefits without thinking
about it.

> That ain't OO that's the way you do it;  
> Namespaces for nothin' and imports for free!  

Files can either run as stand-alone programs, so you could run foo.py directly.
Or foo.py can be imported by other files as resources that get conveniently
grouped so that their own internal variable names don't collide. This leads to
one of the most common and befuddling bits of code you'll see everywhere in
Python:

```python
if __name__ == "__main__":
    main()
```

This is a very geeky way of saying:

> Run if called as a .py-file but don't run if imported.

This also assumes you've ***def***ined a function in the .py-file called "main"
that can be called in this way. If no def main(): is there, this code will
fail. But if you completely remove these lines, the code will run just the
same. Harumpf! Stuff like this we seasoned Pythonistas fail to explain to the
newbs, but they're such important humps to get over. 

#### Pythonic Indoctrination

There's a lot in Python that you just have to be told. At first you'll feel
like a \_\_dunder_\_.head() not knowing that you're looking at someone's
privates when you see double-underscore, or that a .dotsomething is a function
definition while .dotsomething() is actually ***calling*** that same function,
simultaneously providing a place where you could provide input (between the
parenthesis) if needed. 

#### Don't Get Py Charmed by Intellisense

Also, a .dotsomething might actually be a simple property like width or height
instead of a function definition, so you've got to explore those objects with
dir() and help() to see what's what. Every variablename in Python is a
potential object to explore. Get to know its type(). While this can be
frustrating, beware power-tools. It doesn't make sense to rely on Microsoft
Intellisense for your inquisitive abilities, so beware of being charmed by
VSCode.

#### CompPsych!

Common wisdom says ***global variables*** are bad. Well, since files import
files, what's global in one is contained in a namespace in another. The "bar"
value in the above example would be considered a global variable.

Contrary to what Java-brainwashed CompSci grads will tell you, it's completely
valid to make generous use of global variables knowing you're making convenient
bundles of foo.this and foo.that. Python's delightful because it lets you flip
a giant foo.you of practical antipatterns at compsci snobs who have no defense
but to sit and watch it run. Java people don't like Python people much. We fart
in their general direction.

This will all make sense after awhile. There's a few simple rules that govern
it all so don't worry.

#### Recursion Protection

And in case you're wondering, filename.py can import foo.py, but foo.py can
also import filename.py to no ill effect. You'd probably want to avoid it for
simplicity's sake, but such is the resiliency of Python that such circular
import reference won't break your code. On a similar note, you can re-import
foo.py from filename.py repeatedly to no ill effect.

#### The Zen of Python

If you want deeper insight into the Zen of Python:

```python
import this
```

...and notice the last line.

##### The Zen of Python, by Tim Peters

- Beautiful is better than ugly.
- Explicit is better than implicit.
- Simple is better than complex.
- Complex is better than complicated.
- Flat is better than nested.
- Sparse is better than dense.
- Readability counts.
- Special cases aren't special enough to break the rules.
- Although practicality beats purity.
- Errors should never pass silently.
- Unless explicitly silenced.
- In the face of ambiguity, refuse the temptation to guess.
- There should be one-- and preferably only one --obvious way to do it.
- Although that way may not be obvious at first unless you're Dutch.
- Now is better than never.
- Although never is often better than *right* now.
- If the implementation is hard to explain, it's a bad idea.
- If the implementation is easy to explain, it may be a good idea.
- ***Namespaces are one honking great idea &#151; let's do more of those!***

#### Let's Stay Organized Out There, People

Okay, so Python .py files create their own namespaces based on their filenames.
Hopefully you've got that. Now the next unit of organization is naturally the
folder, a.k.a. the "directory". It's not worth fighting which to call it
because neither actually exist. They are only bits on your drive which we thunk
down with some simple labels and defined behaviors so we can actually interact
with them. Got that? You've got to thunk to grok.

And with that said, make a directory for your current work. I like to use
"practice" so that I don't have to think of a nice strong label right away. So
use the OS or command-line or whatever to make a folder. Inside that folder you
do your work and will start accumulating "output" data files. These might be
***csv***'s, ***txt***'s, ***db***'s or other. If they start to clutter your
working directory, put them in a subfolder.

This or something like it should appear near the top of almost every program
you make that makes outputs data that you want to store locally (not on the
cloud). And to keep costs & dependencies down while keeping performance up,
that should be almost everything. I put million-page crawls in such data
folders, even on my feeble laptop.

```python
from pathlib import Path

Path("data").mkdir(exist_ok=True)
```

### Getting Started With Pipulate

On Windows 10 or 11, run the <a
href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink
Me</a> script using the instructions found on that page. At first Pipulate
looks just like JupyterLab being installed on Windows accessible at <a
href="http://localhost:8080">localhost:8080</a>, but there are a few key
differences:

- Jupyter is running on Linux (better for automation)
- You have a ***repos*** folder containing ready-to-run examples
- You can schedule Notebooks to run as Linux system services

#### Microsoft Pauses systemd

You will however have to open a Linux Terminal to "wake up" Jupyter. This is
due to a limitation in WSL and I expect this requirement to change soon.  You
will want to use Windows Terminal which probably installed with Linux, but in
case it didn't, grab it from the Microsoft Store.

### Ready to Automate Examples

Once you have JupyterLab displaying in your Web browser, you're in business.
You can copy/paste examples from this page into a new Notebook, or load similar
examples from the practice folder found there.

As you get good at it, you'll use nbdev to create .py files from the notebooks
which can be used directly in-location as Linux daemons &#151; right on your
Windows system. And because it's so similar to a real-world server deployment,
24x7 automation is one git clone away from a Raspberry Pi, NAS or cloud server.

#### Rapid-Fire Million-Dollar Ideas

While not technically an ***Awesome List*** for Python SEO, Pipulate is a list
of awesome techniques and sample-code that brings you, I believe, a massive
step closer to your love-worthy work and six-figure job goals. I've been in
tech for over 30-years and SEO in particular as long as it's been a field. I've
acquired quite a few million-dollar ideas over the years, and they are best
expressed here in Python. Bringing you Pipulate is my Ikigai.

### Persistent Dicts as Easy Databases

#### Here's Your First Million-Dollar Idea

Before doing anything else, you need to understand how to make the Python
***dictionary*** datatype, or simply ***dict***, persistent. If this is
gobbledygook to you, you need a primer on the 3 main Python datatypes: lists,
tuples and dicts. Dicts are like common JavaScript JSON. That is, they're
key/value pairs. 

With a persistent dict, many requirements for a database in your day-to-day
work seems to go away. A persistent dict really is a database, but you hardly
have to think about it that way.

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
every occasion. It especially enables the pattern of grabbing and saving the
raw-data first, then loading, extracting and transforming it later.

Bonus: ***ETL*** stands for Extract, Transform & Load, standard terminology in
the industry for this type of work.

#### Persistent Dicts Wired to SQLite3

Use persistent dicts as real databases. Use them as a caches to speed things
up. Even though they do require a pip install of a 3rd party package to
activate, they're still just using the standard Python dictionary (dict) API.
They're back-ended by the ubiquitous workhorse of the tech industry, SQLite3,
which is already included with Python.

### Grab Data From Webpages Easily

Here's a way to grab some data quick and easy off of a webpage...

```python
import pandas as pd

url = 'https://www.worldometers.info/geography/alphabetical-list-of-countries/'
df = pd.read_html(url)[0]
df.to_csv("countries.csv", index=False)
print(df)
```

           #      Country  Population (2020)  Land Area  (Km²)  Density (P/Km²)
    0      1  Afghanistan           38928346            652860               60
    1      2      Albania            2877797             27400              105
    2      3      Algeria           43851044           2381740               18
    3      4      Andorra              77265               470              164
    4      5       Angola           32866272           1246700               26
    ..   ...          ...                ...               ...              ...
    190  191    Venezuela           28435940            882050               32
    191  192      Vietnam           97338579            310070              314
    192  193        Yemen           29825964            527970               56
    193  194       Zambia           18383955            743390               25
    194  195     Zimbabwe           14862924            386850               38

    [195 rows x 5 columns]

The above example will drop a comma separated value file (CSV) on your drive in
the same location as where you created the Jupyter Notebook. The file will
contain a list of countries with populations, land area and density from the
table that was displaying on that URL. This is direct from webpage to Pandas
dataframe. Why wouldn't you? The process can be reversed to read the CSV from
your drive back into memory as follows.

```python
df = pd.read_csv("countries.csv")
```

This trick doesn't always work, but when it does, it's glorious. Sometimes you
have to poke around. You actually get back a ***list*** of DataFrames and have
to grab the right one. This will grab a history of web browsers. You can see
how instead of grabbing the zero'th item in the list, we're grabbing the 1st.
Python uses zero-based indexes, so "1" actually means the second df in the
list:

```python
import pandas as pd

pd.set_option('display.max_rows', None)
url = "https://en.wikipedia.org/wiki/History_of_the_web_browser"
list_of_dfs = pd.read_html(url)
df = list_of_dfs[1]
print(df)
```

Outputs:

        Year                                       Web browsers
    0   1990                               WorldWideWeb (Nexus)
    1   1991                                  Line Mode Browser
    2   1992         Erwise, MacWWW (Samba), MidasWWW, ViolaWWW
    3   1993    AMosaic 1.0, Arena, Cello,[44] Lynx 2.0, Mosaic
    4   1994  Agora (Argo), IBM WebExplorer, IBrowse, MacWeb...
    ..   ...                                                ...
    29  2019  Chrome 72–79, Firefox 65–71, Microsoft Edge, O...
    30  2020  Chrome 80–87, Firefox 72–84, Microsoft Edge, O...
    31  2021  Chrome 88–96, Firefox 85–95, Microsoft Edge 88...
    32  2022  Chrome 97–107, Firefox 96–107, Microsoft Edge ...

Bonus: This is an interesting one because for the 32 years it covers, it's only
showing 32 rows. That's because there are multiple browsers per row, separated
by commas. This may be a bit advanced for this early, but we can ***explode***
these 32 rows to 186 rows by forcing it to show one row per browser splitting
the entries:

```
df["Web browsers"] = df["Web browsers"].apply(lambda x: x.split(", "))
df_all = df.explode("Web browsers")
print(df_all)
```

Outputs:

        Year           Web browsers
    0   1990   WorldWideWeb (Nexus)
    1   1991      Line Mode Browser
    2   1992                 Erwise
    2   1992         MacWWW (Samba)
    2   1992               MidasWWW
    ..   ...                    ...
    32  2022         Firefox 96–107
    32  2022  Microsoft Edge 97–107
    32  2022            Opera 83–93
    32  2022         Safari 15.4–16
    32  2022        Vivaldi 5.1–5.5

    [186 rows x 2 columns]

#### Reading HTML Tables vs. Plain Text

That pd.read_html() function from the above examples really needs the data to
be in HTML table tags. If it's just a list in plain text, you can use a similar
trick, but with a few extra steps. Here's how we can get a list of all
***TLDs*** (top-level domains) from ICANN:

```python
import httpx
import pandas as pd

r = httpx.get("https://data.iana.org/TLD/tlds-alpha-by-domain.txt")
df = pd.DataFrame(r.text.split("\n")[1:], columns=["tld"])
df.to_csv("tlds.csv", index=False)
print(df)
```

Outputs:

              tld
    0         AAA
    1        AARP
    2      ABARTH
    3         ABB
    4      ABBOTT
    ...       ...
    1477       ZM
    1478     ZONE
    1479  ZUERICH
    1480       ZW
    1481         

    [1482 rows x 1 columns]

### Loading Text as JSON from Web

If you happen to know where some JSON can be found on the Internet such as this
master list of Categories for Google Trends, you can load it directly as
structured data... well, not always. In this case instead of the prettier way
of loading the .json() method of an httpx response object, I need to load it as
a string first so we can chop off the first 4 characters. The resulting text
can be turned into JSON using Python's standard json package. 

```python
import json
import httpx

# Make a request to the webpage
response = httpx.get('https://trends.google.com/trends/api/explore/pickers/category?hl=en-US&tz=240')
gtrendcats = json.loads(response.text[4:])
```

```javascript
{'children': [{'children': [{'name': 'Celebrities & Entertainment News',
     'id': 184},
    {'children': [{'name': 'Animated Films', 'id': 1104},
      {'name': 'Anime & Manga', 'id': 317},
      {'name': 'Cartoons', 'id': 319},
      {'name': 'Comics', 'id': 318}],
     'name': 'Comics & Animation',
     'id': 316},
...
    {'children': [{'name': 'Tourist Boards & Visitor Centers', 'id': 1392},
      {'name': 'Vacation Offers', 'id': 1019}],
     'name': 'Travel Agencies & Services',
     'id': 1010},
    {'name': 'Travel Guides & Travelogues', 'id': 1011}],
   'name': 'Travel',
   'id': 67}],
 'name': 'All categories',
 'id': 0}
```

This is just a reminder that not all data is rows and columns. Sometimes you
get jagged arrays. But when it is row & column data, you can use a Pandas
DataFrame!

### Understanding Pandas DataFrames

In case you didn't notice, we're already using Python Pandas from the above
example. But this is where you get to understand DataFrames which you'll most
often see around the Net as the variable ***df***. When you see df, think
***Excel tab*** or ***SQL table***. DataFrames are row-and-column data. You'll
also hear the term ***matrices*** or simply ***tables***.

The ubiquitous Python 3rd party library called Pandas provides the special
datatype called DataFrame to handle such row & column data. If you've outgrown
Excel or want to do SQL stuff without a huge tech liability, Pandas is your
answer. However, you don't ***have*** to use Pandas DataFrames to manipulate
tables in Python. Much of the time, it's not even necessary.

The best way to represent tables in Python without Pandas is as a list of
tuples:

#### List of Tuples

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

Bonus: It's a small but sometimes important point that even though all these
tricks will work with lists-of-lists, lists are a ***dynamic*** and mutable
datatype, meaning tons of them is bad for your computer. Lists of tuples
process much more efficiently.

#### Saving df to CSV or Excel

```python
df.to_csv("file.csv", index=False)
df.to_excel("file.xlsx", index=False)
```

And from there you can save it out as a CSV file or use it in further
manipulations of row & column data such as joins, aggregations and unions. For
you Excel users, that's VLookups, Pivot Tables and combining tabs, but it's a
lot nicer in Python Pandas. Data Science, yay!

### Logging Into Google Services

A lot more people would be doing advanced SEO work in Python and Jupyter were
it not so difficult to log into Google services. OAuth2 login is the bane of
many aspiring SEO Pythonista's existence.

#### OAuth2 The Bane of Our Existence

Actually just logging into Google can be the hardest part of many projects,
especially those involving Analytics, Search Console or Sheets. Most other
sites at this point will be telling you to register as a Google Developer, make
a project at the Cloud Console, download a credentials.json file, yadda, yadda.
It's not terrible advice if you can manage it, and it gives you more options
than the way I provide here. But the way I provide here has this one distinct
advantage: it's going to work for you here and now.

```python
import ohawf

creds = ohawf.get()
```

This will cause a login prompt to pop up for browser-based authentication.
Anyone with a Google account can do this without going through the rigmarole of
the console.developers.google.com site. I basically did the hard work for you,
so you can connect right away and get to business...

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
packages like GSpread for this, but I say use the Google Client libraries
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

### Making Jupyter Beep

In the above Google Photos example, I had the process stop after just 50
videos. Why? It could take a very long time. You're going to get up and walk
away, but wouldn't it be nice if you could hear the job finish? Call yourself
back when the script's done running with a loud beep?

This is a Jupyter trick, so you want to make sure you're in Jupyter. Most of
the code here really is making sure you're in Jupyter. It's also the first
Python function I've defined in these examples. Generally, you shouldn't have
to define new functions in your Jupyter code because they're made available by
the packages you're importing. That's a trick to keep the code you're actually
looking at just the important overarching program-flow stuff.

#### Beep at End Of Script

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
beep at the end and go get yourself a coffee. And if the code ends up on a
server, it'll pass silently.

#### Anonymous Lambda Functions & Tuple Unpacking

If you look carefully you'll see some of Python's most awesome features
demonstrated here such as anonymous functions (called lambdas), tuple unpacking
(symmetrical variable assignment) and shim substitution for unavailable
functions. It's all really demonstrated on the same line, really.

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

user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}

url = "https://mikelev.in"
response = httpx.get(url, headers=headers)
print(response.text)
```

And there you go, that's a 1-page site-crawl. But wait! There's more! Remember
that first thing on this page about easy peasy databases based on persistent
Python dicts? This looks like a good time for storage!

#### Putting Python Site Crawl into Database

```python
import httpx
from sqlitedict import SqliteDict as sqldict

user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}

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

And there's all the links on the page. Pretty astounding, right? 

    <a class="current" href="/">~/</a>
    <a href="/linux/">Linux</a>
    <a href="/python/">Python</a>
    <a href="/vim/">vim</a>
    <a href="/git/">git</a>
    <a href="/logo/"><img border="0" src="/assets/logo/mike-levin.gif" style="vertical-align:middle"/></a>
    <a href="/seo/">SEO</a>
    <a href="/blog/">Blog</a>
    <a href="https://www.youtube.com/MikeLevin">Channel</a>
    <a href="/linux/">Linux</a>
    <a href="/python/">Python</a>
    <a href="/vim/">vim</a>
    <a href="/git/">git</a>
    <a href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink Me!</a>
    <a href="https://levinux.com">Levinux</a>
    <a href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink Me!</a>
    <a href="https://pipulate.com">Pipulate</a>
    <a href="https://levinux.com">Levinux</a>
    <a href="https://pipulate.com">Pipulate</a>
    <a href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink Me</a>
    <a href="https://www.tiktok.com/@miklevin">TikTok</a>
    <a href="https://github.com/miklevin">GitHub</a>
    <a href="https://www.linkedin.com/in/miklevin/">LinkedIn</a>
    <a href="https://www.facebook.com/mikelevinux">Facebook</a>
    <a href="https://www.instagram.com/miklevin/">Instagram</a>
    <a href="https://www.reddit.com/user/mikelevinux">Reddit</a>
    <a href="https://twitter.com/miklevin">Twitter</a>
    <a href="https://levinux.com">Levinux</a>
    <a href="https://pipulate.com">Pipulate</a>
    <a href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">DrinkMe!</a>

There's a whole bunch more about link.attrs if it has an hrefs attribute,
turning relative links to absolute, blah, blah. But let's extract the title
from the page we got. You'll find tons of advice trying to talk you out of
using Beautiful Soup. It's beautiful! Just use it. It's this easy:

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

#### Turning Relative Links to Absolute Links

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

Okay so you've got a list of links found on a page but the URLs are not stored
anywhere in a persistent database, nor was each URL actually visited and the
response stored. An interesting note about the key/value pars of our sqlite
dict: the values can be the special Python None value. That seems like a good
way to turn our database into a to-do list of pages to visit, like so:

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

with sqldict("crawl.db") as db:
    for link in ahrefs:
        if "href" in link.attrs:
            href = link.attrs["href"]
            if ":" in href and "//" not in href:
                continue
            if "://" not in href:
                href = urljoin(homepage, href)
            if href == "/":
                href = homepage
            if "#" in href:
                href = href[: href.index("#")]
            if href[:len(homepage)] == homepage:
                seen.add(href)
                if href not in db:
                    db[href] = None
    db.commit()
```

...and as usual with SqliteDict, you can reverse the process like so:

```python
from sqlitedict import SqliteDict as sqldict

with sqldict("crawl.db") as db:
    for url in db:
        data = db[url]
        print(url, data)
```

...which at the time of this writing produces:

    https://mikelev.in <Response [200 OK]>
    https://mikelev.in/ None
    https://mikelev.in/linux/ None
    https://mikelev.in/python/ None
    https://mikelev.in/vim/ None
    https://mikelev.in/git/ None
    https://mikelev.in/logo/ None
    https://mikelev.in/seo/ None
    https://mikelev.in/blog/ None

Getting the idea? Can you guess our next step?

#### But First a Word On Python Context Manager and SQLite Commit

A A Nuance I'm using something called the Python "context manager" with
SqliteDict. You can tell the content manager by the "with/as" keywords and
accompany indent. The "as" variable (really a file handle) goes away after the
outdent. That's the point. That's it's context. 

SqliteDict when used with the context manager (there are other ways) won't
commit changes to the persistent on-drive database file unless you do a
.commit(). Because commit hits actual hardware and could slow things down on a
big crawl, it's better to commit once per page (outer loop) rather than on the
inner loop per link. 

Now let's get the missing pages:

#### Performing a 1-Click-Depth Crawl of a Website

```python
import httpx
from sqlitedict import SqliteDict as sqldict

user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}

with sqldict("crawl.db") as db:
    for url in db:
        response = db[url]
        print(url, response)
        if not response:
            response = httpx.get(url, headers=headers)
            db[url] = response
            db.commit()
```

And here's the output:

    https://mikelev.in <Response [200 OK]>
    https://mikelev.in/ <Response [200 OK]>
    https://mikelev.in/linux/ <Response [200 OK]>
    https://mikelev.in/python/ <Response [200 OK]>
    https://mikelev.in/vim/ <Response [200 OK]>
    https://mikelev.in/git/ <Response [200 OK]>
    https://mikelev.in/logo/ <Response [200 OK]>
    https://mikelev.in/seo/ <Response [200 OK]>
    https://mikelev.in/blog/ <Response [200 OK]>

Almost magical, right? It's the perfect setup for an SEO investigation. You've
preformed a 1 click-depth crawl of a website and stored ALL the browser-like
view-source results (HTML) of the page into a local, easily accessed database
for father investigation.

#### What Do You Do With a Database of Pages?

What kind of investigations? Let's extract the title tags, create a Pandas
DataFrame, save the URLs plus title tags as an Excel document and push it to
Google Sheets.

We begin with just an Excel file. It's pretty much the exact same process as
saving a csv, but it gives you a tiny bit of default formatting, making the
presence of column labels very clear.

#### Crawling a Website Directly Into Excel Document

```python
from sqlitedict import SqliteDict as sqldict
from bs4 import BeautifulSoup as bsoup
import pandas as pd

table = []
with sqldict("crawl.db") as db:
    for url in db:
        response = db[url]
        if response:
            soup = bsoup(response.text, "html.parser")
            title = soup.title.string.strip()
            atuple = (url, title)
            table.append(atuple)
df = pd.DataFrame(table, columns=["url", "title"])
df.to_excel("crawl.xlsx", index=False)
```

### Concurrent Web Crawls

I really don't want to at this point because it will make your head explode.
But I feel I really have to because people are going to ask, and it's the
reason we used httpx over requests. If you have a list of URLs and you want to
fetch all their page content all at once, classically a task for CURL or
JavaScript, you do it like this, which can for example be used to update the
crawl.db for a small website (small, because it's all "in-memory"):

```python
import httpx
from asyncio import gather
from sqlitedict import SqliteDict as sqldict

user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}

# Build a list of URLs from prior crawl
table = []
with sqldict("crawl.db") as db:
    for url in db:
        table.append(url)

# Fetch All Pages All At Once
headers = {"user-agent": user_agent}
async with httpx.AsyncClient(headers=headers) as machinegun:
    responses = await gather(*[machinegun.get(url) for url in table], return_exceptions=True)

print(responses)
```

You are especially welcome for the above code. That's another million-dollar
bit of goodness there. Don't be jealous of JavaScript or CURL. You can do
concurrency just fine in Python. I admit the pattern is a bit odd, but you'll
get used to it.

#### Keeping Inputs & Outputs In Sync (Zippable)

I promised you updating it back to the database, and there's a nuanced point
here. The way I did this just built a list of responses whose response.url does
not necessarily match the database URL-key because redirection. Not the case
here, but it could be. So, we zip the 2 tables together. This is possible
because return_exceptions=True ensures the size of the list out is the same as
the list in. If you really wanted to, you can do a quick Python list
comprehension to show the URLs that came back from the crawl:

```python
[x.url for x in responses]
```

Outputs:

```python
[URL('https://mikelev.in'),
 URL('https://mikelev.in/'),
 URL('https://mikelev.in/linux/'),
 URL('https://mikelev.in/python/'),
 URL('https://mikelev.in/vim/'),
 URL('https://mikelev.in/git/'),
 URL('https://mikelev.in/logo/'),
 URL('https://mikelev.in/seo/'),
 URL('https://mikelev.in/blog/')]
```

But it's not back in the database. We just fetched it concurrently and it's
sitting in memory waiting to be lost by a Jupyter Reset Kernel (which you
should be doing often). Write it back to the database like so:

#### Zipping Lists into Dicts in Python

```python
import httpx
from asyncio import gather
from sqlitedict import SqliteDict as sqldict

user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}

# Build a list of URLs from prior crawl
table = []
with sqldict("crawl.db") as db:
    for url in db:
        table.append(url)

# Fetch All Pages All At Once
headers = {"user-agent": user_agent}
async with httpx.AsyncClient(headers=headers) as machinegun:
    responses = await gather(*[machinegun.get(url) for url in table], return_exceptions=True)

# Zip input and output lists together into dict
site_dict = dict(zip(table, responses))

# Update the database with the new data (which was fetched concurrently)
with sqldict("crawl.db") as db:
    for url in site_dict:
        db[url] = site_dict[url]
        db.commit()
```

### Update Google Sheet With API

#### First a Few Words About APIs

There are many pip installable packages you can use here to alleviate this next
step, namely GSpread and PyGSheets but neither is popular enough to learn their
API versus the only slightly harder direct-from-google Python API for Google
Sheets. Packages like GSpread and PyGSheets which while undoubtedly offer
convenience, are not so different from the main API (especially in this case)
that you're better off than getting first-hand API experience.

#### Official Is Best If Official Isn't That Much Worse

The official Google Sheets API takes a list of tuples just like everything
we've been doing with Pandas and it's easy to go back and forth between
DataFrames and lists of tuples. Pandas even has a special word for this
conventional data structure. They call it records. So conceptually we're
shoving records into Google Sheets directly through Google's GSheets API.

You do however need to know some magic words to go from Python DataFrame to
lists of tuples. Abracadabra!

```python
table = list(map(tuple, df.to_records(index=False)))
```

#### Updating Excel-Like Rectangular Range Region

You saw from the above Google Sheet example that we can "blit" rectangular
regions of data (lists of tuples) into specified Excel-style letter-ranges,
such as A1:B2. We can target specific tabs with the standard convention used in
Excel formulas:

    'Sheet 1'!A1:B2

Namely, an exclamation point goes before the range, and if there's a space in
the name, you put single-quotes around the tab name. This whole thing is used
in the GSheets API as input for where the list of tuples you provide
is going to end up. 

As you plan your blit, you may want to shift everything down by a row if you're
going to insert column labels on row 1, or alternatively make row 1 of your
data be column labels. Up to you, but any way you blit it, you've got to watch
your range string. There will inevitably be use of offsets and you must know
how many columns across and how many rows down your data has. That gets used in
building the range string. 

```python
import pandas as pd
from apiclient.discovery import build
from openpyxl.utils.cell import get_column_letter as a1

# Load data
df = pd.read_excel("crawl.xlsx")

# Grab row and column sizes
end_row, end_col = df.shape

# Convert Records to List of Tuples (MAGIC WORDS)
table = list(map(tuple, df.to_records(index=False)))

# Insert column labels as row 1
table.insert(0, ("url", "title"))
start_row = 1
range_names = f"A{start_row}:{a1(end_col)}{end_row + start_row}"

# Load Google Sheet ID from file
with open("sheet_id.txt") as fh:
    spreadsheet_id = fh.readline()

# Authenticate
creds = ohawf.get()
service = build("sheets", "v4", credentials=creds)

# Update Sheet
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

#### But What About Log-File Style Updates?

If you're adding something to the end of an existing list log-file style, you
have to be able to find the starting point. While it's not the most efficient
thing in the world, I find the best trick is to just load all the data on that
tab and look for the first unclosed row of blank data. If data comes later,
that closes it. The 2 above examples connect together to give you appending
your new rows at the bottom, log-file style.

```python
import ohawf
import pandas as pd
from apiclient.discovery import build
from openpyxl.utils.cell import get_column_letter as a1

with open("sheet_id.txt") as fh:
    spreadsheet_id = fh.readline()

# Set the test-range
sheet_range = 'Sheet1!A:Z'

# Build the Sheets API client
creds = ohawf.get()
service = build('sheets', 'v4', credentials=creds)

# Get the test-range (everything)
result = service.spreadsheets().values().get(
    spreadsheetId=spreadsheet_id, range=sheet_range).execute()
rows = result.get('values', [])

# Find the last row that has data
last_row = len(rows)
while last_row > 0 and not any(rows[last_row - 1]):
    last_row -= 1

# Load data
df = pd.read_excel("crawl.xlsx")
end_row, end_col = df.shape
table = list(map(tuple, df.to_records(index=False)))

# Insert column labels as row 1
start_row = last_row + 1
range_names = f"A{start_row}:{a1(end_col)}{end_row + start_row}"

# Update Sheet
result = (
    service.spreadsheets()
    .values()
    .update(
        spreadsheetId=spreadsheet_id,
        range=range_names,
        valueInputOption="USER_ENTERED",
        body={"values": table},
    )
    .execute()
)
print(result)
```

### Capturing Search Engine Results

Did somebody say SERPs? Shhhhh! Maybe run VPN when you do this one so you don't
look excessively like a robot. Don't do this too often nor with too long of
keyword lists. Slipping 3 in like this is fine, without even using a delay.
This is just the collection phase. Notice if you re-run this, it will not
perform the SERP scrape again. It knows what it already collected.

#### Doing It Old School (The Top-10 World)

It is also worth noting, this is the "old school" way of doing SEO, thinking of
everything more or less a Top-10 ranking race on page-1 of search results.
There's more to the story we'll get to in later examples including browser
automation and parsing the page for news and other info. This is the basics.

```python
import httpx
from urllib.parse import quote_plus
from sqlitedict import SqliteDict as sqldict

keywords = ["mike levin seo", "levinux", "pipulate"]
search_base = "https://www.google.com/search?q="
user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}

with sqldict("serps.db") as db:
    for keyword in keywords:
        if keyword not in db:
            search_url = f"{search_base}{quote_plus(keyword)}"
            print(search_url)
            response = httpx.get(search_url, headers=headers)
            db[keyword] = response
            db.commit()
```

Data goes in, data comes out. We can take a quick spin through to make sure
that it's a good http status code. 

```python
with sqldict("serps.db") as db:
    for keyword in db:
        response = db[keyword]
        print(response.status_code, keyword)
```

We're looking for 200's here. 

    200 mike levin seo
    200 levinux
    200 pipulate

A 302 indicates you've triggered the captcha. Remember, this step is totally
safe because the scraping is done. We're looking now at the raw-data we quickly
plopped into storage from the above step.

#### Extracting SERPs From Raw Scrape Data

You can extract out the search results including the title that appeared with
the search listing and save it to a CSV, Excel File, drop in Google Sheets, you
get the idea. I'll show CSV here 'cause it's the easiest. Notice how we're
building a table by iterating through each set of SERPs and adding the position
based on a counter in that loop. We're emptying out SERP sub-tables into one
big master table, adding the search position and keyword searched-on as we do.

```python
import re
import pandas as pd
from sqlitedict import SqliteDict as sqldict

def extract_serps(text):
    """Return list of Google search results from provided "raw" SERP scrape.
    Useful for checking whether SERPS actually collected or extracting results."""

    rv = False
    try:
        div_pat = re.compile('<div class="yuRUbf">(.*?)</div>')
        divs = re.findall(div_pat, text)
        lot = []
        for div in divs:
            pat_url = re.compile('<a href="(.*?)"')
            url_group = re.match(pat_url, div)
            pat_title = re.compile('<h3 class="LC20lb MBeuO DKV0Md">(.*?)</h3>')
            title_group = re.search(pat_title, div)
            try:
                url = url_group.groups(0)[0]
            except:
                url = ""
            try:
                title = title_group.groups(0)[0]
            except:
                title = ""
            lot.append((url, title))
        rv = lot
    except:
        pass
    return rv

table = []
with sqldict("serps.db") as db:
    for keyword in db:
        response = db[keyword]
        print(keyword)
        extracted = extract_serps(response.text)
        for i, serp in enumerate(extracted):
            row = (i+1, keyword, serp[0], serp[1])
            table.append(row)

columns = ["position", "keyword", "url", "serp title"]
df = pd.DataFrame(table, columns=columns)
df.to_csv("serps.csv", index=False)
```

One can easily imagine using our site crawling ability from examples higher on
this page to crawl each of the URLs that came back in search. We could then
compare the SERP Title (the title given to the page by Google) versus the
actual title tag on the page. Many SEO deliverable-types suggest themselves.
And just wait until we get to hitting Google Search Console and Analytics!

### Connecting to Search Console

#### Listing Your Sites with Google Search Console (GSC)

Okay, let's do GSC. It's worth pointing out what the [Google code
examples](https://developers.google.com/webmaster-tools/v1/quickstart/quickstart-python) 
looks like. Ugh! It's like they obfuscate it on purpose. Let's make it as easy
as possible. First let's get a list of GSC sites to which our Google login has
access:

```python
import ohawf
from apiclient.discovery import build

creds = ohawf.get()
service = build("searchconsole", "v1", credentials=creds)
gsc_sites = service.sites().list().execute()
sites = [x["siteUrl"] for x in gsc_sites["siteEntry"]]
for site in sites:
    print(site)
```

You should see output something like:

    sc-domain:mikelev.in
    sc-domain:pipulate.com
    sc-domain:levinux.com

#### Generating Google-API-Friendly Dates

You can take any of those above values (including sc-domain:) and use it to
pull metrics. From GSC, keywords is the default dimension, meaning you at least
always get keywords back, plus the usual GSC metrics (clicks, impressions, ctr
and position). But you usually have to at least give a start and end date in
the input so the metrics are returned for a time-period. GSC goes back 16
months and takes the yyyy-mm-dd pattern for dates. So let's get the start and
end dates for the last 16 months:

```python
from datetime import datetime
from dateutil.relativedelta import relativedelta as rd

# Pick your API's date format
patterns = ["%Y-%m-%d", "%d-%m-%Y", "%Y/%m/%d", "%d/%m/%Y"]
pattern = patterns[0]

# Typical month ranges for GA APIs
months_back = 16
table = []
for x in range(months_back):
    start_date = datetime.now().date().replace(day=1) - rd(months=x)
    end_date = start_date + rd(months=1) - rd(days=1)
    start_date = start_date.strftime(pattern)
    end_date = end_date.strftime(pattern)
    table.append((start_date, end_date))

for timetuple in table:
    print(timetuple)
```

...which gives this:

    ('2022-12-01', '2022-12-31')
    ('2022-11-01', '2022-11-30')
    ('2022-10-01', '2022-10-31')
    ('2022-09-01', '2022-09-30')
    ('2022-08-01', '2022-08-31')
    ('2022-07-01', '2022-07-31')
    ('2022-06-01', '2022-06-30')
    ('2022-05-01', '2022-05-31')
    ('2022-04-01', '2022-04-30')
    ('2022-03-01', '2022-03-31')
    ('2022-02-01', '2022-02-28')
    ('2022-01-01', '2022-01-31')
    ('2021-12-01', '2021-12-31')
    ('2021-11-01', '2021-11-30')
    ('2021-10-01', '2021-10-31')
    ('2021-09-01', '2021-09-30')

#### Pulling Data From GSC

Okay, so let's pull some data!

```python
import ohawf
from apiclient.discovery import build

creds = ohawf.get()
service = build("searchconsole", "v1", credentials=creds)

site = "sc-domain:mikelev.in"
start_date = "2022-11-01"
end_date = "2022-11-30"

query = {
    "dimensions": ["QUERY"],
    "startDate": start_date,
    "endDate": end_date,
}

results = service.searchanalytics().query(siteUrl=site, body=query).execute()

columns = ["keys", "clicks", "impressions", "ctr", "position"]

table = [
    (x["keys"][0], x["clicks"], x["impressions"], x["ctr"], x["position"])
    for x in results["rows"]
]

df = pd.DataFrame(table, columns=columns)
filename = f"{site.replace(':', '_')}_{start_date}.csv"
df.to_csv(filename, index=False)
```

It's time we stopped littering up the directory we're working in with CSV
files. When we combine the 2 above steps, we'll be producing 16 csv files, and
they should drop into a directory that maybe doesn't exist yet:

```python
from pathlib import Path

Path("gsc").mkdir(exist_ok=True)
```

And so putting it all together, we get:

```python
import ohawf
import pandas as pd
from pathlib import Path
from datetime import datetime
from apiclient.discovery import build
from dateutil.relativedelta import relativedelta as rd

creds = ohawf.get()
service = build("searchconsole", "v1", credentials=creds)

site = "sc-domain:mikelev.in"
columns = ["keys", "clicks", "impressions", "ctr", "position"]

months_back = 16
Path("gsc").mkdir(exist_ok=True)
for x in range(months_back):
    start_date = datetime.now().date().replace(day=1) - rd(months=x)
    end_date = start_date + rd(months=1) - rd(days=1)
    pattern = "%Y-%m-%d"
    start_date = start_date.strftime(pattern)
    end_date = end_date.strftime(pattern)
    query = {
        "dimensions": ["QUERY"],
        "startDate": start_date,
        "endDate": end_date,
    }
    results = service.searchanalytics().query(siteUrl=site, body=query).execute()
    table = [
        (x["keys"][0], x["clicks"], x["impressions"], x["ctr"], x["position"])
        for x in results["rows"]
    ]
    df = pd.DataFrame(table, columns=columns)
    filename = f"gsc/{site.replace(':', '_')}_{start_date}.csv"
    df.to_csv(filename, index=False)
    print(filename)
```

...which outputs:

    gsc/sc-domain_mikelev.in_2022-12-01.csv
    gsc/sc-domain_mikelev.in_2022-11-01.csv
    gsc/sc-domain_mikelev.in_2022-10-01.csv
    gsc/sc-domain_mikelev.in_2022-09-01.csv
    gsc/sc-domain_mikelev.in_2022-08-01.csv
    gsc/sc-domain_mikelev.in_2022-07-01.csv
    gsc/sc-domain_mikelev.in_2022-06-01.csv
    gsc/sc-domain_mikelev.in_2022-05-01.csv
    gsc/sc-domain_mikelev.in_2022-04-01.csv
    gsc/sc-domain_mikelev.in_2022-03-01.csv
    gsc/sc-domain_mikelev.in_2022-02-01.csv
    gsc/sc-domain_mikelev.in_2022-01-01.csv
    gsc/sc-domain_mikelev.in_2021-12-01.csv
    gsc/sc-domain_mikelev.in_2021-11-01.csv
    gsc/sc-domain_mikelev.in_2021-10-01.csv
    gsc/sc-domain_mikelev.in_2021-09-01.csv

#### Combining Multiple CSV Files Into One (like a SQL UNION)

Okay so now we've got a folder full of CSVs with no way to tell them apart
except for the filename. So if we were to want to load all these CSVs back in
and treat them like a single DataFrame, table, tab or whatnot, what to do? Have
you ever tried to combine multiple CSVs in Excel? Not fun. In SQL this is
called a UNION, also not much fun.

Here in Python with Pandas? It is fun, and you do it like so. The main thing to
notice is pd.concat() which turns a list of column-compatible dataframes into a
single dataframe.

```python
import pandas as pd
from pathlib import Path
from time import strptime

# Make a list of all files in a folder
files = Path("gsc").glob("*.csv")

# Step through files, add some columns and append DataFrame to list
lots = []
for afile in files:
    print(afile)
    df = pd.read_csv(afile)
    month_of = afile.name.split("_")[2][:-4]
    df["month of"] = month_of
    lots.append(df)

# Create a single DataFrame from df's in list and write to file.
df_all = pd.concat(lots)
df_all.to_csv("all_files.csv", index=False)
```

### Record Keeping With Named Tuples

When you're processing a long-running, API-hitting data-pulling job, there will
be problems that are can be hard to track down. As the outer and inner loops
are processed, something gets skipped but the overall job keeps going because
the job must complete. You come back later. Did something go wrong? How will
you now? Examining the output? Implementing log files?

It turns out that Python offers the perfect mechanism to minimize moving parts
and to know easily what hasn't processed yet. It has the added benefit of
eliminating nested looks and "flattening" the job to just stepping through a
single list of pre-bundled sets of API-arguments. Let me show you.

Let's say you need to look at the date of every day of this millennium so far.

```python
from datetime import datetime
from dateutil.relativedelta import relativedelta as rd

x = 1
dates = []
while True:
    adate = datetime.now().date().replace(day=1) - rd(days=x)
    pattern = "%Y-%m-%d"
    if adate < datetime(2000, 1, 1).date():
        break
    adate = adate.strftime(pattern)
    dates.append(adate)
    print(adate)
    x += 1
```

This is the abbreviated output:

    2022-11-30
    2022-11-29
    2022-11-28
    2022-11-27
    ...
    2000-01-04
    2000-01-03
    2000-01-02
    2000-01-01

At the time of this writing, that's 8370 dates. Now let's say you need to
process these dates for each of the following sites. This technique by the way
of turning a plain text list into a python list as a wonderful convenience.

```python
sites = """
mikelev.in
levinux.com
pipulate.com
""".split("\n")[1:-1]
```

That's 8370 x 3, or 25110 rows to process. The "processing loop" for every site
for every date looks like this:

```
for asite in sites:
    for adate in dates:
        api_call = f"{asite} {adaate}"
```

Now if you actually used this loop for processing and something went wrong, how
would you ever know. If you were going to reprocess in order to fill-in the
missed API-calls are you going to rerun the entire loop. Is that going to
reprocess every line and burn through your API quota and waste a lot of time?
No! Of course not. Let's build record-keeping directly into this job.

Factory constructors are one of those annoying things from object oriented
design that we manage to avoid in most of our Python SEO work, but this is one
delightfully unobjectionable exception. Let's import the constructor:

```python
# Import factory template
from collections import namedtuple

# Create new factory constructor
Args = namedtuple("Args", "site, date")

# Use constructor to create instance
args = Args("foo.com", "2022-11-30")

print(args)
print(args.site)
print(args.date)
```

Produces this output. Look carefully. Notice how you can use dot-notation to
access values inside a namedtuple. This is easier than the square-bracket
dictionary API.

    Args(site='foo.com', date='2022-11-30')
    foo.com
    2022-11-30

Now we ***almost*** put it all together. This next step creates a list of
nametuples that are our API-calls. This is already a "flattened" list that can
be processed without the nested loops:

```python
from datetime import datetime
from collections import namedtuple
from dateutil.relativedelta import relativedelta as rd

Args = namedtuple("Args", "site, date")
sites = ['mikelev.in', 'levinux.com', 'pipulate.com']

x = 1
dates = []
while True:
    adate = datetime.now().date().replace(day=1) - rd(days=x)
    pattern = "%Y-%m-%d"
    if adate < datetime(2000, 1, 1).date():
        break
    adate = adate.strftime(pattern)
    dates.append(adate)
    x += 1

api_calls = []
for adate in dates:
    for asite in sites:
        api_call = Args(asite, adate)
        api_calls.append(api_call)
```

In Jupyter we can look at the first 10 sets of API arguments like so:

```python
api_calls[:10]
```

...which shows:

    [Args(site='mikelev.in', date='2022-11-30'),
     Args(site='levinux.com', date='2022-11-30'),
     Args(site='pipulate.com', date='2022-11-30'),
     Args(site='mikelev.in', date='2022-11-29'),
     Args(site='levinux.com', date='2022-11-29'),
     Args(site='pipulate.com', date='2022-11-29'),
     Args(site='mikelev.in', date='2022-11-28'),
     Args(site='levinux.com', date='2022-11-28'),
     Args(site='pipulate.com', date='2022-11-28'),
     Args(site='mikelev.in', date='2022-11-27')]

#### Product of a Cartesian Join

...and gives you a pretty good idea of what we're doing (I hope). It is every
combination of property and date. This is the product of a cross-join, a.k.a.
Cartesian Join, that was accomplished with the nested loop iterating through
all sites and dates.

But there is one final step to do to make this list of namedtuple args into a
practical list for housekeeping what's been processed and what hasn't. Because
APIs out there in the wild are often so flaky (timeouts, unavailability, etc.)
what we're going here is a sort of tree-shaking reprocessing ability. So how do
you do that? My favorite trick! A cheap dict database! We populate it these
namedtuples as keys and the values set to None. We then only process keys whose
values are none, and you can repeat that process until there are no more
None's, or for x-number of times or whatever.

```python
from datetime import datetime
from collections import namedtuple
from sqlitedict import SqliteDict as sqldict
from dateutil.relativedelta import relativedelta as rd

Args = namedtuple("Args", "site, date")

# List all sites to process
sites = ['mikelev.in', 'levinux.com', 'pipulate.com']

# Lits all days to process (this Millennium)
x = 1
dates = []
while True:
    adate = datetime.now().date().replace(day=1) - rd(days=x)
    pattern = "%Y-%m-%d"
    if adate < datetime(2000, 1, 1).date():
        break
    adate = adate.strftime(pattern)
    dates.append(adate)
    x += 1

# Build API-arguments for each date for each site
api_calls = []
for adate in dates:
    for asite in sites:
        api_call = Args(asite, adate)
        api_calls.append(api_call)

# Populate database with API-args as keys but value None
with sqldict("api_calls.db") as db:
    for acall in api_calls:
        db[str(acall)] = None
    db.commit()
print('Done')
```

Now we can break out the actual pulling of the data separate, getting rid of
all that arg-building date nonsense (they're already built) and just shake the
trees. 

#### Shaking the API Trees

```python
from sqlitedict import SqliteDict as sqldict
from collections import namedtuple

Args = namedtuple("Args", "site, date")

# Simulate an API-call
def get_data(**kwargs):
    # Splatting named arguments into dict (great trick!)
    rv = None
    # All paramters present? (another great trick!)
    if all(item in kwargs for item in ['site', 'date']):
        site = kwargs["site"]
        date = kwargs["date"]
        rv = f"I made a call for site {site} on date {date}."
    return rv

# Shake the trees 5 times!
for i in range(5):
    print(f"Loop {i + 1}")
    with sqldict("api_calls.db") as db:
        for api_call in db:
            data = db[api_call]
            if data == None:
                args = eval(api_call)
                data = get_data(site=args.site, date=args.date)
                db[api_call] = data
                db.commit()
print('Done')
```

And you can step through the database and look at the data. Any unsuccessful
data-fetches will still read "None".

#### Spinning Through Results

```python
with sqldict("api_calls.db") as db:
    for i, api_call in enumerate(db):
        data = db[api_call]
        print(data)
        if i > 10:
            break
```

...which shows:

    I made a call for site mikelev.in on date 2022-11-30.
    I made a call for site levinux.com on date 2022-11-30.
    I made a call for site pipulate.com on date 2022-11-30.
    I made a call for site mikelev.in on date 2022-11-29.
    I made a call for site levinux.com on date 2022-11-29.
    I made a call for site pipulate.com on date 2022-11-29.
    I made a call for site mikelev.in on date 2022-11-28.
    I made a call for site levinux.com on date 2022-11-28.
    I made a call for site pipulate.com on date 2022-11-28.
    I made a call for site mikelev.in on date 2022-11-27.
    I made a call for site levinux.com on date 2022-11-27.
    I made a call for site pipulate.com on date 2022-11-27.

Did I mention million-dollar ideas? This is one.

#### Python Dict Keys Like Database Primary Keys Ensure Uniqueness

But what about duplicates? Never fear, sets are here! Python dict keys are
actually sets, thus ensuring uniqueness due to the nature of sets.

There's a number of surprisingly good things about using named tuples as
database keys. In our case the nametuples are converted to strings because of
how the SqliteDict package was written, but the same benefits apply. I do a
simple conversion of nametuples to strings (for readability) but the same
uniqueness benefits apply. I could have also pickled the keys, but it would
have been more code and they'd be less readable. Eval is not evil. Just ask
Raymond Hettinger, the core Python developer who wrote namedtuples.

#### Use Named Tuples as Composite Primary Keys

If you want the big picture, research multi-column (a.k.a. composite) primary
keys and ponder their relationship to tuples being used as Python dict keys. It
will blow your mind. It's amazing how many benefits we can get of fancy,
higher-end systems just through the intelligent and creative use of the common
datatypes built into Python.

### Connecting to Google Analytics

Things are changing on the Google Analytics front. GA4mageddon is coming soon
and all the old ways of querying Google Analytics through the API will go away
because they're going to be <a
href="https://support.google.com/analytics/answer/10089681?hl=en">deleting all
that data</a> on July 1, 2023. Customers of the paid-for Google Analytics
product 360 will have until July 1, 2024. Still, it is not a lot of time for
changes this big on the Web and I'm torn whether I should even show you the
"old way". But chances are many things you do the old way will still apply
&#151; especially for Account IDs which aren't changing and which is our first
example:

#### List All Google Analytics Accounts You Can Access

Unfortunately, you have to switch between v3 and v4 of the GA API to get
everything you need. When enumerating accounts, you need to use GA v3.

```python
import ohawf
import pandas as pd
from apiclient.discovery import build

creds = ohawf.get()
service = build("analytics", "v3", credentials=creds)
accounts = service.management().accounts().list().execute()

table = []
for account in accounts["items"]:
    name, aid = account["name"], account["id"]
    table.append((aid, name))
df = pd.DataFrame(table, columns=["Account ID", "Account Name"])
df.to_csv("ga_accounts.csv", index=False)
print(df)
```

This is the shortest of the 3 lists we're generating. There are less Accounts
than Web Properties and Views. So instead of creating one great big object with
the whole 3-level hierarchy (possible, but messy), we're going to create 3
DataFrames and save them out as CSVs. Then we're going to join the CSVs as the
last step.

#### List All Web Properties for a Account

Given a single Account ID from the above query, you can get a list of all its
Web Properties. The concept of Web Properties is going away in Google Analytics
3, but leading up to that plenty of people are going to have to do an
accounting of everything under Universal Analytics, so it's still important.

So there's a lot of ways to go about this. There's the nested approach starting
with above Account ID query, then the Web Properties queries indented a little,
then a 3rd level of indent for Profile (a.k.a. View) IDs. But I've looked at
ugly nested loops enough. We can extract all the Account IDs from the above
DataFrame with the following. Take note that a ga_accounts.csv file must exist
from running the above query.

```python
account_ids = list(df["Account ID"])
```

We still will have a loop, but this simple list of Account IDs is what we will
iterate through. Instead of relying on these Account IDs still being in memory,
we load them back from the CSV on the drive.

```python
import ohawf
import pandas as pd
from apiclient.discovery import build

creds = ohawf.get()
service = build("analytics", "v3", credentials=creds)
df = pd.read_csv("ga_accounts.csv")  # Generated from prior example
account_ids = list(df["Account ID"])

table = []
for aid in account_ids:
    web_properties = service.management().webproperties().list(accountId=aid).execute()
    for web_property in web_properties["items"]:
        name, wid = web_property["name"], web_property["id"]
        table.append((aid, name, wid))
df = pd.DataFrame(table, columns=["Account ID", "Web Property Name", "WebPropertyID"])
df.to_csv("ga_webproperties.csv", index=False)
print(df)
```

And now we do the 3rd query, this time for the 3rd level-down in the old Google
Analytics hierarchy of Accounts / Web Properties / Views (a.k.a. Profiles). As
with the prior example, take note that a ga_webproperties.csv file must exist
from executing the prior query. I'm going to grab both the Account IDs and
WebProperty IDs because the next query requires both.

Also, because there are more views than anything else be aware of your API rate
limit. You may exceed it and have to wait a day. The limit is 10,000 requests
per user per day.

#### List All Views (Profiles) per Web Property

```python
import ohawf
import pandas as pd
from apiclient.discovery import build

creds = ohawf.get()
service = build("analytics", "v3", credentials=creds)
df = pd.read_csv("ga_webproperties.csv")  # Generated from prior example

ids = ["Account ID", "WebProperty ID"]
idtuples = list(map(tuple, df[ids].to_records(index=False)))

table = []
for atuple in idtuples:
    aid, wid = atuple
    views = service.management().profiles().list(accountId=aid, webPropertyId=wid).execute()
    for view in views['items']:
        name, vid = view["name"], view["id"]
        table.append((aid, wid, name, vid))

columns = ["Account ID", "WebPropertyID", "View Name", "View ID"]
df = pd.DataFrame(table, columns=columns)
df.to_csv("ga_views.csv", index=False)
print(df)
```

### Joining Tables With Pandas

Okay, so now from the above Google Analytics queries, we have the following 3
files on the drive:

- ga_accounts.csv
- ga_webproperties.csv
- ga_views.csv

Tables join on columns that they have in common, and we've made sure that they
do. Accounts and WebProperties will join on the Account ID column, and the
resulting Accounts+WebProperties table will join to the Views table on both the
Account ID and WebProperty ID.

#### Better Than SQL Joins and Excel VLookups

This is similar to doing Joins in SQL or VLookups in Excel, but the much
simpler Pandas way. There's different join options here with Pandas. A "pure"
join can do it in one step and favors joining all tables on the same column,
that column generally being the Index. Because one of our joins is going to use
2 columns (Account ID and WebProperty ID), I'm going to use .merge() instead of
.join().

```python
# Load csv files into DataFrames
dfa = pd.read_csv("ga_accounts.csv")
dfw = pd.read_csv("ga_webproperties.csv")
dfv = pd.read_csv("ga_views.csv")

# Join the 1st & 2nd, then that with the 3rd
dfaw = dfa.merge(dfw, on="Account ID")
dfawv = dfaw.merge(dfv, on=["Account ID", "WebProperty ID"])
dfawv.to_csv("ga_network.csv", index=False)
print(dfawv)
```

And that's it. Load ga_networks.csv into Excel, format it a bit and send it
along to your boss in preparation for GA4mageddon.

#### Pulling Metrics Data from Universal Analytics

All the GA examples so far have been getting your IDs. The View IDs (a.k.a.
Profile IDs) are the ones we actually use in metrics-pulling queries. One of
the most important things to know here is Google's <a
href="https://ga-dev-tools.web.app/query-explorer/">Query Explorer</a> tool.
They also have it for <a
href="https://ga-dev-tools.web.app/ga4/query-explorer/">GA4</a>. This is where
you experiment, which is important because the requests are somewhat hard to
construct. You can check out their notoriously obfuscated <a
href="https://developers.google.com/analytics/devguides/reporting/core/v4/quickstart/service-py">example</a>
which in my opinion prevents people from doing this sort of work than helps.
Here's how simple it should be. Why nobody shows barebones examples like this
except for me, I'll never know. I have a hypothesis that it's because the easy
examples don't work well with Microsoft Intellisense on which most developers
are now dependent. 

```python
import ohawf
from apiclient.discovery import build

creds = ohawf.get()
service = build("analyticsreporting", "v4", credentials=creds)

# Create the Google Analytics query
query = {
    "reportRequests": {
        "dateRanges": [{"endDate": "2022-12-31", "startDate": "2022-01-01"}],
        "metrics": [
            {"expression": "ga:users"},
            {"expression": "ga:newusers"},
            {"expression": "ga:sessions"},
            {"expression": "ga:bouncerate"},
            {"expression": "ga:pageviewsPerSession"},
            {"expression": "ga:avgSessionDuration"},
        ],
        "pageSize": "1",
        "samplingLevel": "SMALL",
        "viewId": [Your GA View ID Here],
    }
}

# Execute query and print response
response = service.reports().batchGet(body=query).execute()
print(response)
```

Bonus: if you're a paid GA 360 customer and have a higher resolution sampling
rate available to you, you can get it by adding this to the query, which puts
another key/value pair in the query dict object at the same level as
reportRequests:

```python
query["useResourceQuotas"] = True
```

Wait, what? Hitting the Google Analytics API has been that simple all these
years? Yup. Then why don't more people do it? Because simple examples are hard
to find. Want to know what's even harder to find than a simple GA API V4
example? A simple GA4 example. No, they're not the same thing!

#### Analytics Reporting API v4 != Google Analytics 4 (GA4)

The language and terminology surrounding this stuff is infuriating. The above
example uses the Google Analytics Reporting API v4, which is part of the Core
Reporting API, which is not the same thing as Google Analytics 4 (GA4), which
is part of the Google Analytics Data API. Roughly speaking, the Core Reporting
API is the "old way" which is still used for most things except GA4 as far as I
can tell. The older Core Reporting API can be recognized through its use of
apiclient.discovery.build with lines like:

```python
service = build("analyticsreporting", "v4", credentials=creds)
```

The new GA4 way can be recognized as of the time of this writing by:

```python
client = BetaAnalyticsDataClient(credentials=creds)
```

### Working With the GA4 Analytics API

And that's our cue to move onto the future of Google Analytics. Bare bones
example? Congratulations! You found ***the one*** that exists on the Internet.
And wow do the patterns change. In the place of build (technically,
apiclient.discovery.build) is BetaAnalyticsDataClient (technically,
google.analytics.data_v1beta.BetaAnalyticsDataClient). These names will change
as the Python GA4 client libraries stabilize.

#### Pulling Data from GA4

```python
import ohawf
from google.analytics.data_v1beta import BetaAnalyticsDataClient

# We use this new pattern for sub-imports
from google.analytics.data_v1beta.types import (
    RunReportRequest,
    DateRange,
    Metric
)

creds = ohawf.get()
client = BetaAnalyticsDataClient(credentials=creds)

request = RunReportRequest(
    property=f"properties/[Your GA4 Property ID Here]",
    metrics=[Metric(name="sessions")],
    date_ranges=[DateRange(start_date="2022-01-01", end_date="2022-12-31")],

i
)

response = client.run_report(request)
print(response)
```

And yes, that works. Something to notice here which I'm keeping a close eye on
is the use of custom data objects to build arguments, such as DateRage and
Metric. I'm only just getting an handle on these using the <a
href="https://developers.google.com/analytics/devguides/reporting/data/v1/api-schema">documentation
here</a>. There's a lot to learn! You can always look at the source code with:

```python
from inspect import getsource
print(getsource(Metric))
```

#### Listing Sites on GA4

When I showed this for Non-GA4, I felt compelled to save out 3 CSVs because of
the 3 levels of hierarchy. But with GA4, it's just a bunch of Property IDs
under each Account ID. That's only 2-levels of hierarchy, and so I'll mix the 2
different API-styles and do it with a nested loop and one table and save it out
as ga4_properties.csv.

```python
import ohawf
import pandas as pd
from apiclient.discovery import build
from google.analytics.admin import AnalyticsAdminServiceClient
from google.analytics.admin_v1alpha.types import ListPropertiesRequest

creds = ohawf.get()
service = build("analytics", "v3", credentials=creds)
accounts = service.management().accounts().list().execute()

table = []
for account in accounts["items"]:
    name, aid = account["name"], account["id"]
    client = AnalyticsAdminServiceClient(credentials=creds)
    results = client.list_properties(
        ListPropertiesRequest(filter=f"parent:accounts/{aid}", show_deleted=True)
    )
    for item in results:
        pid = item.name.split("/")[1]
        prop = item.display_name
        table.append((name, aid, prop, pid))

df = pd.DataFrame(table, columns=["Account", "Account ID", "Property", "Property ID"])
df.to_csv("ga4_properties.csv", index=False)
print("Done")
```

And if you think moving from GA v4 to GA4 is confusing, there's still a GA v3
you sometimes have to use. You see that in the above example that enumerates
Accounts, Web Properties and Profiles where service.management() is invoked. GA
v4 doesn't have .management() but v3 does. Ugh! So can you also pull data with
GA v3? Yes, and you sometimes have to in order to prevent broken out
"dimension rows" from collapsing down into summary counts. Here's a GA v3 query
that returns all the broken-out URLs with a query whose equivalent would only
return aggregate summary values in GA v4:

```python
import ohawf
from time import sleep
from collections import namedtuple
from apiclient.discovery import build
from sqlitedict import SqliteDict as sqldict

creds = ohawf.get()
service = build("analytics", "v3", credentials=creds)

with open("profiles.txt") as fh:
    profiles = [x.strip() for x in fh.readlines()]

start_date = "2022-01-01"
end_date = "2023-01-09"

Args = namedtuple("Args", "profile, npt")

# Create the keys for uncollected data
with sqldict("ga.db") as db:
    for profile in profiles:
        profile = int(profile)
        for npt in range(1, 50001, 10000):
            arg = Args(profile, npt)
            if str(arg) not in db:
                print(arg)
                db[str(arg)] = None
        db.commit()

# Function to get GA data with v3 API
# Breaks out URL rows with filter or segment applied (unlike v4)
def ga(profile, npt):
    return (
        service.data()
        .ga()
        .get(
            ids=f"ga:{profile}",
            start_date=start_date,
            end_date=end_date,
            dimensions="ga:landingPagePath",
            segment="gaid::-5",
            metrics="ga:users,ga:newusers,ga:sessions,ga:bouncerate,ga:pageviewsPerSession,ga:avgSessionDuration",
            sort="-ga:sessions",
            # filters="ga:medium==organic",
            start_index=f"{npt}",
            max_results="10000",
        )
        .execute()
    )

with sqldict("ga.db") as db:
    for key in db:
        tkey = eval(key)
        profile, npt = tkey
        data = db[key]
        if data == None:
            print(f"Hitting API for profile: {profile} npt: {npt}")
            response = ga(profile, npt)
            db[key] = response
            db.commit()
            sleep(10)
```

This program can be restated with Google Analytics v4, but it won't break out
the URL rows:

```python
import ohawf
from time import sleep
from collections import namedtuple
from apiclient.discovery import build
from sqlitedict import SqliteDict as sqldict

creds = ohawf.get()
service = build("analyticsreporting", "v4", credentials=creds)

start_date = "2022-01-01"
end_date = "2023-01-09"

# Create the Google Analytics query
def query(profile, npt):
    qry = {
        "reportRequests": {
            "dateRanges": [{"startDate": start_date, "endDate": end_date}],
            "metrics": [
                {"expression": "ga:users"},
                {"expression": "ga:newusers"},
                {"expression": "ga:sessions"},
                {"expression": "ga:bouncerate"},
                {"expression": "ga:pageviewsPerSession"},
                {"expression": "ga:avgSessionDuration"},
            ],
            # "segments": [{"segmentId": "gaid::-5"}],
            # "dimensions": [{"name": "ga:segment", "name": "ga:landingPagePath"}],
            "dimensions": [{"name": "ga:landingPagePath"}],
            "orderBys": [
                {"fieldName": "ga:sessions", "sortOrder": "DESCENDING"},
            ],
            "samplingLevel": "SMALL",
            "pageSize": "10000",
            "pageToken": f"{npt}",
            "viewId": f"{profile}",
        }
    }
    return qry

ga = lambda x: service.reports().batchGet(body=x).execute()

with open("profiles.txt") as fh:
    profiles = [x.strip() for x in fh.readlines()]

Args = namedtuple("Args", "profile, npt")


# Create the keys for uncollected data
with sqldict("ga.db") as db:
    for profile in profiles:
        profile = int(profile)
        for npt in range(0, 50000, 10000):
            arg = Args(profile, npt)
            if str(arg) not in db:
                print(arg)
                db[str(arg)] = None
        db.commit()

# Perform queries and collect data
with sqldict("ga.db") as db:
    for key in db:
        tkey = eval(key)
        profile, npt = tkey
        data = db[key]
        if data == None:
            print(f"Hitting API for profile: {profile} npt: {npt}")
            response = ga(query(profile, npt))
            db[key] = response
            db.commit()
            sleep(10)
```

So much about managing large API data-pulls is expressed in the above two
examples. Always create your database keys that represent API-calls ahead of
time, even though you don't have data yet. Treat your set of keys as beforehand
data so you know exactly how many locks you need to turn before you have all
the data you want. If jobs fail in the middle, you just check which doors are
still locked and do 2nd passes to fill in the gaps. It's good housekeeping and
acknowledges the reality that APIs (data sources) on the Internet are often
flaky. 

### Keyword Analysis With Linear Regression

It's going to take a few steps to get to the linear regression, which is just a
fancy word for line-fitting. In other words, we will plot the positions
keywords held in search for your site and draw a line to see if it's sloping up
or down. Those that slope up are opportunity or winners. Those that slope down
are in danger or losers. It's simple machine learning and good solid SEO.

#### Managing the Data Pull with Named Tuples

Our first step is pulling the GSC data that we'll be plotting in a time-series.
We're going to use "weekly" date-ranges to keep the overall amount of data
small enough to easily manage. And so we're going to make the namedtuples that
define the API calls and fill them in as keys in a database for record keeping.
This step doesn't display anything. It just populates a database with keys we
use in the steps that follow.

```python
from datetime import datetime
from collections import namedtuple
from sqlitedict import SqliteDict as sqldict
from dateutil.relativedelta import relativedelta as rd

Range = namedtuple("Range", "start_date, end_date")

x = 1
dates = []
end_date = datetime.now().date() - rd(days=4)
with sqldict("gsc_weekly.db") as db:
    while True:
        start_date = end_date - rd(weeks=1)
        if end_date < datetime(2000, 1, 1).date():
            break
        pattern = "%Y-%m-%d"
        api_start_date = start_date.strftime(pattern)
        api_end_date = end_date.strftime(pattern)
        arange = (Range(api_start_date, api_end_date))
        end_date = end_date - rd(weeks=x)
        db[str(arange)] = None
        x+= 1
    db.commit()
print("Done")
```

Now we've got gsc_weekly.db containing a bunch of keys that will control the
API-calls in the next step.

#### Populating the GSC Weekly Raw Data

This is about staying organized. Whereas we put all the date-logic in the above
code and won't have to look at it again. we'll put the raw data-pull logic in
this step. We won't be doing any transforms or display. We do this to separate
complexity and to shove it around where it belongs. It is for example safe to
re-run because it won't collect data for the same time-period twice.

```python
import ohawf
from collections import namedtuple
from apiclient.discovery import build
from sqlitedict import SqliteDict as sqldict

creds = ohawf.get()
service = build("searchconsole", "v1", credentials=creds)
site = "sc-domain:mikelev.in"

with sqldict("gsc_weekly.db") as db:
    for str_range in db:
        data = db[str_range]
        if not data:
            arange = eval(str_range)

            query = {
                "dimensions": ["QUERY", "PAGE"],
                "startDate": arange.start_date,
                "endDate": arange.end_date,
            }

            results = (
                service.searchanalytics().query(siteUrl=site, body=query).execute()
            )
            db[str_range] = results
            db.commit()
print("Done")
```

#### Transforming GSC Raw Data to Tables

The above step was a "raw data pull", meaning we now have to "flatten" the data
and turn it into something more like rows & columns which are easier to work
with in the following steps. It's also easy to save it out as a CSV file and
then we can just load the CSV file in the steps that follow.

```python
import pandas as pd
from collections import namedtuple
from sqlitedict import SqliteDict as sqldict

Range = namedtuple("Range", "start_date, end_date")

columns = [
    "start_date",
    "end_date",
    "keyword",
    "url",
    "clicks",
    "impressions",
    "ctr",
    "position",
]

table = []
with sqldict("gsc_weekly.db") as db:
    for str_range in db:
        arange = eval(str_range)
        data = db[str_range]
        if "rows" in data:
            week_table = [
                (
                    arange.start_date,
                    arange.end_date,
                    x["keys"][0],
                    x["keys"][1],
                    x["clicks"],
                    x["impressions"],
                    x["ctr"],
                    x["position"],
                )
                for x in data['rows']
            ]
            df = pd.DataFrame(week_table)
            table.append(df)
df = pd.concat(table)
df.columns = columns
df.to_csv("gsc_weekly.csv", index=False)
```

Okay, gsc_weekly.csv is now on the drive and we can do rapid investigations
without worrying about all the complexity of gathering or transforming the
data. It's time to get to graphing.

#### Simple Graphing of Time Series

Now we've got our weekly per-keyword/per-url GSC metrics on our drive we can
easily load and do different investigations without hitting the GSC API over
and over. The advantages are both speed and having the power of Pandas and
other Python packages to do your analysis. We'll do the linear regression in
the example ***after*** this one because we have to learn the basics of
matplotlib first. 

The example that follows draws a line-graph of search positions for keywords
that we choose with summed metrics such as clicks, sorted by descending. So you
will see important keywords from this example, but not actual ***winners and
losers***. I give 2 very similar examples below because plotting clicks and
impressions is different from plotting positions. There's subtle differences
like flipping the Y-axis. First, the "sum-able" metrics:

#### Plotting Clicks or Impressions

```python
import pandas as pd
import matplotlib.pyplot as plt

number_of_keywords = 3
metrics = ["clicks", "impressions"]
metric = metrics[0]

df_weekly = pd.read_csv("gsc_weekly.csv")
df_winners = df_weekly.groupby("keyword")[metric].sum().sort_values(ascending=False)
df_winners = df_winners.iloc[0:number_of_keywords]
winners = list(df_winners.index)

for win in winners:
    print(win)
    df = df_weekly[df_weekly["keyword"] == win][["end_date", "position"]]
    df["end_date"] = pd.to_datetime(df["end_date"])
    df = df.set_index("end_date")
    fig, ax = plt.subplots()
    plt.xticks(rotation=90)
    ax.plot(df)
    plt.show()
```

#### Graphing Search Positions is Different

Okay, and now for the metric that can't be summed. The story for plotting
***search positions*** is different. You can't sum a number of position #1's
and have it meaningful. It's got to be an average. We want 1 at the top of the
graph and 100 at the bottom, which is flipping the Y-axis. And because it's a
known range of 1 to 100, we can fix that range.

```python
import pandas as pd
import matplotlib.pyplot as plt

number_of_keywords = 10

df_weekly = pd.read_csv("gsc_weekly.csv")
df_winners = df_weekly.groupby("keyword").agg({'position': ['count', 'mean']})
df_winners.columns = list(map('_'.join, df_winners.columns.values))
df_winners = df_winners.sort_values(['position_count', 'position_mean'], ascending=[False, True])
winners = list(df_winners.index[:number_of_keywords])

for win in winners:
    print(win)
    df = df_weekly[df_weekly["keyword"] == win][["end_date", "position"]]
    df["end_date"] = pd.to_datetime(df["end_date"])
    df = df.set_index("end_date")
    fig, ax = plt.subplots()
    ax.set_ylim(100, 1)
    ax.plot(df)
    plt.xticks(rotation=90)
    plt.show()
```

#### Jupyter Headline Functions

We're about to display a whole lot of stuff and could really benefit by being
able to use h1 and h2 tags in Jupyter similar to HTML. So here's a function to
spin out h1 through h6.

```python
from IPython.display import display, Markdown

# Let's make some headlines!
for i in range(1, 7):
    func_name = f"h{i}"
    num_hashes = '#' * i
    command = fr"{func_name} = lambda x: display(Markdown('{num_hashes} %s' % x))"
    exec(command)
```

#### Understand Winners & Losers with Linear Regression

And now for some awesome SEO. It's similar to above, but we calculate the slope
of the trendline for for every keyword and use that to choose which to show as
the winners and losers, landing pages and such. This report can be used to know
where to defend, where to attack and where to pay the most attention during
site cleanups and migrations.

```python
import warnings
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from IPython.display import display, Markdown

size_from_ends = 50  # The number of Winners & Losers you want to see
warnings.filterwarnings("ignore")

# Let's make some headlines!
for i in range(1, 7):
    func_name = f"h{i}"
    num_hashes = "#" * i
    command = rf"{func_name} = lambda x: display(Markdown('{num_hashes} %s' % x))"
    exec(command)

# Read the dump of GSC Weekly data
df_weekly = pd.read_csv("gsc_weekly.csv")

# Calculate the average search position and number of data points
df_winners = df_weekly.groupby("keyword").agg({"position": ["count", "mean"]})
df_winners.columns = list(map("_".join, df_winners.columns.values))
df_winners = df_winners.sort_values(
    ["position_count", "position_mean"], ascending=[False, True]
)

# Create a dict of landing pages per keyword (for later use)
dflp = df_weekly[["keyword", "url"]]
sot = set(map(tuple, dflp.to_records(index=False)))
lpdict = {}
for key, value in sot:
    if key in lpdict:
        lpdict[key].append(value)
    else:
        lpdict[key] = [value]

# Grab number of rows so we don't mis-chop larger DataFrame.
samples = len(df_weekly.end_date.unique())

# Calculate the slope of the fit linear regression line.
keywords = list(df_winners.index)
table = []
for keyword in keywords:
    df = df_weekly[df_weekly["keyword"] == keyword][["end_date", "position"]]
    df["end_date"] = pd.to_datetime(df["end_date"])
    lot = list(map(tuple, df.to_records(index=False)))
    x = [int(x[0]) for x in lot]
    y = [int(x[1]) for x in lot]
    coefficients = np.polyfit(x, y, 1)
    slope = f"{-1 * coefficients[0] * 100000000000000000:.2f}"
    row = (keyword, slope)
    table.append(row)

# Join keyword positions, sample frequenc & slope.
df = pd.DataFrame(table, columns=["keyword", "slope"])
df["slope"] = df["slope"].astype(float)
df = df.set_index("keyword")
df = df_winners.join([df])
df = df[df["position_count"] > samples / 2]
df.sort_values(by=["slope"], ascending=[False], inplace=True)

# Ensure whole list of keywords not sorter than end ranges.
if df.shape[1] > (size_from_ends * 2):
    size_from_ends = df.shape[1] / 2

# Grab the 2 ends, representing fasters winners and losers.
df_best = df.iloc[:size_from_ends, :]
df_worst = df.iloc[-size_from_ends:, :]
df_ends = pd.concat([df_best, df_worst])
movers = list(df_ends.index)

# Show top winner and loser top reression lines.
for i, mover in enumerate(movers):
    if not i:
        h1("Gainers")
        i2 = i
    if i == size_from_ends:
        h1("Losers")
        i2 = 0
    df = df_weekly[df_weekly["keyword"] == mover][["end_date", "position"]]
    df["end_date"] = pd.to_datetime(df["end_date"])
    lot = list(map(tuple, df.to_records(index=False)))
    x = [x[0] for x in lot]
    x2 = [int(x[0]) for x in lot]
    y = [int(x[1]) for x in lot]
    plt.xticks(rotation=90)
    plt.scatter(x, y)
    coefficients = np.polyfit(x2, y, 1)
    slope = f"{-1 * coefficients[0] * 100000000000000000:.2f}"
    h2(f"{i2 + 1}: {mover}")
    i2 += 1
    h3(f"slope: {slope}")
    for apage in lpdict[mover]:
        print(apage)
    regression_line = np.poly1d(coefficients)
    plt.plot(x, regression_line(x2), "r--")
    plt.gca().set_ylim(1, 100)
    plt.gca().invert_yaxis()
    plt.show()
    display(Markdown("---"))
```

Yeah, so maybe I'll paste some graphics in here to show you the output. Until I
do the nice little touches like that so that the casual user can "get it", this
will remain a hidden gem.

### Getting All URLs of Site

There are various approaches to getting all URLs for a site. You can get it
from Google Analytics. You can get it from Search Console. You can get it from
crawling the site directly. You can do it all 3 ways and join the results to
compare the effectiveness of the methods.

#### Getting All URLs with GSC

```python
import ohawf
from datetime import datetime
from apiclient.discovery import build
from sqlitedict import SqliteDict as sqldict
from dateutil.relativedelta import relativedelta as rd

creds = ohawf.get()

service = build("searchconsole", "v1", credentials=creds)
today = datetime.now()
last_year = today - rd(months=12)
today = f"{today}"[:10]
last_year = f"{last_year}"[:10]
site = "sc-domain:[your site here]"
start_row = 0

proceed = True
while proceed == True:
    with sqldict("gsc_urls.db") as db:
        print(f"start {start_row}")
        if start_row not in db:
            query = {
                "dimensions": ["PAGE"],
                "startDate": last_year,
                "endDate": today,
                "rowLimit": 1000,
                "startRow": start_row,
            }
            results = (
                service.searchanalytics().query(siteUrl=site, body=query).execute()
            )
            if "rows" not in results:
                proceed = False
            db[str(start_row)] = results
            db.commit()
            print("Commit")
        start_row += 1000
print("Done")
```

Okay, all the raw GSC URL data for a year is on the drive. Now we can spin
through the raw data and create a flattened CSV file:

```python
import pandas as pd
from sqlitedict import SqliteDict as sqldict

table = []
with sqldict("gsc_urls.db") as db:
    for start_row in db:
        results = db[start_row]
        if "rows" in results:
            rows = results["rows"]
            lot = [
                (x["keys"][0], x["clicks"], x["impressions"], x["ctr"], x["position"])
                for x in rows
            ]
            table.append(pd.DataFrame(lot))

columns = ["url", "clicks", "impressions", "ctr", "position"]
df = pd.concat(table)
df.columns = columns
df.to_csv("ga_urls.csv", index=False)
```

#### Getting All URLs with GA

With GA, it can get ridiculous if you have a big site because it has every
tracking parameter in there. So we take some precautions to filter it on the
data-pull. Otherwise you might get back more data than is reasonable. Here's
the first part that does the raw data pull and capture.

```python
increment = 50000
start_row = 1
proceed = True
while proceed == True:
    with sqldict("ga_urls.db", timeout=4000000) as db:
        print(f"start {start_row}")
        if start_row not in db:
            req = get(
                ids=f"ga:[your viewid here]",
                start_date=last_year,
                end_date=today,
                metrics="ga:entrances",
                sort="-ga:entrances",
                dimensions="ga:landingPagePath",
                samplingLevel="HIGHER_PRECISION",
                max_results=f"{increment}",
                start_index=f"{start_row}",
                filters = "ga:landingPagePath!~'?'"
            )
            results = req.execute()
            sleep(5)
            if "rows" not in results:
                proceed = False
            db[str(start_row)] = results
            db.commit()
            print("Commit")
        start_row += increment
print("Done")
```

This can take awhile. And I had to keep upping the timeout on the Sqlite Dict.
But once the raw data was on the drive, we can flatten it quick and easy:

```python
import pandas as pd
from sqlitedict import SqliteDict as sqldict

root = "https://[yoursite]"
table = []
with sqldict("ga_urls.db") as db:
    for start_row in db:
        results = db[start_row]
        if "rows" in results:
            lot = [(f"{root}{x[0]}", x[1]) for x in results['rows'] if x[0] != '(other)']
            df = pd.DataFrame(lot)
            table.append(df)
            print(start_row)

df = pd.concat(table)
df.columns = ["url", "entrances"]
df.drop_duplicates(subset=['url'], inplace=True)
print(df.shape)
df.to_csv("ga_urls.csv", index=False)
```

### N-Click-Depth Crawl

Crawlers run out of control too easily and takes up too much storage on your
drive too readily. So to make a this a successful crawl you can control, it
neither coedge_xllects on-page data beyond links, nor will it crawl more than a 500
pages per run. You can easily modify the code to change that, but the point of
this is to get some quick data in for visualizing site hierarchies through
network node graph visualizers.


```python
import httpx
import pandas as pd
from time import time
from asyncio import gather
from collections import Counter
from bs4 import BeautifulSoup as bsoup
from urllib.parse import urlparse, urljoin
from sqlitedict import SqliteDict as sqldict
from IPython.display import display, Markdown

# Note: This crawler will not run out of control because it locks stubbornly onto
# completing each click-depth and is only recording the link graph and no on-page
# content. This is useful for getting the URLs and visualizing the link graph.

# Configuration
max_crawl_per_run = 500
homepage = "https://mikelev.in/"
user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}
dbname = "ncrawl.db"
start = time()


# Function to get absolute links from a URL
def onsite_links(href):
    response = httpx.get(href, headers=headers)
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
            if href[: len(homepage)] == homepage:
                seen.add(href)
    return seen


def feedback(i, t=False):
    if not i % 1000:
        if t:
            print(f"\nProcessed: {i} of {t}")
        else:
            print(f"\nProcessed: {i}")
    elif not i % 10:
        print(".", end="")


# Let's make some headlines!
for i in range(1, 7):
    func_name = f"h{i}"
    num_hashes = "#" * i
    command = rf"{func_name} = lambda x: display(Markdown('{num_hashes} %s' % x))"
    exec(command)

# Seed Crawl with click-depth 1 & 2
h1(f"Crawling {homepage}")
links = onsite_links(homepage)
table = []
with sqldict("ncrawl.db") as db:
    db[homepage] = links
    for link in links:
        if link not in db:
            db[link] = None
            table.append(link)
    db.commit()

# Record the click-depth 1 & 2 pages
with sqldict("ndepth.db") as db:
    db[homepage] = 1
    for link in table:
        db[link] = 2
    db.commit()

h2("Counting discovered but unvisited links.")
h3("This can take awhile past click-depth of 2.")
table = []
with sqldict("ncrawl.db") as db:
    for i, url in enumerate(db):
        feedback(i, len(db))
        row = (url, db[url])
        table.append(row)
    print()
df = pd.DataFrame(table)
df.columns = ["url", "links"]
df.set_index("url", inplace=True)

h2("Figuring out deepest click-depths.")
h3("This can take awhile past click-depth of 2.")
table = []
with sqldict("ndepth.db") as db:
    for i, link in enumerate(db):
        feedback(i, len(db))
        row = (link, db[link])
        table.append(row)
    print()
df_depth = pd.DataFrame(table)
df_depth.columns = ["url", "depth"]
df_depth.set_index("url", inplace=True)
df = df.join([df_depth])
max_depth = df["depth"].max()

to_crawl = df[(df["depth"] == max_depth) & (df["links"].isnull())]
to_crawl = list(to_crawl.index)
len_to_crawl = len(to_crawl)
len_to_crawl

if len_to_crawl:
    if len_to_crawl < max_crawl_per_run:
        max_crawl_per_run = len_to_crawl
    h2(
        f"Crawling {max_crawl_per_run} of {len_to_crawl} pages at click-depth {max_depth}:"
    )
    h3(f"This is discovering links for a click depth {max_depth + 1} crawl.")
    with sqldict("ncrawl.db") as db:
        for i, url in enumerate(to_crawl):
            db[url] = onsite_links(url)
            db.commit()
            print(f"{max_crawl_per_run - i} ", end="")
            if i >= max_crawl_per_run:
                h4(
                    f"Another {max_crawl_per_run} urls will be visited each time you run."
                )
                break
else:
    next_depth = max_depth + 1
    h2(f"Done click-depth {max_depth}. Setting up tables for click-depth {next_depth}.")
    table = []
    with sqldict("ncrawl.db") as db:
        table = []
        for url in db:
            links = db[url]
            if links:
                for link in links:
                    table.append(link)
    with sqldict("ncrawl.db") as db:
        for url in table:
            db[url] = None
        db.commit()
    with sqldict("ndepth.db") as db:
        for url in table:
            if url not in db:
                db[url] = next_depth
        db.commit()
    h3(f"On the next run click-dept {next_depth} will be crawled.")
h3("Done")
```

So what can you even do with a crawl like this that doesn't collect any on-page
data but for the "a href" links? Well, you can visualize the link graph, of
course! 2 splendid tools to the rescue: NetworkX and Plotly!

### 3D Interactive Website Crawl Visualization

I still have some work to do on this code and will be replacing it with a
version that has labeled nodes, but for now it's pretty amazing we can do this.
It will take the crawl data saved out from the above crawl and make it a 3D
interactive link graph revealing the hierarchy of the site. I recommend
limiting yourself to plotting 2 or 3 click-depth data. It gets crazy at 4.

```python
# Import the required packages
import pandas as pd
import networkx as nx
import plotly.graph_objects as go
from sqlitedict import SqliteDict as sqldict

table = []
with sqldict("ncrawl.db") as db:
    for i, url in enumerate(db):
        links = db[url]
        if links:
            for link in links:
                table.append((url, link))
df = pd.DataFrame(table).iloc[:, :]

dedupe_me = list(df[0].unique()) + list(df[1].unique())

seen = set()
new_list = []
for url in dedupe_me:
    if url not in seen:
        new_list.append(url)
        seen.add(url)

url_dict = dict([(x[1], x[0]) for x in enumerate(new_list)])

G = nx.Graph()
for url in df[0].unique():
    G.add_node(url_dict[url])

edges = list(map(tuple, (df.to_records(index=False))))
for edge in edges:
    l, r = edge
    G.add_edge(url_dict[l], url_dict[r])

spring_3D = nx.spring_layout(G, dim=3, seed=18)
Num_nodes = len(spring_3D)
x_nodes = [spring_3D[i][0] for i in range(Num_nodes)]
y_nodes = [spring_3D[i][1] for i in range(Num_nodes)]
z_nodes = [spring_3D[i][2] for i in range(Num_nodes)]

edge_list = G.edges()
x_edges = []
y_edges = []
z_edges = []

for edge in edge_list:
    # format: [beginning,ending,None]
    x_coords = [spring_3D[edge[0]][0], spring_3D[edge[1]][0], None]
    x_edges += x_coords

    y_coords = [spring_3D[edge[0]][1], spring_3D[edge[1]][1], None]
    y_edges += y_coords

    z_coords = [spring_3D[edge[0]][2], spring_3D[edge[1]][2], None]
    z_edges += z_coords

trace_edges = go.Scatter3d(
    x=x_edges,
    y=y_edges,
    z=z_edges,
    mode="lines",
    line=dict(color="black", width=2),
    hoverinfo="none",
)

trace_nodes = go.Scatter3d(
    x=x_nodes,
    y=y_nodes,
    z=z_nodes,
    mode="markers",
    marker=dict(
        symbol="circle",
        size=10,
        colorscale=["lightgreen", "magenta"],  # either green or mageneta
        line=dict(color="black", width=0.5),
    ),
    hoverinfo="text",
)

axis = dict(
    showbackground=False,
    showline=False,
    zeroline=False,
    showgrid=False,
    showticklabels=False,
    title="",
)

layout = go.Layout(
    title="3D Graph of Website",
    width=1000,
    height=1000,
    showlegend=True,
    scene=dict(
        xaxis=dict(axis),
        yaxis=dict(axis),
        zaxis=dict(axis),
    ),
    margin=dict(t=100),
    hovermode="closest",
)

# Include the traces we want to plot and create a figure
data = [trace_edges, trace_nodes]
fig = go.Figure(data=data, layout=layout)

fig.show()
```

### Web Browser Automation

#### Chromium, Firefox & Chrome Automation

This is how you do browser automation under JupyterLab on a Windows PC running
the Linux version of JupyterLab under WSL. It feels just like running native
Jupyter, but it's back-ended by Linux with the server-friendly Microsoft
Playwright controlling the Linux versions of Chromium, Firefox or Chrome either
showing the browser as you go for development and debugging, or heedlessly for
running on a scheduled basis 24x7 (broken out of Jupyter).

##### Barebones Chromium without Session Memory

```python
import asyncio
from playwright.async_api import Playwright, async_playwright

delay = 5
slow_mo = 100
headless = False
site = "https://www.google.com/"

# Barebones Chromium without Session Memory
async with async_playwright() as playwright:
    browser = await playwright.chromium.launch(headless=headless, slow_mo=slow_mo)
    page = await browser.new_page()
    await page.goto(site)
    await asyncio.sleep(delay)
    await browser.close()
```

##### Chromium with Session Memory and User Agent Cloaking

```python
import asyncio
from playwright.async_api import Playwright, async_playwright

delay = 5
slow_mo = 100
headless = False
site = "https://www.google.com/"

# Chromium with Session Memory and User Agent Cloaking
session_folder = "session"
ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"

async with async_playwright() as playwright:
    browser = await playwright.chromium.launch_persistent_context(
        session_folder, headless=headless, slow_mo=slow_mo, user_agent=ua
    )
    page = await browser.new_page()
    await page.goto(site)
    await asyncio.sleep(delay)
    await browser.close()
```

##### Firefox without Session Memory

```python
import asyncio
from playwright.async_api import Playwright, async_playwright

delay = 5
slow_mo = 100
headless = False
site = "https://www.google.com/"

# Firefox without Session Memory
async with async_playwright() as playwright:
    browser = await playwright.firefox.launch(headless=headless, slow_mo=slow_mo)
    context = await browser.new_context()
    page = await context.new_page()
    await page.goto(site)
    await asyncio.sleep(delay)
    await browser.close()
```

##### Genuine Linux Chrome with Real User Data

```python
import asyncio
from playwright.async_api import Playwright, async_playwright

delay = 5
slow_mo = 100
headless = False
site = "https://www.google.com/"

# Genuine Linux Chrome with Real User Data
chrome_exe = "/usr/bin/google-chrome"
user_data = "/home/ubuntu/.config/google-chrome/"
downloads_path = "/home/ubuntu/Downloads"

async with async_playwright() as p:
    playwright = await async_playwright().start()
    browser = await playwright.chromium.launch_persistent_context(
        user_data_dir=user_data,
        headless=headless,
        accept_downloads=True,
        executable_path=chrome_exe,
        channel="chrome",
        no_viewport=True,
        slow_mo=slow_mo,
        downloads_path=downloads_path,
        # args=["--start-maximized"],
    )

    page = await browser.new_page()
    await page.goto(site)
    await asyncio.sleep(delay)
    await browser.close()

```

### Concurrent URL Crawl to Parquet

This builds on from above crawler code. You should have sqlite databases siting
on your drive which are the link and depth databases, respectively. We continue
on using the ***./crawl/depth.db*** data and launched a concurrent crawl at the
site using everything Python can muster. 

We use the PyPI httpx requests-like package for that, except it supports a
concurrent context manager to... well, look and see. Hard to express, but there
is some code brevity magic going on here to express concurrency so well. I
limit a concurrent URL content-grab to 1000. You have to re-run it to get
through the list if the crawl returned more than 1000 pages.

```python
import httpx
import pandas as pd
from pathlib import Path
from asyncio import gather
from collections import Counter
from bs4 import BeautifulSoup as bsoup
from sqlitedict import SqliteDict as sqldict

data = "crawl"
depthdb = f"{data}/depth.db"
responsedb = f"{data}/responses.db"

user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}

# Load URLs from link crawl
table = []
with sqldict(depthdb) as db:
    for url in db:
        table.append(url)
print(f"Total URLs: {len(table)}")

# Plan the crawl
if not Path(responsedb).exists():
    with sqldict(responsedb) as db:
        for url in table:
            db[url] = None
        db.commit()

# Find uncrawled URLs
urls = []
with sqldict(responsedb) as db:
    uncrawled = 0
    for url in table:
        resposne = db[url]
        if response == None and uncrawled <= 1000:
            uncrawled += 1
            urls.append(url)
print(f"Uncrawled URLs: {len(urls)}")

# Crawl uncrawled URLs
async with httpx.AsyncClient(headers=headers) as client:
    apromise = gather(*[client.get(url) for url in urls], return_exceptions=True)
    with sqldict(responsedb, timeout=5000) as db:
        for response in await apromise:
            try:
                db[str(response.url)] = response
                db.commit()
            except:
                ...
print("Done crawl")

c = Counter()
with sqldict(responsedb) as db:
    for url in db:
        response = db[url]
        if type(response) == httpx.Response:
            status_code = response.status_code
            c[status_code] += 1

for status_code in c:
    print(f"{status_code} pages: {c[status_code]}")

table = []
heading_tags = ["h1", "h2", "h3", "h4", "h5", "h6"]
with sqldict(responsedb) as db:
    for url in db:
        response = db[url]
        if type(response) == httpx.Response:
            status_code = response.status_code
            html = response.text
            soup = bsoup(response.text, "html.parser")

            try:
                title = soup.title.string.strip()
            except:
                title = None
            try:
                description = soup.find("meta", attrs={"name": "description"}).attrs[
                    "content"
                ]
            except:
                description = None
            try:
                headlines = "\n\n".join(
                    [
                        f"{x.text.strip()}"
                        for x in soup.find_all(heading_tags)
                        if x.text.strip()
                    ]
                )
            except:
                headlines = None
            stripped_strings = " ".join(soup.stripped_strings)
            body_copy = " ".join(
                [x for x in [title, description, stripped_strings] if x]
            )
            atuple = (
                str(response.url),
                response.status_code,
                title,
                description,
                headlines,
                body_copy,
                str(soup),
            )
            table.append(atuple)


cols = ["url", "status_code", "title", "description", "headlines", "body_copy", "html"]

df = pd.DataFrame(table, columns=cols)
df.to_parquet(f"{data}/extration.parquet")
print(f"{df.shape[0]} URLs")
print("Done")
```

<!--
#### Generating Keyword Histograms

#### Keyword Clustering (Hub & Spokes)

#### Taking Screenshot of Web Browser

#### Inspector Recordings to Jupyter

#### Dealing With Login Issues

#### Extracting Data The Easy Way

#### Extracting Data If It's JavaScript

#### Saving The Entire DOM

### Connecting to Google Trends

### Sending an Email With Python

#### Formatting an HTML Email with Python

#### Emailing an Attachment With Python

#### Zipping Files with Python

#### Scheduling an Email with Python

#### Emailing n Zip File with Python

### Finding Most Recent GSC Data
-->
