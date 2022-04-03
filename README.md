# KLM Abbreviations, the macOs Dictionary

## Installation

See _Development > Building_ and _Installing to User's Dictionaries_ sections.

### Hinnts

1. In _Preferences_ of Dictionary.app you can drag the _KLM Abbreviations_ entry to the top to make it first priority.
2. You can _Look Up_ words from any place: force-push the word or control-click selected text. Then, in the contextual
   menu that appears, choose Look Up.

## Development

### Validating the Dictionary XML

Do `brew install jing-trang`, 

### Building

1. Copy https://github.com/SebastianSzturo/Dictionary-Development-Kit somewhere
2. Set env var `DICT_BUILD_TOOL_BIN` to point to `bin` folder there
3. Run `./build.sh`

### Installing to User's Dictionaries

1. Run `./install.sh`

### Resources

1. [Apple Dictionary Services Programming Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/DictionaryServicesProgGuide/prepare/prepare.html)
2. [Dictionary-Development-Kit copy on github](https://github.com/SebastianSzturo/Dictionary-Development-Kit)
