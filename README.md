# Unihandecode

 [![travis-ci](https://secure.travis-ci.org/miurahr/unihandecode.rb.png)](https://secure.travis-ci.org/miurahr/unihandecode.rb)
 [![Downloads]([![Gem Version](https://badge.fury.io/rb/unihandecode.png)](http://badge.fury.io/rb/unihandecode)]

ASCII transliterations of Unicode text that recognize CJKV complex charactors


EXAMPLE USE
-----------

 You can run it on Ruby 1.9.x:

        require unihandecode
        d = unihandecode::Unihandecoder.new (lang='zh')
        print d.decode(u"\u660e\u5929\u660e\u5929\u7684\u98ce\u5439")

        # That prints: Ming Tian Ming Tian De Feng Chui 

        u = unihandecode::Unihandecoder.new (lang='ja')
        print u.decode(
            u'\u660e\u65e5\u306f\u660e\u65e5\u306e\u98a8\u304c\u5439\u304f')

        # That prints: Ashita ha Ashita no Kaze ga Fuku

 There are some other examples in tests/basic.rb.


DESCRIPTION
-----------

 It often happens that you have non-Roman text data in Unicode, but
 you can't display it -- usually because you're trying to show it
 to a user via an application that doesn't support Unicode, or
 because the fonts you need aren't accessible. You could represent
 the Unicode characters as "???????" or "\15BA\15A0\1610...", but
 that's nearly useless to the user who actually wants to read what
 the text says.

 What Unihandecode provides is a function, 'decode(...)' that
 takes Unicode data and tries to represent it in ASCII characters 
 (i.e., the universally displayable characters between 0x00 and 0x7F). 
 The representation is almost always an attempt at *transliteration* 
 -- i.e., conveying, in Roman letters, the pronunciation expressed by 
 the text in some other writing system. (See the example above)

 These are same meaning in both language in example above.
 "明天明天的风吹" for Chinese and "明日は明日の風が吹く" for Japanese.
 The character "明" is converted "Ming" in Chinese. "明日" is converted
 "Ashita" but single charactor "明" will be converted "Mei" in Japanese.


REQUIREMENTS
------------



INSTALLATION
------------

 You install Unihandecode by running these commands:

        rake clean
        rake
        rake install

BUILD
------

 To build gem package;

        rake gem 

TEST
------

 To do spec test, run

        rake spec


LIMITATION
----------


SUPPORT
--------

 Questions, bug reports, useful code bits, and suggestions for
 Unihandecode are handled on github.com/miurahr/unihandecode.rb


AVAILABILITY
------------

 The latest version of Unihandecode is available from
 Git repository in github.com:

        https://github.com/miurahr/unihandecode.rb
 or
        https://rubygems.org/gems/unihandecode

COPYRIGHT
---------

Unicode Character Database:
 Date: 2010-09-23 09:29:58 UDT [JHJ]
 Unicode version: 6.0.0

 Copyright (c) 1991-2010 Unicode, Inc.
 For terms of use, see http://www.unicode.org/terms_of_use.html
 For documentation, see http://www.unicode.org/reports/tr44/

Unidecode's character transliteration tables:

Copyright 2001, Sean M. Burke <sburke@cpan.org>, all rights reserved.

Ruby code:

Copyright 2010-2014, Hiroshi Miura <miurahr@linux.com>


LICENSE
-------

Unihandecode
     Copyright 2010-2014 Hiroshi Miura

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
