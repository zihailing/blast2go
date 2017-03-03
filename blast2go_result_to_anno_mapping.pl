#!/usr/bin/perl
use strict; use warnings;
use FileHandle;

my($result_file, $GO_file, $anno_file) = @ARGV;
die "Please input <blast2go_result.file><GO><anno>!" if(@ARGV != 3);
my $in = FileHandle->new("< $result_file");
my $out_GO = FileHandle->new("> $GO_file");
my $out_anno = FileHandle->new("> $anno_file");

my $protein_name="protein";
my $GO_term = "GO_term";
while(<$in>){
        chomp;
        if($_ =~ /GO:/){
                my @array = split(/\t/,$_);
                if($protein_name eq $array[0]){
                        $GO_term =$GO_term.",". $array[1];
                }else{
                        print $out_GO "$protein_name\t$GO_term\n";
                        $protein_name=$array[0];
                        $GO_term = $array[1];
                        my $anno = $array[2];
                        print $out_anno "$protein_name\t$anno\n";
                }
        }
}
