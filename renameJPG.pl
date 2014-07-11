use strict;
use warnings;

use File::Path qw(make_path remove_tree);
use File::Fetch;
use FileHandle; 
use FindBin qw($Bin);

require 'hydlib.pl';
require 'hydtim.pl';

=head1 VERSION

    version 0.0.1

=head1 SYNOPSIS

    A simple script using Hydstra pl tools to rename the extensions of image documents from jpeg to jpg.

=head1 AUTHOR

    Mr Sholto Maud <sholto.maud@gmail.com>    
    
=cut



main: { 
   
  my @documents = GetFileList('\.jp*','',0,'S:\\Hydstra\\temp\\baseline assessments\\AGECONSULTANTS\\2014-07-08');
  
  
  Prt('-P',HashDump(\@documents)."\n"); 
  
  foreach ( @documents ){
    my @doc = split('\.',$_);
    
    my $extension = $doc[1];
    
    Prt('-P',"extension [$extension]");
    
    $extension = ( $extension =~ m{^jp}i ) ? 'jpg':$extension ;
    
    my $newdoc = ( $extension =~ m{^jp}i ) ? $doc[0].'.jpg': $doc[0].'.'.$extension;
    
    Prt('-P',"olddoc [$_] newdoc [$newdoc]");
    
    rename ($_ , $newdoc);
    
  }
}