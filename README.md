# dash-docset-idapython

![screenshot](/screenshot.png)

View idapython docs in the [dash](https://kapeli.com/dash)/[zeal](https://github.com/zealdocs/zeal) offline docset browser.

## Dash/Zeal Feeds

To use, you can add the following feeds in Dash/Zeal:
- Fri Oct 11 15:05:11 2019: `https://raw.githubusercontent.com/ilyakava/dash-docset-idapython/master/idapython-10.11.19.xml`

Or download archived docsets as releases [here](https://github.com/ilyakava/dash-docset-idapython/releases) and use the local method below.

## Steps to generate the docset

+ Install [dashing](https://github.com/technosophos/dashing): `go get -u github.com/technosophos/dashing`
+ `pip install python-magic beautifulsoup4 lxml`
+ `cd THIS_REPO`
+ `wget -nc -np --domains=www.hex-rays.com -e robots=off --adjust-extension -r 'https://www.hex-rays.com/products/ida/support/idapython_docs/'`
+ `mv www.hex-rays.com/products/ida/support/idapython_docs ./`
+ `cp dashing.json icon*.png idapython_docs`
+ `./preprocess.sh`
+ `cd idapython_docs`
+ `$GOPATH/bin/dashing build` will give you a `idapython.docset` folder.

This `dashing.json` only parses Class, Module, and Function names.
Feel free to add more features and contribute!

## Installing a local docset into Zeal

+ Make an archive: `tar --exclude='.DS_Store' -cvzf idapython.docset.tgz idapython.docset`
+ Make an xml file `idapython.docset.xml` whose name will be the docset display name in Zeal. Its contents should be:
```
<entry>
    <version>10.11.19</version>
    <url>file:///path/to/idapython.docset.tgz</url>
</entry>
```
+ In Zeal go to Tools > Docsets > Add feed and for url type 'file:///path/to/idapython.docset.xml'
