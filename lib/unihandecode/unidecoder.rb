# -*- coding: utf-8 -*-
#!/usr/bin/env ruby
#
#license 'GPL 3'
#copyright '2010-2013, Hiroshi Miura <miurahr@linux.com>'
#
#Decode unicode text to an ASCII representation of the text in Chinese. 
#Transliterate unicode characters to ASCII based on chinese pronounce.
#
#derived from John's unidecode library of python.
#
#Copyright(c) 2009, John Schember
#
#Based on the ruby unidecode gem (http://rubyforge.org/projects/unidecode/) which
#is based on the perl module Text::Unidecode
#(http://search.cpan.org/~sburke/Text-Unidecode-0.04/). More information about
#unidecode can be found at
#http://interglacial.com/~sburke/tpj/as_html/tpj22.html.
#
#The major differences between this implementation and others is it's written in
#python and it uses a single dictionary instead of loading the code group files
#as needed.
#
#
#Copyright (c) 2007 Russell Norris
#
#Permission is hereby granted, free of charge, to any person
#obtaining a copy of this software and associated documentation
#files (the "Software"), to deal in the Software without
#restriction, including without limitation the rights to use,
#copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the
#Software is furnished to do so, subject to the following
#conditions:
#
#The above copyright notice and this permission notice shall be
#included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
#OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
#HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#OTHER DEALINGS IN THE SOFTWARE.
#
#
#Copyright 2001, Sean M. Burke <sburke@cpan.org>, all rights reserved.
#
#The programs and documentation in this dist are distributed in the
#hope that they will be useful, but without any warranty; without even
#the implied warranty of merchantability or fitness for a particular
#purpose.
#
#This library is free software; you can redistribute it and/or modify
#it under the same terms as Perl itself.
#
module Unihandecode
  class Unidecoder
    accessor: codepoints

    def initilize
      @codepoints = {}
      load_codepoints('zh')
    end

    # Replace characters larger than 127 with their ASCII equivelent.
    def decode(text):
      text.gsub('[^\x00-\x7f]') {|x| replace_point(x.group)}
    end

    #Returns the replacement character or ? if none can be found.
    def replace_point(codepoint)
      # Split the unicode character xABCD into parts 0xAB and 0xCD.
      # 0xAB represents the group within CODEPOINTS to query and 0xCD
      # represents the position in the list of characters for the group.
      begin
        codepoints[code_group(codepoint)][grouped_point(codepoint)]
      except
            return ''
      end
    end

    # Find what group character is a part of.
    # Code groups withing CODEPOINTS take the form 'xAB'
    def code_group(character)
      'x%02x'%(character.ord >> 8)
    end

    # Return the location the replacement character is in the list for a
    # the group character is a part of.
    def grouped_point(character)
      character.ord & 255
    end

    private

    def load_codepoints(lang)
      ['unicodepoints.bz2', '%scodepoints.bz2'%lang].each do |fname|
        Bzip2::Reader.open(fname) do |f|
          dic = Marshal.load(f.read)
          @codepoints.merge!(dic)
        end
      end
    end
  end
end

