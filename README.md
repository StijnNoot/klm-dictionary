# KLM Dictionary (in XDXF & Apple formats)

## Installation

Download release. Unpack into `${HOME}/Library/Dictionaries/` (create directory if needed).

### Hints

1. In _Preferences_ of Dictionary.app you can drag the _KLM_ entry to the top to make it first priority.
2. You can _Look Up_ words from any place: force-push the word or control-click selected text. Then, in the contextual
   menu that appears, choose Look Up.

## Development

The source is in [XSXF format](https://github.com/soshial/xdxf_makedict/tree/master/format_standard) which is converted to
Apple Dictionary format with the help of [PyGlossary](https://github.com/ilius/pyglossary) and then slightly tuned
(see [build.sh](build.sh)).

NOTE: XDXF is not fully supported by PyGlossary, so be carefull – don't overcomplicate.

### Setup

Run `./setup.sh`, you'll need Python 3.

### Building

Run `./build.sh`.

You'll get sources for creating Apple Dictionary at `Dictionary/` and the result at `objects/KLM.dictionary`.

### Installing to User's Dictionaries

Run `./install.sh`.

### Resources

1. [Apple Dictionary Services Programming Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/DictionaryServicesProgGuide/prepare/prepare.html)
2. [Dictionary-Development-Kit copy on github](https://github.com/SebastianSzturo/Dictionary-Development-Kit)
3. [XDXF standart](https://github.com/soshial/xdxf_makedict/tree/master/format_standard).
