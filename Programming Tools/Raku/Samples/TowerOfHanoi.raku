multi sub hanoi(0, $, $, $) { }                         # No disk, so do not do anything
multi sub hanoi($n, $a = 'A', $b = 'B', $c = 'C') {     # Start with $n disks and three pegs A, B, C
    hanoi $n - 1, $a, $c, $b;                           # firstly move top $n - 1 disks from A to B
    say "Move disk $n from peg $a to peg $c";           # then move last disk from A to C
    hanoi $n - 1, $b, $a, $c;                           # lastly move $n - 1 disks from B to C
}
