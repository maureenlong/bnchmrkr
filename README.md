# bnchmrkr

i hate the name too, [but..](https://github.com/chorankates/bnchmrkr/issues/1)

Bnchmrkr (Benchmarker) is a tool to help benchmark different method implementations

it is driven by [Benchmark](http://ruby-doc.org/stdlib-2.0.0/libdoc/benchmark/rdoc/Benchmark.html)

## usage

### pre-built gem installation (stable)

[![Gem Version](https://badge.fury.io/rb/bnchmrkr.png)](https://rubygems.org/gems/bnchmrkr)

```sh
gem install bnchmrkr
irb
...
irb(main):001:0> require 'bnchmrkr'
=> true
```

### from-source installation (latest)

[![build status](https://travis-ci.org/chorankates/bnchmrkr.svg)](https://travis-ci.org/chorankates/bnchmrkr)

```sh
git clone https://github.com/chorankates/bnchmrkr.git
cd bnchmrkr
rake clean build
gem install pkg/bnchmrkr*.gem
irb
...
irb(main):001:0> require 'bnchmrkr'
=> true
```

## examples

```rb
tester = Bnchmrkr.new({
  :count_to_1k   => lambda { 1.upto(1000).each   { |i| i } },
  :count_to_5k   => lambda { 1.upto(5000).each   { |i| i } },
  :count_to_10k  => lambda { 1.upto(10000).each  { |i| i } },
  :count_to_50k  => lambda { 1.upto(50000).each  { |i| i } },
  :count_to_100k => lambda { 1.upto(100000).each { |i| i } },
}, 1000)

tester.benchmark!

puts tester
```

```
$ ruby examples/ls_vs_stat.rb
  fastest by type(ls) => 0.005704
  fastest overall => {:name=>:ls, :measure=>0.005704}
  slowest by type(stat) => 0.076243
  slowest_overall => {:name=>:stat, :measure=>0.076243}
  is_faster?(:ls, :stat) => true
  is_slower?(:ls, :stat) => false
ls:
          fastest => 0.005704
             mean => 0.008375
           median => 0.006715
          slowest => 0.024187
            total => 0.083754
stat:
          fastest => 0.061403
             mean => 0.069956
           median => 0.073952
          slowest => 0.076243
            total => 0.699563
overall:
          fastest => ls [0.005704]
          slowest => stat [0.076243]
```

## instance methods
```
  benchmark!
  count
  faster_by
  fastest_by_type
  fastest_overall
  is_faster?
  is_slower?
  results
  slowest_by_type
  slowest_overall
```