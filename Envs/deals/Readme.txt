The script uses BeautifulSoup4 to scrape deal information off of the Slickdeals.com frontpage.
Deals are appended to a dictionary in a JSON file located in the same folder as the deals.py script.

Example uses:

>>> import deals
>>> d = deals.SlickObj()
>>> d.update()
>>> d.top(x=10, days=30)
>>> d.search('ps4')