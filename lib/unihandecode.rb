# -*- coding: utf-8 -*-

#license 'GPL 3'
#copyright '2010-2014, Hiroshi Miura <miurahr@linux.com>'
#
#Decode unicode text to an ASCII representation of the text. 
#Translate unicode characters to ASCII.
#
#inspired from John's unidecode library.
#Copyright(c) 2009, John Schember
#
#Tranliterate the string from unicode characters to ASCII in Chinese and others.
#

require "unicode"
require "unihandecode/unidecoder"

module Unihandecode
  class Unihandecoder
    include Unidecoder

    attr_reader: preferred_encoding

    def initilize(lang="zh")
      end
      case lang
      when "ja"
        @decoder = Jadecoder.new
      when "kr"
        @decoder = Krdecoder.new
      when "vn"
        @decoder = Vndecoder.new
      else #zh and others
        @decoder = Unidecoder.new
      end
    end

    def decode(text)
      @decoder.decode(Unicode::normalize_C(text.encode!(Encode::UTF_8)))
    end
  end
end
