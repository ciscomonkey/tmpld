# Changelog for pyrkube

## 0.2.2
### Feb 13, 2016
* Added dirname to globals to help with constructing relative paths to `file` global function.

## 0.2.1
### Feb 13, 2016
* Added embed template tag. Usage: `{% embed 'path/to/file' 'default', strip=True, strip_comments=False %}`
* Subclassed the `jinja2.Environment` in order to pass a filename context to templates created from strings, also passes filename as a global.
* Added the `FileSystemLoader` that adds the directories of the templates passed so that include's can be used in templates.
* Better handling of Kubernetes api client in instances where there is no Kubernetes server, or configuration cannot be determined.
* Fixed small bug when yaml frontmatter is specified but empty.
* Default logging level is now `WARNING`.
* Removed pycaps, lxml, and jsonpath-rw as hard requirements.
* Created the following extras for package: caps, xpath, jpath, all
* Added python wheel dist format support


## 0.2.0
### Jan 30, 2016
* Initial commit.
