package Gyazoninngenn::Web;

use strict;
use warnings;
use utf8;
use Kossy;
use File::Slurp;
use FindBin;
use Digest::MD5 qw( md5_hex );

get '/' => sub {
    my ( $self, $c )  = @_;
    $c->render('index.tx');
};

# http://mattn.kaoriya.net/software/lang/perl/20110719022443.htm
post '/' => sub {
    my ( $self, $c )  = @_;
    my $imagedata = $c->req->param('imagedata');
    $imagedata = read_file($c->req->uploads->{imagedata}->path, binmode => ':raw') unless $imagedata;
    my $filename = sprintf( "image/%s.png", md5_hex($imagedata) );
    my $filepath = sprintf( "%s/public/%s", $FindBin::Bin, $filename );
    write_file($filepath, {binmode => ':raw'}, $imagedata);
    my $url = $c->req->base() . $filename;
    return $c->response(200, ['Content-Type' => 'text/plain'], [$url]);
};

1;

