#!/usr/bin/env ruby

class IO 
  def read_word
    buffer = ""

    while a = self.read(1)
      unless a.match(/\s/)
        buffer += a
        break
      end
    end

    while a = self.read(1)
      unless a.match(/\s/)
        buffer += a
      else
        break
      end
    end

    unless buffer.empty?
      buffer
    else
      nil
    end
  end
end

$stack = []

$words = {}

$word = nil

def start
  while $word = STDIN.read_word
    if apply?
      apply
    else
      debug
    end
  end
end

def apply?
  $words[$word]
end

def apply
  $words[$word].call
end

def debug
  puts "#{$word} ?"
end
