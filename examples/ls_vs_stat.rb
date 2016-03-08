#!/usr/bin/ruby
# ls_vs_stat.rb - comparing `ls <dir>/*` to `stat <dir>/*`

require_relative File.expand_path(sprintf('%s/../lib/bnchmrkr', File.dirname(__FILE__)))

dir = sprintf('%s/*', ENV['HOME'])

tester = Bnchmrkr.new({
    :ls   => lambda { `ls #{dir}` },
    :stat => lambda { `stat #{dir}` },
  },
  10,
)

tester.benchmark!

{
  'fastest by type(ls)'    => tester.fastest_by_type(:ls),
  'fastest overall'        => tester.fastest_overall,
  'slowest by type(stat)'  => tester.slowest_by_type(:stat),
  'slowest_overall'        => tester.slowest_overall,
  'is_faster?(:ls, :stat)' => tester.is_faster_by_type?(:ls, :stat),
  'is_slower?(:ls, :stat)' => tester.is_slower_by_type?(:ls, :stat),
}.each_pair do |name, result|
  puts sprintf('  %#15s => %s%s', name, result, "\n")
end

puts tester