#  _____ _     _       _       ____  _             _       _
# |_   _| |__ (_)___  (_)___  |  _ \(_)_ __  _   _| | __ _| |_ ___
#   | | | '_ \| / __| | / __| | |_) | | '_ \| | | | |/ _` | __/ _ \
#   | | | | | | \__ \ | \__ \ |  __/| | |_) | |_| | | (_| | ||  __/
#   |_| |_| |_|_|___/ |_|___/ |_|   |_| .__/ \__,_|_|\__,_|\__\___|
# Push Pandas DataFrames into GSheets |_| for Dashboards and more. 


import ohawf
import gspread
import pandas as pd
from sys import exit
from sys import stdout
from inspect import getsource
from apiclient.discovery import build


gspread_sheet = None
column_uniqueness = False
gui = "https://docs.google.com/spreadsheets/d/"
link = lambda key: f"{gui}{key}/edit#gid=0"
key = lambda key: sheet(key)

def sheet(key):
    global gspread_authorized
    global gspread_sheet

    continue_executing = False
    if key[:4].lower() == "http":
        gspread_sheet = gspread_authorized.open_by_url(key)
    else:
        gspread_sheet = gspread_authorized.open_by_key(key)
    try:
        sheet1 = gspread_sheet.worksheets()[0].title
        continue_executing = True
    except:
        continue_executing = False
    if key[:4].lower() == "http":
        print(key)
    else:
        print(link(key))
    if not continue_executing:
        print("Cannot access document. Check URL/key and permissions.")
        exit(1)
    print("<<< CONNECTED TO SHEET! >>>")
    print(
        'Try: cl, df = pipulate.pull("%s", "A1:C3") # or for help type: pipulate.help()'
        % sheet1
    )


def help():
    print("Welcome to Pipulate, eaiser Google Sheet automation for SEO and more.")
    print()
    print(
        "This is a dynamic library, always being improved and the API is subject to change."
    )
    print(
        "Get the latest by issuing the following command: (trick can be used on any package)"
    )
    print()
    print("    import sys")
    print("    !{sys.executable} -m pip install --upgrade --no-cache-dir pipulate")
    print()
    print("Google Analytics example functions are now built-in. For examples:")
    print()
    print("    pipulate.examples()")
    print()
    print(
        "Load a Google Sheet with the following command (replace text between quotes):"
    )
    print()
    print('    pipulate.sheet("Insert your Google Sheet key or URL")')
    print()
    print(
        'Now you can select a gspread "cell_list" (cl) and a pandas "DataFrame" (df) like this:'
    )
    print()
    print('    cl, df = pipulate.pull("Sheet1", "A2:C4")')
    print()
    print("You can optionally leave off the last-row number. It will be figured out:")
    print()
    print('    cl, df = pipulate.pull("Sheet1", "A2:C")')
    print()
    print(
        "The cl is a place-holder for later, but df is a manipulateable pandas DataFrame."
    )
    print(
        "Pandas DataFrames are like tabs in Excel or tables in SQL. Check your row x col shape:"
    )
    print()
    print("    df.shape")
    print()
    print(
        "Now you can use the pandas API to manipulate the pandas DataFrame (df) like this:"
    )
    print()
    print('   df[["A", "B"]] = ["foo", "bar"]')
    print()
    print(
        "You can see your changes by running df on a line by itself in Jupyter Notebook."
    )
    print()
    print("    df")
    print()
    print("Now make append the values of columns A and B into column C:")
    print()
    print('    df["C"] = df["A"] + df["B"]')
    print()
    print('And finllay, "push" the altered DataFrame back into GSheet:')
    print()
    print('    pipulate.push("Sheet1", cl, df)')
    print()
    print("It's nice to work with column labels, so let's put some in:")
    print()
    print('    pipulate.poke("Sheet1", columns=["One" , "Two", "Three"])')
    print()
    print("And now we can select the DataFrame with row 1 as column labels:")
    print()
    print('    cl, df = pipulate.pull("Sheet1", "A1:C4", columns=True)')
    print()
    print("Learn more at https://github.com/miklevin/Pipulate")


def pull(tab, rows, cols=None, columns=None, start=None, end=None):
    return pipulate(tab, rows, cols=cols, columns=columns, start=start, end=end)


def push(tab, cl, df, formulas=False):
    return populate(tab, cl, df, formulas=formulas)


def poke(tab, columns, row=1, start=1):
    cl, df = pull(tab, (row, row), (start, len(columns)))
    df.loc[:, :] = columns
    return push(tab, cl, df)


def pipulate(tab, rows, cols=None, columns=None, start=None, end=None):
    original_range, original_row1 = None, None

    worksheet_ = check_worksheet(tab)

    if gspread_sheet is None:
        print('Make sure you pipulate.sheet("key or url") first.')
        exit(1)

    if cols:
        row1, row2 = rows
        if type(columns) == bool:
            original_row1 = row1
            row1 = row1 + 1
        col1, col2 = cols
        if not (type(col1) == int or type(col2) == int):
            col1, col2 = a1(col1, reverse=True), a1(col2, reverse=True)
        cl = worksheet_.range(row1, col1, row2, col2)
        list_of_lists = cl_to_list(cl)
        if not columns:
            cell_list = worksheet_.range(row1, col1, row1, col2)
            columns = [a1(x.col) for x in cell_list]
    elif ":" in rows:
        if not rows.split(":")[1][-1].isdigit():  # Figure out end of column
            aletter = rows.split(":")[1]
            col_length = len(worksheet_.col_values(a1(aletter, reverse=True)))
            rows = "%s%s" % (rows, col_length)
        if type(columns) == bool:
            original_range = rows
            rows = shift_range(rows)
        cl = worksheet_.range(rows)
        list_of_lists = cl_to_list(cl)
        if not columns:
            columns = [a1(i + 1) for i, x in enumerate(list_of_lists[0])]
    else:
        print("Check your rows or range definition.")
        exit(1)

    if type(columns) == bool and columns == True:
        if cols:
            cl_cols = worksheet_.range(original_row1, col1, row2, col2)
        else:
            cl_cols = worksheet_.range(original_range)
        columns = cl_to_list(cl_cols)[0]
    if column_uniqueness:
        if not all(columns):
            print(columns)
            print(
                "All columns must have labels when using columns=True or columns=list."
            )
            exit(1)
        if len(set(columns)) < len(columns):
            print(columns)
            print(
                "All columns must have labels when using columns=True or columns=list."
            )
            exit(1)

    df = pd.DataFrame(list_of_lists, columns=columns)

    print(
        "<<< SUCCESSFUL! >>> Manipulate DataFrame but keep its (%s x %s) shape."
        % df.shape
    )
    print(
        'To push updated DataFrame to GSheet: pipulate.push("%s", cl, df)'
        % worksheet_.title
    )
    return cl, df


def populate(tab, cl, df, formulas=False):
    """Push df back to spreadsheet."""

    worksheet_ = check_worksheet(tab)

    if cl_df_fits(cl, df):
        lol = df.values.tolist()
        flat = [y for x in lol for y in x]
        flat[:] = ["N/A" if pd.isnull(x) else x for x in flat]
        for i, cell in enumerate(cl):
            cell.value = flat[i]
        if formulas:
            worksheet_.update_cells(cl, value_input_option="USER_ENTERED")
        else:
            worksheet_.update_cells(cl)
    else:
        exit(1)
    print('pipulate.push("%s", cl, df) <<< GSHEET UPDATED! >>>' % worksheet_.title)


def shift_range(sheet_range):
    range_tuple = sheet_range.split(":")
    upper_left = range_tuple[0]
    for i, x in enumerate(upper_left):
        if x.isnumeric():
            break
    row_one = int(upper_left[len(upper_left) - 1 :])
    col_one = upper_left[: len(upper_left) - 1]
    row_two = row_one + 1
    return "".join([col_one, str(row_two), ":", range_tuple[1]])


def check_worksheet(worksheet):
    global gspread_sheet
    if type(worksheet) == gspread.models.Worksheet:
        tab = worksheet
    elif type(worksheet) == str:
        if "gspread_sheet" in globals():
            if worksheet in [x.title for x in gspread_sheet.worksheets()]:
                tab = gspread_sheet.worksheet(worksheet)
            else:
                print("Worksheet not found")
                exit(1)
        else:
            print("pipulate.sheet([your gsheets key here]) must be set")
            exit(1)
    elif type(worksheet) == int:
        if "gspread_sheet" in globals():
            if worksheet <= len(gspread_sheet.worksheets()):
                tab = gspread_sheet.worksheets()[worksheet]
            else:
                print("Worksheet ID too high. Try 0 for sheet 1.")
                exit(1)
        else:
            print("pipulate.sheet([your gsheets key here]) must be set")
            exit(1)
    else:
        print(
            "Worksheet must be exact tab-name as string, gspread Worksheet object or tab-index."
        )
        exit(1)
    return tab


def cl_to_list(cl):
    new_table = []
    for i, cell in enumerate(cl):
        if i == 0:
            row_num = 1
            memory = cell.row
            row = [cell.value]
        if cell.row == memory and i > 0:
            row.append(cell.value)
        else:
            row_num += 1
            memory = cell.row
            row = [cell.value]
            new_table.append(row)
    return new_table


def cl_df_fits(cl, df):
    """Check if GSpread cell list same shape as Pandas dataframe."""
    list_of_lists = cl_to_list(cl)
    height = len(list_of_lists)
    width = len(list_of_lists[0])
    size_tuple = (height, width)
    if size_tuple == df.shape:
        return True
    print("GOOGLE SHEET NOT UPDATED.")
    print("cl %s and df %s different sizes." % (size_tuple, df.shape))
    return False


def a1(pos, reverse=False):
    """Return the column letter for numeric column index."""
    if reverse:
        return gspread.utils.a1_to_rowcol("%s1" % pos)[1]
    if str(pos).isdigit():
        return gspread.utils.rowcol_to_a1(1, pos)[:-1]
    else:
        return "Must be integer"


def google_service(api, version):
    return build(api, version, credentials=credentials)


def ga(qry=False):
    """
    https://developers.google.com/analytics/devguides/reporting/core/v4/samples
    https://ga-dev-tools.appspot.com/request-composer/
    ga_qry = {
      "reportRequests": [
        {
          "viewId": "[Insert Profile ID here]",
          "samplingLevel": "SMALL",
          "dateRanges": [
            {
              "startDate": "2019-11-01",
              "endDate": "2019-11-30"
            }
          ],
          "metrics": [
            {
              "expression": "ga:sessions"
            },
            {
              "expression": "ga:pageviews"
            }
          ],
          "segments": [
            {
              "segmentId": "gaid::[Insert Segment ID here]"
            }
          ],
          "dimensions": [
            {
              "name": "ga:segment"
            }
          ],
        }
      ]
    }

    ga = pipulate.ga(ga_qry)
    pipulate.print_ga(ga)
    """

    service = google_service("analyticsreporting", "v4")
    if qry:
        return service.reports().batchGet(body=qry).execute()
    else:
        print("Design a query at:  https://ga-dev-tools.appspot.com/request-composer/")
        print("and then invoke the query using foo = pipulate.ga(query).")
        print("You can extract result values as a list with pipuate.list_ga(foo).")


def gsc(url, qry):
    """
    https://github.com/googleapis/google-api-python-client/blob/master/samples/searchconsole/search_analytics_api_sample.py
    https://developers.google.com/webmaster-tools/search-console-api-original/v3/how-tos/search_analytics.html
    Results are sorted by click count descending.

    gsc_qry = {
        'startDate': '2019-11-01',
        'endDate': '2019-11-30',
        'dimensions': ['query'],
        'rowLimit': 10
        }

    gsc = pipulate.gsc('https://www.pcmag.com/', gsc_qry)
    pipulate.print_gsc(gsc)
    """

    service = google_service("webmasters", "v3")
    return service.searchanalytics().query(siteUrl=url, body=qry).execute()


def gscurl2kw(page):
    # https://developers.google.com/webmaster-tools/search-console-api-original/v3/searchanalytics/query
    request = {
      "dimensions": [
        "QUERY"
      ],
      "dimensionFilterGroups": [
        {
          "filters": [
            {
              "dimension": "PAGE",
              "operator": "EQUALS",
              "expression": page
            }
          ]
        }
      ],
      "startDate": "2020-01-01",
      "endDate": "2021-09-18"
    }


def yt(qry):
    """
    https://github.com/youtube/api-samples/blob/master/python/yt_analytics_v2.py

    yt_qry = {
        'ids': 'contentOwner==[YouTube content owner ID here]',
        'startDate': '2019-01-01',
        'endDate': '2019-12-31',
        'metrics': 'views',
        'filters': 'video==[video ID here]'
        }
    yt = pipulate.yt(yt_qry)
    pipulate.print_yt(yt)
    """

    service = google_service("youtubeAnalytics", "v2")
    return service.reports().query(**qry).execute()


def ga_v3(qry):
    service = google_service("analytics", "v3")
    return service.data().ga().get(**qry).execute()


def print_gsc(response):
    """Prints out a response table.
    Each row contains key(s), clicks, impressions, CTR, and average position.
    Args:
      response: The server response to be printed as a table.
    """

    if "rows" not in response:
        print("Empty response")
        return

    rows = response["rows"]
    row_format = "{:<20}" + "{:>20}" * 4
    print(row_format.format("Keys", "Clicks", "Impressions", "CTR", "Position"))
    for row in rows:
        keys = ""
        # Keys are returned only if one or more dimensions are requested.
        if "keys" in row:
            keys = ",".join(row["keys"]).encode("utf-8").decode()
        print(
            row_format.format(
                keys, row["clicks"], row["impressions"], row["ctr"], row["position"]
            )
        )


def print_ga(response):
    for report in response.get("reports", []):
        columnHeader = report.get("columnHeader", {})
        dimensionHeaders = columnHeader.get("dimensions", [])
        metricHeaders = columnHeader.get("metricHeader", {}).get(
            "metricHeaderEntries", []
        )
        rows = report.get("data", {}).get("rows", [])

        for row in rows:
            dimensions = row.get("dimensions", [])
            dateRangeValues = row.get("metrics", [])

            for header, dimension in zip(dimensionHeaders, dimensions):
                print(header + ": " + dimension)

            for i, values in enumerate(dateRangeValues):
                print("        Date range index: " + str(i))
                for metric, value in zip(metricHeaders, values.get("values")):
                    print("        " + metric.get("name") + ": " + value)


def list_ga(ga):
    returnme = [0, 0]
    if ga:
        for reports in ga:
            for item in ga[reports]:
                if "rows" in item["data"]:
                    for row in item["data"]["rows"]:
                        for metric in row["metrics"]:
                            for value in metric:
                                returnme = metric[value]
                                break
    return returnme


def print_yt(results):
    # Print headers.
    output = []
    for header in results.get("columnHeaders"):
        output.append("%30s" % header.get("name"))
    print("".join(output))

    # Print rows.
    if results.get("rows", []):
        for row in results.get("rows"):
            output = ["%30s" % cell for cell in row]
            print("".join(output))
    else:
        print("No Results Found")


def ga_accounts(everything=False):
    service = google_service("analytics", "v3")
    accounts = service.management().accounts().list().execute()
    if everything:
        return accounts
    else:
        if accounts.get("items"):
            alist = []
            for item in accounts["items"]:
                alist.append((item["name"], item["id"]))
            return alist


def ga_properties(account, everything=False):
    service = google_service("analytics", "v3")
    properties = service.management().webproperties().list(accountId=account).execute()
    if everything:
        return properties
    else:
        if properties.get("items"):
            alist = []
            for item in properties["items"]:
                alist.append((item["name"], item["id"]))
            return alist


def ga_profiles(account, property_id, everything=False):
    service = google_service("analytics", "v3")
    profiles = (
        service.management()
        .profiles()
        .list(accountId=account, webPropertyId=property_id)
        .execute()
    )
    if everything:
        return profiles
    else:
        if profiles.get("items"):
            alist = []
            for item in profiles["items"]:
                alist.append((item["name"], item["id"]))
            return alist


def ga_hostname(gaid):
    query = {
        "reportRequests": [
            {
                "dateRanges": [{"endDate": "yesterday", "startDate": "yesterday"}],
                "dimensions": [{"name": "ga:hostname"}],
                "metrics": [{"alias": "", "expression": "ga:pageviews"}],
                "orderBys": [{"fieldName": "ga:pageviews", "sortOrder": "DESCENDING"}],
                "samplingLevel": "SMALL",
                "viewId": str(gaid),
            }
        ]
    }
    try:
        result = ga(query)
        hostname = result["reports"][0]["data"]["rows"][0]["dimensions"][0]
    except:
        hostname = "Unknown"
    return hostname


def ga_everything():
    acts = {}
    accounts = ga_accounts()
    for account in accounts:
        print()
        print("Account: %s %s" % account)
        key, val = account
        acts[account] = []
        properties = ga_properties(account[1])
        if properties:
            for prop in properties:
                print("%sProperty: %s" % (" " * 4, prop))
                profiles = ga_profiles(account[1], prop[1])
                if profiles:
                    plist = []
                    for profile in profiles:
                        print("%sProfile: %s" % (" " * 8, profile))
                        plist.append(profile)
                    acts[account].append({prop: plist})
    return acts


def organic_traffic(view_id, start_date, end_date):
    if type(view_id) != str:
        view_id = str(view_id)
    ga_qry = {
        "reportRequests": [
            {
                "dateRanges": [{"endDate": end_date, "startDate": start_date}],
                "dimensions": [{"name": "ga:segment"}],
                "metrics": [
                    {"expression": "ga:users"},
                    {"expression": "ga:newusers"},
                    {"expression": "ga:bouncerate"},
                    {"expression": "ga:pageviewsPerSession"},
                    {"expression": "ga:avgSessionDuration"},
                ],
                "pageSize": "1",
                "samplingLevel": "SMALL",
                "segments": [{"segmentId": "gaid::-5"}],
                "viewId": view_id,
            }
        ]
    }
    return ga(ga_qry)


def organic_traffic_v3(gaid, start_date, end_date):
    ga_qry = {
        "ids": "ga:%s" % gaid,
        "start_date": start_date,
        "end_date": end_date,
        "metrics": "ga:users,ga:newusers,ga:bouncerate,ga:pageviewsPerSession,ga:avgSessionDuration",
        "segment": "gaid::-5",
        "max_results": "1",
    }
    return ga_v3(ga_qry)


def examples():
    print("This is a Google Analytics API V4 example. You can copy and paste")
    print("the code into Jupyter Notebook and put 'pipulate.' before ga(ga_qry)")
    print("and it will be available.")
    print()
    print(getsource(organic_traffic))
    print()
    print("This is a Google Analytics API V3 example.")
    print()
    print(getsource(organic_traffic_v3))


def api_date(a_datetime, time=False):
    """Return datetime string in Google API friendly format."""

    if time:
        return "{0:%Y-%m-%d %H:%M:%S}".format(a_datetime)
    else:
        return "{0:%Y-%m-%d}".format(a_datetime)


def human_date(a_datetime, time=False):
    """Return datetime object as American-friendly string."""

    if time:
        return "{0:%m/%d/%Y %H:%M:%S}".format(a_datetime)
    else:
        return "{0:%m/%d/%Y}".format(a_datetime)


def email():
    """Return email given provided Google OAuth account."""
    service = build("oauth2", "v2", credentials=credentials)
    user_document = service.userinfo().get().execute()
    return user_document["email"]


class Unbuffered(object):
    """Provides more real-time streaming in Jupyter Notebook"""

    def __init__(self, stream):
        self.stream = stream

    def write(self, data):
        self.stream.write(data)
        self.stream.flush()

    def __getattr__(self, attr):
        return getattr(self.stream, attr)


credentials = ohawf.get()
gspread_authorized = gspread.authorize(credentials)

print('Get started with: pipulate.sheet("Insert your GSheet key or URL")')
print("For help, run: pipulate.help()")

stdout = Unbuffered(stdout)
