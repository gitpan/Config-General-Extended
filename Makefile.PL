use ExtUtils::MakeMaker;


WriteMakefile(
	      'NAME'	     => 'Config::General::Extended',
	      'VERSION_FROM' => 'Extended.pm', # finds $VERSION
	      'PREREQ_PM'    => { 'Config::General' => "1.18" }
);
