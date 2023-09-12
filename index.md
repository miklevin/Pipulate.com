---
title: Pipulate
description: Pipulate Free and Open Source SEO Software
permalink: /
group: home
---

# FOSS SEO Software & Programming Literacy

The Python Notebook coding examples found on this page help you get found
better in search, but the skills you will develop are applicable in a thousand
different ways in life. Learn modern programming literacy and future-proof
yourself by learning to code like you learned to read and write. Be confident
knowing your skills can't be taken away through planned obsolescence, tech
churn, or not continuing to pay for some product. That's the advantage of free
and opens source software (FOSS). 

This all starts by running code on Linux servers under your control. First,
install JupyterLab under the Windows Subsystem for Linux (WSL). An easy way is
to use the <a href="https://mykoz.ai">MyKoz</a> Linux JupyterLab installer for
Windows. It will install all the below examples onto your machine ready-to-use.
You can alternatively copy/paste the code into the Notebook environment of your
choice. Everything should work except for that which automates local web
browsers using the resources of your local machine.

1. TOC
{:toc}

## Python Is The New Lingua Franca of Tech

Python has become ubiquitous. That means it's found everywhere today. It has
replaced Perl as the standard language included with nearly every Linux
distribution, fortifying it in the world of tech in ways which even JavaScript
can not compete. The fact that Python only continues to rise in popularity in
the face of everything that ***should have killed it*** tells you a lot. 

### A Word on JavaScript & WebDev

You can't take up web development (webdev) without needing to program a little
JavaScript. The JavaScript ***frameworks*** like ReactJS and VueJS are just big
enough that they can consume you and become your main focus. While plenty of
people do manage to ***find the love*** in JavaScript, it's necessity for
web-oriented work makes it feel like more of a logical choice as a general
purpose programming language than it is.

### Python Was Designed for You

The love for Python runs deep in a way that you will not encounter with many
other programming languages. The story starts with a language called ***ABC***
which was designed to be friendly to beginners. While it's still not perfect,
what is? Python hitting this ***good enough*** 80/20-rule sweet-spot for so
long across so many industries and in education makes it the one language to
take up if you must choose only one.

## Crash Course in Python

There's plenty of great resources on Python. I want to jump right into the SEO
Notebooks, but before we do there are just a few words I'd like to say to get
rid of the biggest questions you may have. They concern imports, the line
indents, the dot-notation, and the top-down order-of-execution. If you need
more, use one of the many books or online resources on learning Python. And as
a bonus, double-quotes and single-quotes are used pretty much interchangeably.

### You Encounter Imports Right Away

Almost every Python code example you see will start with an `import` statement.
This is because Python like many languages does not load everything it might
need into memory every time it is run. Instead, you have to explicitly tell
Python what you're going to be using if it's not part of the small set of
built-in's. But the import system is still easy enough to wrap your mind
around. 

If `foo` is being imported, somewhere on your system there is a file named
`foo.py` even though you might not be able to see it. Such files ***can*** be
in the directory you're working out of, but also there are special paths where
Python always checks, including ***standard libraries***, plus things that have
been explicitly installed afterward, using the ***pip install*** command.

### Imports Create Namespaces

When such an import occurs, a ***namespace*** is created for it which contains
all its stuff that you can access using ***dot notation***.

Let's say a file named `foo.py` contains only the following single line of
code:

```python
bar = 123
```

If you `import foo` from a file named `filename.py` and try to print it's
***bar*** value like so:

```python
import foo

print(foo.bar)
```

...it will produce the following output when you run the program:

    >> 123

### Imports Load Functions Into Memory

Notice while a value is set in the file that gets imported, you don't see any
***side effects*** of the code having actually run until it is ***invoked*** by
the print function being called. So importing import `foo.py` from
`filename.py` gives filename.py access to ***bar*** in foo's ***namespace***.

### Built-in's, Functions and Classes

The `print()` command is a built-in function. It is one of the ***built-in***
functions that doesn't require an import and is loaded into the ***global***
namespace. Imports might also load a special type of function called a `class`
into memory, which are like functions but use a lot of ***dot notation*** in
part of a coding style called ***object oriented***.

There's plenty more to learn, but the high-level idea of what imports are doing
is one of the most important to know since it's one of the first things you
encounter, being the first line of code in many programs. As I freshen up
Pipulate, I will be moving many of its more complex bits of reusable code into
an importable `pipulate.py` module. The term ***library***, ***package*** and
***module*** are often used interchangeably.

### Indents Matter (White space)

The next thing to know about Python that is very different from other languages
is that the amount of indent at the beginning of each line matters. Lines that
are indented the same amount get grouped together. This is also done by in
almost every other language, but the decision to abide by this in other
languages is by convention and not enforced like it is in Python. Those other
languages usually use curly braces for code-blocks and semicolons for
line-breaks. Sometimes they'll use keywords instead of curly braces.

Python assumes that if you're going to be formatting all your code with indents
and line breaks anyway, it might as well mean something, thus dramatically
improving code readability and reducing the overall amount of code that you
need to write and look at. Code written in other languages often looks
unnecessarily bloated after working in Python for awhile.

### Top-Down Order of Execution

Sometimes Python will look ridiculously easy and other times it will look mind
bogglingly complex. Working in Jupyter Notebooks as we are here, the goal is to
keep it all easy and work in very small chunks, each of which easily fits in a
Notebook that doesn't need you to scroll much. My goal is to make a number of
discrete stand-alone notebooks. They can chain-up to achieve greater things,
but whenever there is complexity, we ***externalize*** the complex bits into an
importable library.

As such, we favor Python's default top-down code execution style. When Python
encounters a ***function*** or a ***class*** which you will recognize with the
`def` keyword or the `class` keyword at the top of a series of lines that are
indented underneath of it, Python ***defers execution*** until when that
function or class is explicitly ***called***. You can recognize a function
being called because it ***always*** is followed by parenthesis. If Python's
top-down execution style is being overwritten because even the main body of the
program is in a function, you will often see this weird bit of code:

```python
if __name__ == "__main__":
    main()
```

We will avoid doing this in our Notebooks here, but you should know that's a
trick to keep the main function from running if it ever gets imported as a
library instead of being run directly.

### Primitive and Object Data Types

There are many types of data in Python and other programming languages. The
tiniest ones are called ***primitives*** and are mostly integers, floats and
strings which are just numbers and alphanumeric data. Sometimes you'll hear
them referred to as low-level datatypes. But there are also larger and more
feature-rich types of data we call ***objects***.

### Lists, Tuples and Dicts

The three most popular higher-level datatype object models in Python are
`lists`, `tuples` and `dicts`. We call them models because when you're using a
list, tuple or dict, you're using an ***instance*** of that model which you
have created, sort of like stamping something out from a template. Lists,
tuples and dicts (dictionaries) are what really differentiate Python and give
it a lot of its distinct personality as a programming language, turning it into
more of a framework of prefabricated components than just a general programming
language.

#### Lists

Lists let you add and remove items from a list, much like it sounds. They can
grow longer and shorter, and are thus referred to as mutable or dynamic
objects. Position in the list matters and you can use numbers to access data at
positions in the list. You can create lists using ***square brackets***.

```python
alist = ["Item one", "Item two", "Item three"]
```

You can do things like append to a list and pop items off a list. Having such
unique capabilities built into an object type is what makes it special.

```python
alist.append("Item four")  # Adds a fourth item to the list
last_item = alist.pop()  # Sets last_item to last item and removes it from list
```

And you can access items in a list using their ***zero-based index***.

```python
print(alist[1])  # Prints 2nd item in list
```

outputs:

    >> Item two

#### Tuples

Tuples are like lists of a fixed-size and often referred to as static or
immutable. They're used all over the place in Python to pass data where
fixed-positions have meaning. They use ***parenthesis*** instead of square
brackets.

```python
atuple = ("Item one", "Item two", "Item three")
```

At first lists and tuples look very similar, but their use cases are very
different. Because they don't have dynamic capabilities like appending and
popping, they are more memory efficient, so when you ***nest*** objects to
achieve data structures like the rows and columns of a spreadsheet, you would
typically use a list as the outer object and tuples inside. The following is a
3x3 grid constructed of three rows of tuples inside one list.

```python
list_of_tuples = [(1, 2, 3), (4, 5, 6), (7, 8, 9)]
```

#### Dicts

A Python dictionary (or just dict) contains key/value pairs. You'll sometimes
here key-value pairs, name-value pairs, or label-value pairs. These terms are
all used to describe a data structure that consists of a pair of data elements:
a key (or name or label) and a value. The key is a unique identifier, and the
value is the associated data. They're like lists, but instead of having numeric
locations to access values, they have other values. Dicts can be created with
***curly braces***.

```python
adict = {"one": "Item one", "two": "Item two", "three": "Item three"}
```

The keys are the ***one***, ***two*** and ***three*** to the left of the colon.
The values are to the right. Dict keys must be unique. The Web is like a giant
dictionary with URLs being keys and webpages being the values. You access
values in a dict using the keys. Square brackets are used just like with
indexes in a list, but instead of numerical values, you use the key.

```python
print(adict["one"])
```

Which displays:

    >> Item one

We can likewise add new keys to the dictionary like so:

```python
adict["Arbitrary key"] = "Arbitrary value"
```

This ability to throw new key/value pairs into a Python dictionary object is
what we will be building upon in a moment for our web crawler. This is the
***key knowledge*** we're building upon (pun intended). We'll be using this
key/value setting everywhere in these Jupyter Notebook FOSS SEO examples,
making it persistent with the dictionary trick to follow.

### Assigning Values Versus Equivalency Operators

There's plenty more to learn about Python. It's often said Python is a language
you can learn in a weekend and then spend the rest of your life mastering. If I
were to leave you with one last important piece of information before we dive
into our web crawler, it would be that a double-equals `==` is a ***comparison
operator*** whereas a single equals `=` is an ***assignment operator***. And
the hash symbol `#` is for comments. So...

```python
a = 1  # Sets the variable named a to 1
a == 1  # Tests wether the value in a is 1, and will return True in this case
```

### All Objects Can Evaluate True or False

Many things when tested directly in Python will return `True` or `False`
depending on the value they contain. If something contains a zero `0`, an empty
string or a special value called `None`, it will return ***False*** when
tested. If they contain anything else, they return ***True***. This is often
used to make code more concise. Colons `:` are used at the end of
***conditional operators*** like so:

```python
if a:
    print("A has a value.")
```

The above has given a bare minim overview of Python so that we can get our web
crawler underway.

## Python Dict as Database

URLs and webpages make for perfect key/value pairs in a Python dictionary. So
it makes sense to ***crawl a site into a dictionary***. The problem with that
is the content will be lost the moment the Python program stops running. And so
we use the ***sqlitedict*** library from PyPi.org. If you're on a system built
by the mykoz script, you already have it installed. If not, `pip install
sqlitedict`.

### Python Wrappers Simplify Complexity

A very useful, popular and lightweight database is distributed with Python.
It's called ***SQLite***. Technically, it's sqlite3. Python lets you use this
database directly with the `sqlite3` built-in package, but we're not going to
be using it because we can use the `dict` datatype interface much more easily.
***Wrapping*** one thing whose interface or ***API*** is somewhat complicated
or cumbersome in another thing with a simpler interface is a common trick in
tech, and particularly common in Python. So SQLite's SQL interface is being
wrapped to look like the dict interface.

### The Context Manager Opens and Closes Connections

Part of the API simplification trick is getting rid of explicit ***open*** and
***close*** instructions to the connection to the database. Whenever Python or
any system needs to interact with an outside physical resources such as storage
(databases, files, etc.), there is the necessity to manage that connection to
that resource. Of course computers being computers, this tedious housekeeping
can be automated. Python's way of doing it is with something called the
***context manager***. For devices that support it, Python can use the `with`
keyword to get rid of all this opening and closing. The sqlitedict package adds
the Python dict API and context manager support to the built-in SQLite
database.

```python
from sqlitedict import SqliteDict as sqldict

with sqldict("name.db") as db:
    db["www.example.com"] = "HTML of the page"
    db.commit()
```

### Things to Notice

Two things to notice about the above example are that on the import, we
***rename*** a single component we're plucking out of the sqlitedict library to
make it easier to use later. And we have to explicitly ***commit*** the change
we just made to the dict in order for it to get saved permanently. Otherwise,
the change is only ***in-memory***. This is different than with a normal dict,
but it is a small price to pay to use the dict API for a persistent database.

### Endlessly Useful Database Trick

I believe this simple database trick of making a Python dict persistent is so
fundamental and useful that it should be built into Python. It does away with
mountains of complexity and unnecessary deliberation over what database and API
to use for key-based data storage. Something similar ***can*** be done with a
Python library called `pickle`, but the code is more complicated and it does
not use SQLite for the actual data, so the performance is much slower and
you're not setting the stage to learn ***SQL*** later on at some point, another
very powerful and important language, but not one you need to learn up-front
when the dict API will do.

## Rebooting Pipulate Project

Every few years I reboot the Pipulate project using my new thinking, so I have
"wiped" the examples that were previously on the site and I'll be rebuilding it
up here as one long page. When I'm done, I'll refine it, breaking it into
separate pages. 

My new thinking is that I will maintain a `pipulate.py` file side by side with
the Jupyter Notebook files `[Notebook Name].ipynb` example files. This will
allow us to ***externalize*** anything to a function into a common resource
that can be used as a common resource between different Pipulate Jupyter
Notebook examples. As I finish, I'll update the ***pip installable*** version
of Pipulate with the latest.

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

## Keywords

A crawl is a crawl and its data is objective. Such-and-such is published, and
here it is. But keywords are subjective and the ways of trying to figure out
what keywords a webpage or website is trying to target and should be targeting
are endless, and ultimately less than satisfying (k-means clustering,
levenshtein distance, yet another keyword extractor, consulting a chatbot,
yadda, yadda). 

There are external and usually costly tools, and unless you're Google, they're
still subjective. There are the keyword planners of the ad products. There is
auto-completion and the Google Suggest API. There are keyword extraction tools
that can pull it out of crawl data. Every approach has its pluses and minuses
and the quality and usable purposes of the resulting lists vary. And don't get
me started on keyword search volume estimates. For FOSS SEO, we focus on the
open parts of the open Web and do what we can with readily available data.

### A Crawl-Centric Approach to Keywords

Pipulate takes the approach that the most valuable keyword list will be the one
you can perform searches on to see if the pages that appear to be targeting
those keywords are actually appearing, so extracting the keywords from the
crawl data appears to be the most sensible approach. We will deal with
"missing" keywords (gap analysis) for competitive purposes later, using such
techniques as repeating the crawl against competitor sites. But keyword
extraction isn't as easily automated as you might wish. Even AI (right now) is
not as good as the process I'm about to show you.

### Random Peeks at Site Content

There's no better way to get familiar with a site than to just surf around it
in a web browser and `view-source` a lot. But grabbing a random page of the
site from your crawl data and looking at SEO fields is good too. What's better
is rapidly doing that over and over. It will start giving you a holistic
overview of the site and surface a lot of issues. And that's how the Notebook
`80_Keywords.ipynb` begins. Run this bit of code and be amazed!

```python
import config
import random
from sqlitedict import SqliteDict as sqldict
from bs4 import BeautifulSoup as bsoup
from collections import Counter

responsedb = f"{config.name}/responses.db"

# Get a count of the rows
with sqldict(responsedb) as db:
    for rows, url in enumerate(db):
        ...

# Show SEO fields for a random page from the crawl
random_number = random.randint(0, rows)
with sqldict(responsedb) as db:
    for i, url in enumerate(db):
        if i == random_number:
            response = db[url]
            soup = bsoup(response.text, "html.parser")
            title = soup.title.string.strip()
            description = soup.find('meta', attrs={'name': 'description'})['content']
            canonical = soup.find('link', attrs={'rel': 'canonical'})['href']
            headlines = soup.find_all(["h1", "h2", "h3", "h4", "h5", "h6"])
            headlines.sort(key=lambda x: int(x.name[1:]))
            print(i, url)
            print(f"Canonical: {canonical}")
            print(f"Status code: {response.status_code}")
            print(f"Title: {title}")
            print(f"Meta description: {description}")
            for i, headline in enumerate(headlines):
                print(f"{i+1} {headline.name}: {headline.text.strip()}")
            print()
            break
```

Got that? You're randomly surfing the site you crawled so far without ruining
it by cramming it into a spreadsheet and looking at it all at once (yet). The
longer you put off the spreadsheet view of the world world, the sooner you'll
grow beyond it. Your new life as an data-centric SEO begins in SQLite and
Python Pandas, not Excel or Sheets.

### The Keyword Conundrum

Keywords aren't going to be perfect it the crawl data. It ***will*** take human
interaction. Every site is going to have its own weird issues. The best I can
offer you is the ability to work fast and not duplicate effort. Again, the
80/20-rule also known as the Pareto principle comes into play. Where do you get
80% of the payoff from only the first 20% of the effort you might put into a
job? That comes from what you learned in the prior step, getting a holistic
overview of the site. 

Hopefully your best keyword clues are in the title tags, meta descriptions and
headlines. The code I'm about to show you may have to be customized for your
situation.

### Harvest Keywords from Site Crawl Data

So you have all that crawl data, but how to "extract" keywords. Unfortunately,
the best answer is to go title-tag by title-tag and look at them, taking
whatever shortcuts you can that preserves high-quality selection. The advantage
here is that because they're lifted directly from the site, you can perform
searches (SERPs) and compare how the site is doing against what it appears to
be targeting. This is an excellent starting point in a technical site analysis
because it's measuring actual targeted keywords against actual search
performance.

The shortcuts to help in this process don't work well in Jupyter Notebooks.
Each title tag needs to be made directly editable. This is something that's
possible with the `readline` module. It's like the Python `input` command, but
instead of having to retype the title tag, you can just edit it, then hit
`Enter`. Using this technique, you can get through a pretty big list of title
tags quickly and use Python to minimize duplicate work as you go. But it has to
be run from a ***Terminal*** and not a Notebook.

```python
import readline

def input_with_prefill(prompt, prefill):
  readline.set_startup_hook(lambda: readline.insert_text(prefill))
  try:
    return input(prompt)
  finally:
    readline.set_startup_hook()

prefilled_value = "This is the prefilled value."

value = input_with_prefill("Enter a value: ", prefilled_value)

print("You entered:", value)
```

This is such a subtle point. You won't encounter it anywhere else in the field
of SEO. The idea is to gameify re-writing titles into the series of keywords
they imply, minimizing re-typing and getting you on a roll.

```python
# file: pwgame.py
import config
import re
import readline
from pathlib import Path
from collections import Counter
from bs4 import BeautifulSoup as bsoup
from sqlitedict import SqliteDict as sqldict

responsedb = f"{config.name}/responses.db"
keywordsdb = f"{config.name}/keywords.db"
seenurlsdb = f"{config.name}/seenurls.db"


def input_with_prefill(prefill):
    readline.set_startup_hook(lambda: readline.insert_text(prefill))
    try:
        return input()
    finally:
        readline.set_startup_hook()


pattern = "( \| | - | & )"


def kwclean(s):
    s = s.replace(" and ", " ")
    s = re.sub(r"\s+", " ", s)
    s = re.sub(pattern, ", ", s)
    kwlist = s.split(",")
    kwlist = [x.strip() for x in kwlist]
    return kwlist


seen_urls = set()
if Path(seenurlsdb).is_file():
    with sqldict(seenurlsdb) as db:
        for url in db:
            seen_urls.add(url)

seen = set()
if Path(keywordsdb).is_file():
    with sqldict(keywordsdb) as db:
        for kw in db:
            seen.add(kw.lower())

with sqldict(responsedb) as db:
    for numpages, url in enumerate(db):
        ...

countdown = numpages
print(countdown)

with sqldict(responsedb) as db:
    for i, url in enumerate(db):
        print(countdown - i)
        if url not in seen_urls:
            response = db[url]
            soup = bsoup(response.text, "html.parser")
            title = soup.title.string.strip()
            title = ", ".join(kwclean(title))
            before_kws = kwclean(title)
            after_kws = []
            counter = Counter()
            for kw in before_kws:
                kwlow = kw.lower()
                if kwlow not in seen:
                    after_kws.append(kw)
                words = kw.split(" ")
                for word in words:
                    counter[word] += 1
            maxval = max(counter.values())
            maxlabel = max(counter, key=counter.get)
            mod_kws = []
            for j, kw in enumerate(after_kws):
                words = kw.split()
                if j == 0:
                    first = None
                    if len(words) > 1:
                        first = words[0]
                if len(words) == 1:
                    if maxval > 1:
                        kw = f"{maxlabel} {kw}"
                    elif first:
                        kw = f"{first} {kw}"
                chops = ["More"]
                for chop in chops:
                    if kw[: len(f"{chop} ")].lower() == f"{chop} ".lower():
                        kw = kw[len(f"{chop} ") :]
                mod_kws.append(kw)
            mod_kws = [x for x in mod_kws if x.lower() not in seen]
            kw_str = ", ".join(mod_kws)
            if not kw_str:
                continue
            collect = input_with_prefill(kw_str)
            print(collect)
            collect_list = collect.split(",")
            collect_list = [x.strip() for x in collect_list]
            with sqldict(keywordsdb) as db2:
                for kw in collect_list:
                    if kw and kw not in seen:
                        db2[kw] = url
                        seen.add(kw.lower())
                db2.commit()
            with sqldict(seenurlsdb) as db2:
                db2[url] = None
                db2.commit()
```
