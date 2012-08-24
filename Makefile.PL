use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Gyazoninngenn',
    VERSION_FROM  => 'lib/Gyazoninngenn.pm',
    PREREQ_PM     => {
        'Kossy' =>  '0.11',
        'File::Slurp' =>  '0',
        'Digest::MD5' =>  '0',
        'FindBin' =>  '0',
    },
    MIN_PERL_VERSION => '5.008001'
);

