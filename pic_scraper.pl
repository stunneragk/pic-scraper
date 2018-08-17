use strict;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
my $input = $ARGV[0];
my $url = 'https://www.google.co.in/search?q=' . $input . '&tbm=isch';

$mech->get($url);

unless ($mech->success()) {
    print "We failed bros";
}
else {
    print "we boogie";
}

my @imgs = $mech->find_all_images();
my $i = 1;
foreach my $img (@imgs) {
    my $res = $mech->get($img->URI);
    my $content = $res->decoded_content;
    open my $fh, ">$i.jpg";
    binmode $fh;
    print $fh $content;
    $i++;
}
