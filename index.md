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
