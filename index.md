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

## Python: The New Lingua Franca of Tech

Python has become ubiquitous. That means it's found everywhere today. It has
replaced Perl as the standard language included with nearly every Linux
distribution, fortifying it in the world of tech in ways which even JavaScript
can not compete. The fact that Python only continues to rise in popularity in
the face of everything that ***should have killed it*** tells you a lot. 

While plenty of people find love in JavaScript, it is of necessity. The love
for Python runs deep in a way that you will not encounter with many things in
life. While it's still not perfect, what is? Python hitting this ***good
enough*** 80/20-rule sweet-spot for so long across so many industries and in
education makes it the one language to take up if you must choose only one.

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

### Imports Load Functions & Classes Into Memory

Notice while a value is set in the file that gets imported, you don't see any
***side effects*** of the code having actually run until it is ***invoked*** by
the print function being called. So importing import `foo.py` from
`filename.py` gives filename.py access to ***bar*** in foo's ***namespace***.

There's plenty more to learn, but this is one of the most important to know
about importing Python packages since it's usually the first line of code
you'll encounter in many projects. By the way, you will often hear the term
***libraries*** and ***packages*** being used interchangeably.

### Indents Matter

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

### Order of Execution

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

### Lists, Tuples and Dicts

This is the last part of the Python crash course because I must discuss
***dicts*** before we turn them into the easy to use databases we're going to
need for our FOSS SEO work like site-crawling.

The three main datatypes in Python are `lists`, `tuples` and `dicts`. There are
many others which you'll encounter in other programming languages like integers
and strings, but lists, tuples and dicts (dictionaries) are what really
differentiate Python and give it a lot of its distinct personality as a
programming language. They are ***container*** datatypes that ***hold
sequences*** of numbers, strings and other values, and are used everywhere as
building blocks of your program.

Lists let you add and remove items from a list, much like it sounds. They can
grow longer and shorter, and are thus referred to as mutable or dynamic.
Position in the list matters and you can use numbers to access data at
positions in the list. 

```python
alist = ["Item one", "Item two", "Item three"]
```

Tuples are like lists of a fixed-size and often referred to as static or
immutable. They're used all over the place in Python to pass data where
fixed-positions have meaning. They use parenthesis instead of square brackets.
At first lists and tuples look very similar, but their use cases are very
different in ways we'll defer talking about for now.

```python
atuple = ("Item one", "Item two", "Item three")
```

A Python dictionary (or just dict) contains key/value pairs. You'll sometimes
here key-value pairs, name-value pairs, or label-value pairs. These terms are
all used to describe a data structure that consists of a pair of data elements:
a key (or name or label) and a value. The key is a unique identifier, and the
value is the associated data. They're like lists, but instead of having numeric
locations to access values, they have other values.

```python
adict = {"one": "Item one", "two": "Item two", "three": "Item three"}
```

The keys are the ***one***, ***two*** and ***three*** to the left of the colon.
The values are to the right. Dict keys must be unique. The Web is like a giant
dictionary with URLs being keys and webpages being the values. You access
values in a dict using the keys:

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

### End Python Crash Course

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

### Interface Wrappers

A very useful, popular and lightweight database is distributed with Python.
It's called ***SQLite***. Technically, it's sqlite3. Python lets you use this
database directly with the `sqlite3` built-in package, but we're not going to
be using it because we can use the `dict` datatype interface much more easily.
***Wrapping*** one thing whose interface or ***API*** is somewhat complicated
or cumbersome in another thing with a simpler interface is a common trick in
tech, and particularly common in Python. So SQLite's SQL interface is being
wrapped to look like the dict interface.

### Context Manager

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
allow us to ***externalize*** anything t a function into a common
resource that can be used between files. 

###
