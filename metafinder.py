import sys
from html.parser import HTMLParser

inp = sys.stdin.read()

class MyHTMLParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        if tag == "meta":
            attrs = dict(attrs)

            if "property" in attrs:
                if attrs["property"] in ("og:url", "og:title", "og:description"):
                    print(repr(attrs["content"]))
        pass

    def handle_endtag(self, tag):
        if tag == "head":
            1/0

    def handle_data(self, data):
        pass

parser = MyHTMLParser()


try:
    parser.feed(inp)
except:
    pass


