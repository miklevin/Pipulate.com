
---
title: SEO Crawler
description: SEO Crawler
permalink: /crawler/
layout: default
group: crawler
---

# Crawler

1. TOC
{:toc}

## File Organization With Pathlib

Paths (where stuff is) are always a tricky issue in tech. In Python as with
many programming languages, the default is for a program to look for its
resources in the very same location from which it was run. Consequently, there
is often a ***file clutter*** problem. Conversely, if you start organizing
things into an excessively deep subfolder structure, it becomes a pain to find
things. We will strike a compromise by using ***project names*** which we will
for now put directly in the `pipulate` repo folder. The ***repo*** terminology
refers to the fact that it is a git ***repository***.

```python
# filename: 10_Organization.ipynb
from pathlib import Path

project_name = "test"
project_path = Path(project_name)
project_path.mkdir(parents=True, exist_ok=True)
```

All the files that you see created here with pipulate will also be able to be
downloaded from [Pipulate on Github](https://github.com/miklevin/pipulate).

### Using Import for Configuration Values

We are going to want a very prescribed order with these Notebooks. Each step
may be very tiny such as this first one which is for file organization. This is
both a way to learn Python, particularly through Jupyter Notebook, and to
perform a full SEO Audit on a site. We can use the Python import system for
setting global configuration values across all the Notebooks. We simply have to
ensure each Notebook has `import config` near the top. Here's a sample config
file that contains only a project name and a site homepage URL. There are so
many other approaches to configuration files, but this is the easiest, leaning
into Python's default behavior and strengths.

```python
# file: config.py

name = "example"
site = "https://www.example.com/"
```

For the sake of education, I've made a new notebook `20_Configuration.ipynb`. I
won't create whole new notebooks for steps this small throughout the project,
but for beginners, making your own module and loading values from an external
file is a big enough step that I want to separate the files. The new Notebook
looks like this:

```python
# filename: 20_Configuration.ipynb
import config
from pathlib import Path

project_path = Path(config.name)
project_path.mkdir(parents=True, exist_ok=True)
```

## 1-Page Crawl (Save Homepage to Database)

I am going to keep the overall project as simple as possible. Website crawls
get out of hand fast. It can wind up in the attempt to download hundreds of
thousands of pages with days-long waits, producing network traffic that will
get your IP banned. We are taking a very conservative and cautious approach
here. The example below will simply save the homepage of the `site` in your
`config.py` file to the storage drive. You can think of it as a 1-page crawl if
you like. This is the same as saving the ***view-source*** HTML-code you can
see in the browser for any webpage. It's actually better because the entire
***response object*** from the `requests` call is saved, so you have the
success status code, the response headers and a bunch of other geeky stuff that
could come in common later.

```python
# filename: 30_Homepage.ipynb
import config
import requests
from sqlitedict import SqliteDict as sqldict

user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}
response = requests.get(config.site, headers=headers)

responsedb = f"{config.name}/responses.db"

with sqldict(responsedb) as db:
    db[config.site] = response
    db.commit()
```

If you're following along in a Jupyter Notebook and want to see the HTML of the
page, go to a new cell block and try:

```python
print(response.text)
```

Congratulations! You have just done a ***zero click-depth*** crawl! You
actually are sitting on top of a lot of good information. We will move onto
extracting and viewing the data more cleanly than printing all the HTML in the
next step, but a word on file management, first. And you'll get to learn one of
the nuances of the import statement. 

### Working on Different Sites

Want to work on different sites? You may encounter the issue that Jupyter
Notebook keeps the Python program running in a sort of frozen state between you
running cells. This means that are your values from your `config.py` file are
sticky. If you change it in the file for another project name and site, the new
directory won't get created until you ***restart the kernel!*** It's not
difficult. 

### Restarting the Kernel

You will find it under the `Kernel` dropdown menu in JupyterLab. As a shortcut,
you can hit the `Esc` key if your cursor is active in any of the cells, then
type zero, zero `0,0` on your keyboard. It's very common and indeed good
practice to restart the kernel between runs in Jupyter Notebooks. Once you
change the value in `config.py` and restart the kernel, you can re-run
`30_Configuration.ipynb` and you'll have your new site folder.

### Extracting Crawl Data

In `40_Extraction.ipynb` we reverse the process of putting data into the
database to get the data out. While this is written to loop through every key
in the database, given that it was a 1-page crawl, there is only one `record`
in the database. As a reminder, we're using the Python `dict` interface,
meaning that the page's URL is the key and the Requests package's ***response
object*** is the value. It's powered by SQLite in the background. And it is a
***read only*** process below. Take note of the lack of a `.commit()`.

```python
import config
from sqlitedict import SqliteDict as sqldict
from bs4 import BeautifulSoup as bsoup

responsedb = f"{config.name}/responses.db"

with sqldict(responsedb) as db:
    for url in db:
        response = db[url]
        soup = bsoup(response.text, "html.parser")
        title = soup.title.string.strip()
        print(title)
```

If you're an SEO, having this capability is table stakes. The leading desktop
webcrawler won't even let you save a crawl without paying a few hundred
dollars. Python is free and the capabilities stay with you for life. And this
is not just a Jupyter Notebook thing. You can build actual scheduled
automations around this same code to work as an SEO monitor, or dozens of other
***deliverables*** you can easily imagine.

Here's a version that extracts many more of the fields of interest to SEOs.

```python
import config
from sqlitedict import SqliteDict as sqldict
from bs4 import BeautifulSoup as bsoup

responsedb = f"{config.name}/responses.db"

with sqldict(responsedb) as db:
    for url in db:
        response = db[url]
        soup = bsoup(response.text, "html.parser")
        title = soup.title.string.strip()
        description = soup.find('meta', attrs={'name': 'description'})['content']
        canonical = soup.find('link', attrs={'rel': 'canonical'})['href']
        headlines = soup.find_all(["h1", "h2", "h3", "h4", "h5", "h6"])
        headlines.sort(key=lambda x: int(x.name[1:]))
        print(url)
        print(f"Canonical: {canonical}")
        print(f"Status code: {response.status_code}")
        print(f"Title: {title}")
        print(f"Meta description: {description}")
        for headline in headlines:
            print(f"{headline.name}: {headline.text.strip()}")
        print()
```

## Finding Links On a Page

So now let's put our first function in an external file called `pipulate.py`.
It takes as its input the soup object and any URL from the site and it returns
a list of on-site ***absolute*** URLs with duplicates removed:

```python
from urllib.parse import urlparse, urljoin

def links(soup, url):
    """Return on-site links from page duplicates removed."""
    parts = urlparse(url)
    homepage = f"{parts.scheme}://{parts.netloc}/"
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
```

Our next Notebook file, `50_Zeroclick.ipynb` gets a list of links from the page
as simply as this:

```python
import config
import pipulate
from sqlitedict import SqliteDict as sqldict
from bs4 import BeautifulSoup as bsoup

responsedb = f"{config.name}/responses.db"

with sqldict(responsedb) as db:
    response = db[config.site]
    soup = bsoup(response.text, "html.parser")

links = pipulate.links(soup, config.site)
```

It's this level of simplicity that we strive for in the entire process so our
individual Notebook files are small and we could even have interactive sessions
with the SEO client. This is where your abilities by taking the FOSS SEO
approach will exceed those who are forced to buy crawlers and site audit tools.

The data you are retrieving is yours and Python-native and ready to transform
into any other system. I can feed machine learning (AI) and other automated
systems. But we'll table that discussion for a moment. Let's to the easiest
possible things with the largest possible payoffs, so you can discuss the
client's site with more authority than anyone using paid products. Even though
we ***possess the links*** for a click-depth of 1 crawl, we have not performed
it yet.

## Visualizing The Link Graph

The temptation is to immediately crawl this new list of links we're sitting on
extracted from the homepage and throw them into `responses.db` like we did with
the homepage, but that would be throwing out some of the most important data
in the SEO game, the Link Graph!

One of the least acknowledged important factors of SEO is at what click-depth a
URL is from the homepage, with the premise being that a harder to find page is
naturally going to be found less, linked-to less and overall less important to
search. The homepage is the most important page. Things linked-to immediately
from the homepage are more important to search. You get the reasoning? You can
even use network visualization tools to show how the webpages all link together
and rotate it like a 3D-map. But most crawlers throw out this data or make it
inaccessible or only available as a click-depth ***count*** in a report. We're
going to keep it.

### Capturing Click-Depth Per URL

With this one addition to the above code, we now have recorded at what
click-depth each of these homepage URLs was found.

```python
clickdepthdb = f"{config.name}/clickdepths.db"

with sqldict(clickdepthdb) as db:
    db[config.site] = 0
    for url in links:
        db[url] = 1
    db.commit()
```

Super-simple, right? Easy to follow. We just establish a brand new database
whose sole purpose is to record at what click-depth each URL was first found.
It's easy to query and its easy to visualize the pyramid-like site hierarchy
graph we could draw from this. But it still doesn't record the juiciest bit,
the actual link graph itself. We need to create ***edges*** for network
visualization software.

### Capturing Network Edges

There's a lot of ways I could record the ***link-from*** and ***link-to***
data relationships as we crawl. And the thing is with this Python dict API that
we're using for super-easy database, keys must be unique and it's the from+to
URL combination that makes it unique. So the link-fron and the link-to values
belong glued together as a database key! Fortunately, Python provides a way to
do that in the form of tuples. We have to do the one additional step of
***pickling*** the tuple to use it as a database key in sqlitedict.

```python
edgesdb = f"{config.name}/edges.db"

with sqldict(edgesdb) as db:
    for url in links:
        atuple = (config.site, url)
        db[pickle.dumps(atuple)] = None
    db.commit()
```

And to confirm that the data comes out like it went in:

```python
with sqldict(edgesdb) as db:
    for apickle in db:
        print(pickle.loads(apickle))
```

All together, `50_Zeroclick.ipynb` looks like this:

```python
import config
import pickle
import pipulate
from sqlitedict import SqliteDict as sqldict
from bs4 import BeautifulSoup as bsoup

# Load the homepage back into memory
responsedb = f"{config.name}/responses.db"
with sqldict(responsedb) as db:
    response = db[config.site]
    soup = bsoup(response.text, "html.parser")

# Get all the links from the homepage
links = pipulate.links(soup, config.site)

# Record all the click-depth 1 pages
clickdepthdb = f"{config.name}/clickdepths.db"
with sqldict(clickdepthdb) as db:
    db[config.site] = 0
    for url in links:
        db[url] = 1
    db.commit()

# Record all the click-depth 1 edges
edgesdb = f"{config.name}/edges.db"
with sqldict(edgesdb) as db:
    for url in links:
        atuple = (config.site, url)
        db[pickle.dumps(atuple)] = None
    db.commit()
```

## 1 Click-Depth Crawl

Depending on how many pages were linked from the site's homepage, this is the
first part of the process that may make you sit and wait. The homepage could
have anywhere from zero links to a few hundred. If it has any more than that,
the site has a topical focus problem with too many individual pages vying for
an attempt to receive relevancy from being linked from the homepage.

Now there are faster ways to do this with ***concurrency*** but we're going for
simplicity and control. Sit and watch the crawl take place with this bit of
code from `60_Oneclick.ipynb`. Follow along and watch each URL that's being
fetched and it's (hopefully) 200 response-code. Watch for patterns in the URL
structure. You will learn a lot knowing these are all homepage links. And
JupyterLab hyperlinks the URL so you can click on any of the links that scroll
by to take a look at the page.

```python
import config
import pickle
import pipulate
import requests
from time import sleep
from sqlitedict import SqliteDict as sqldict
from bs4 import BeautifulSoup as bsoup

user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"
headers = {"user-agent": user_agent}

# Build a list of all URLs found on homepage
clickdepthdb = f"{config.name}/clickdepths.db"
onedepth = []
with sqldict(clickdepthdb) as db:
    for url in db:
        depth = db[url]
        if depth == 1:
            onedepth.append(url)
```

The above code sets the stage for the crawl. I use this `onedepth` table to
eliminate nesting the `with sqldict` database connections. We fill the onedepth
table with only those URLs we intend to crawl for the next step. I import
everything at the top of this Notebook even though some of those won't be
called until the following steps. The next step does the actual crawl.

```python
responsedb = f"{config.name}/responses.db"

for i, url in enumerate(onedepth):
    with sqldict(responsedb) as db:
        countdown = len(onedepth) - i
        if url in db:
            response = db[url]
            print(countdown, response.status_code, url)
        else:
            print(countdown, url, end=" ")
            response = requests.get(url, headers=headers)
            print(response.status_code)
            db[url] = response
            db.commit()
            sleep(.5)
```

There's plenty of nuance to point out here in the coding. I'm putting a
half-second delay between each pageload. I could eliminate that or randomize it
based on whether the site has crawler-blocking issues. You could also throw in
a modulo operator to make it take a long pause between every few pageloads. I'm
keeping the code as simple as possible to look at for now. Once this is done,
you'll have a pretty sizable file on your storage device. Depending on the size
of the site you're crawling, it could easily grow to a few hundred megabytes.
It is all the ***view-source*** HTML code of every page that was visited.

I like the way it counts down from the number of URLs that it knows it's going
to have to visit. It give a real sense of how long you're going to have to
wait. I also like that if the page was already fetched, the
`response.status_code` prints before the URL, and if the page is being fetched,
it prints ***after*** the URL.

### Recording Click-Depth and Edges

We're not really done the 1 Click-Depth crawl until we record the new links we
found that will be used for the 2 Click-Depth crawl. Even though the above
actually recorded all the content from the pages visited, this post-processing
step extracts the newly discovered links, which go in 2 different databases.
Including the homepage as the top, we have enough now to draw a link graph (a
network diagram) like a 3-level pyramid: the homepage, the pages linked from
the homepage, and the pages linked off of the secondary pages.

```python
clickdepthdb = f"{config.name}/clickdepths.db"
edgesdb = f"{config.name}/edges.db"

with sqldict(responsedb) as db:
    for i, url in enumerate(onedepth):
        countdown = len(onedepth) - i
        print(countdown, end=" ")
        if url in db:
            response = db[url]
            if response.status_code == 200:
                soup = bsoup(response.text, "html.parser")
                links = pipulate.links(soup, url)
                # Record newly discoverd links as click-depth 2
                with sqldict(clickdepthdb) as db2:
                    for link in links:
                        if link not in db2:
                            db2[link] = 2
                    db2.commit()
                # Record what pages new links were found on (edges) 
                with sqldict(edgesdb) as db3:
                    for url in links:
                        atuple = (url, link)
                        db3[pickle.dumps(atuple)] = None
                    db3.commit()
```

Here we actually do allow ourselves to nest the `with sqldict` database
connections because it would take a lot of time to do the link extraction
against all this data twice, so you'll see the use of `db2` and `db3`
connection names to avoid conflicting with the already-open `db`.

### Database Commit Per Loop Vs. End

Notice when we `.commit()` to a database, paying close attention to indenting.
During the crawl code we commit after every page is fetched, ***banking the
data*** such as it were, because a re-run is expensive in that it would have to
re-crawl every page of the site if it didn't commit ***inside*** the loop.

Whereas at the post-processing stage the idea is to get through it all as fast
as possible, and one final commit ***outside*** the loop is faster. If things
go wrong, a re-run doesn't cause repeat crawling so we choose processing speed
over more frequent database writes.

### Deep Enough is Enough

At this point, depending on the size of the site you're crawling you may have
hundreds of megabytes of data on your storage device. And that's just the
"view-source" HTML of the pages you crawled. That's not even images, rendered
JavaScript or other resources. This is usually enough to get started with SEO,
because it includes the homepage and all the page deemed important enough to be
linked from the homepage.

It is nice to go to the 2-clicks in from the homepage, but depending on the
size of the site it could be a monumental task for this approach, and I will
expand Pipulate in the future to with strategies to accommodate extremely large
crawls. But for now, Pipulate is for the homepage, secondary pages, and because
secondary pages contain the links to the tertiary pages, we have them in the
link graph (the depth and edges databases) but not the crawl (responses
database).

