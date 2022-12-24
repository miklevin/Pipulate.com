---
title: Awesome FOSS SEO Examples
permalink: /software/
group: software
description: Pipulate FOSS SEO Software
---

# {{ page.description }}

### Ready to Automate Python SEO Examples

When you work something out using my sample-code in JupyterLab, the next step
really is to automate those things you like under systemd right on your Windows
laptop, or more reliably on a Raspberry Pi, home server or NAS, in the Cloud,
or wherever generic Linux is run.

* TOC
{:toc}

#### Enter Wonderful World of Linux

After the <a
href="https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat">Drink
Me</a> script is finished running, both Linux and Pipulate will be installed on
your Windows system and JupyterLab will soon be reachable in a Web browser at
<a href="http://localhost:8080">localhost:8080</a>. 

#### Microsoft Pauses systemd

You will however have to open a Linux Terminal to "wake up" Jupyter. This is
due to a limitation in WSL and I expect this requirement to change soon.  You
will want to use Windows Terminal which probably installed with Linux, but in
case it didn't, grab it from the Microsoft Store.

### Getting Started

Once you have JupyterLab displaying in your Web browser, you're in business.
Simply copy/paste any of the code in these examples into a new Notebook or go
into the repo named pipulate and run the code from the example files found
there. Those examples will match what you find here.

#### Rapid-Fire Million-Dollar Ideas

While not technically an ***Awesome List*** for Python SEO, Pipulate is a list
of awesome techniques and sample-code that brings you, I believe, a massive
step closer to your love-worthy work and six-figure job goals. I've been in
tech for over 30-years and SEO in particular as long as it's been a field. I've
acquired quite a few million-dollar ideas over the years, and they are best
expressed here in Python. Bringing you Pipulate is my Ikigai.

### Use Persistent Dicts as Ridiculously Easy Databases

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

You're welcome.

### Grabbing Data Quick & Easy

```python
import pandas as pd

url = 'https://www.worldometers.info/geography/alphabetical-list-of-countries/'
df = pd.read_html(url)[0]
df.to_csv("countries.csv", index=False)
```

The above example will drop a comma separated value file (CSV) on your drive in
the same location as where you created the Jupyter Notebook. The file will
contain a list of countries with populations, land area and density from the
table that was displaying on that URL. This is direct from webpage to Pandas
dataframe. Why wouldn't you?

This trick doesn't always work, but when it does, it's glorious. The process
can be reversed as follows, and is another way to get database-like
functionality without all the fuss.

```python
df = pd.read_csv("countries.csv")
```

You're welcome.

### Python Pandas and DataFrames

In case you didn't notice, we're already using Python Pandas from the above
example. But this is where you get to understand DataFrames which you'll most
often see around the Net as the variable ***df***. When you see df, think Excel
tab or SQL table. DataFrames are row-and-column data. You'll also hear the term
***matrices*** or simply ***tables***.

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

    df.to_csv("file.csv", index=False)
    df.to_excel("file.xlsx", index=False)

And from there you can save it out as a CSV file or use it in further
manipulations of row & column data such as joins, aggregations and unions. For
you Excel users, that's VLookups, Pivot Tables and combining tabs, but it's a
lot nicer in Python Pandas. Data Science, yay!

> Fill a table full of tuples and each record is a row.  
> Plug it into Pandas and your DataFrame will go  
> Into df's where you do stuff like in SQL or Excel  
> But w/APIs you'll prize for being timeless & done well.  

You're welcome.

### Logging Into Google Services

A lot more people would be doing advanced SEO work in Jupyter were it not so
difficult to log into Google services. OAuth2 login is the bane of many
aspiring SEO Pythonista's existence.

#### The Bane of Our Existence

Actually just logging into Google can be the hardest part of many projects,
especially those involving Analytics, Search Console or Sheets. Most other
sites at this point will be telling you to register as a Google Developer, make
a project at the Cloud Console, download a client.json file, yadda, yadda. It's
not terrible advice if you can manage it, and it gives you more options than
the way I provide here. The way I provide here has this one distinct advantage:
it's going to work for you here and now.

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

A nuance here is that I'm using something called the Python "context manager"
with SqliteDict. You can tell the content manager by the "with/as" keywords and
accompany indent. The "as" variable (really a file handle) goes away after the
outdent. That's the point. That's it's context. 

SqliteDict when used with the context manager (there are other ways) won't
commit changes to the persistent on-drive database file unless you do a
.commit(). Because commit hits actual hardware and could slow things down on a
big crawl, it's better to commit once per page (outer loop) rather than on the
inner loop per link. 

You're welcome. Now let's get the missing pages:

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

You're welcome.

#### What Do You Do With a Database of Pages?

What kind of investigations? Let's extract the title tags, create a Pandas
DataFrame, save the URLs plus title tags as an Excel document and push it to
Google Sheets.

We begin with just an Excel file. It's pretty much the exact same process as
saving a csv, but it gives you a tiny bit of default formatting, making the
presence of column labels very clear.

### Crawling a Website Directly Into Excel Document

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

### Fetching Web Pages Concurrently With Python

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

### Crawling Websites Into Google Sheets From Python

#### First a Few Words About APIs

Again I reiterate there are many pip installable packages you can use here to
alleviate this next step, namely GSpread and PyGSheets but neither is popular
enough to learn their API versus the only slightly harder direct-from-google
Python API for Google Sheets. Packages like GSpread and PyGSheets which while
undoubtedly offer convenience, are not so different from the main API
(especially in this case) that you're better off than getting first-hand API
experience.

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

### Listing Your Sites with Google Search Console (GSC)

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

### Generating Google-API-Friendly Dates

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

months_back = 16
for x in range(months_back):
    start_date = datetime.now().date().replace(day=1) - rd(months=x)
    end_date = start_date + rd(months=1) - rd(days=1)
    pattern = "%Y-%m-%d"
    start_date = start_date.strftime(pattern)
    end_date = end_date.strftime(pattern)
    print(start_date, end_date)
```

...which gives this:

    2022-12-01 2022-12-31
    2022-11-01 2022-11-30
    2022-10-01 2022-10-31
    2022-09-01 2022-09-30
    2022-08-01 2022-08-31
    2022-07-01 2022-07-31
    2022-06-01 2022-06-30
    2022-05-01 2022-05-31
    2022-04-01 2022-04-30
    2022-03-01 2022-03-31
    2022-02-01 2022-02-28
    2022-01-01 2022-01-31
    2021-12-01 2021-12-31
    2021-11-01 2021-11-30
    2021-10-01 2021-10-31
    2021-09-01 2021-09-30

### Pulling Data From GSC

Okay, so let's pull some data!

```python
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

### Combining Multiple CSV Files Into One (like a SQL UNION)

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

You're welcome.

### Record Keeping With Named Tuples

> There's a Raymond who's a rebel  
> And thinks eval is not evil  
> So he gave us the named tuple  
> Which is perfect for retrieval!  

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

from datetime import datetime
from dateutil.relativedelta import relativedelta as rd

```python
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

Did I mention million-dollar ideas? You're welcome.

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

### Listing Your Accounts, Web Properties & Views with Google Analytics (GA)

### Pulling Data From GA

### Pulling Data From Google Analytics G4 API

### Taking Screenshot of Web Browser

### Sending an Email With Python

#### Formatting an HTML Email with Python

#### Emailing an Attachment With Python

#### Zipping Files with Python

#### Scheduling an Email with Python

#### Emailing n Zip File with Python
