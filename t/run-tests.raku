#!/usr/bin/env raku

use lib 'lib';

my @test-files = 't'.IO.dir(test => *.ends-with('.t')).sort;

my $total-tests = 0;
my $failed-tests = 0;

for @test-files -> $test-file {
    say "\n" ~ "=" x 60;
    say "Running $test-file";
    say "=" x 60;
    
    my $proc = run 'raku', '-Ilib', $test-file, :out, :err;
    my $output = $proc.out.slurp(:close);
    my $errors = $proc.err.slurp(:close);
    
    print $output;
    print $errors if $errors;
    
    # Parse TAP output
    for $output.lines -> $line {
        if $line ~~ /^'1..'(\d+)/ {
            $total-tests += $0.Int;
        }
        elsif $line ~~ /^'not ok'/ {
            $failed-tests++;
        }
    }
}

say "\n" ~ "=" x 60;
say "TEST SUMMARY";
say "=" x 60;
say "Total tests: $total-tests";
say "Failed tests: $failed-tests";
say "Passed tests: ", $total-tests - $failed-tests;
say "Success rate: ", sprintf("%.1f%%", (($total-tests - $failed-tests) / $total-tests) * 100) if $total-tests > 0;

exit($failed-tests > 0 ?? 1 !! 0);