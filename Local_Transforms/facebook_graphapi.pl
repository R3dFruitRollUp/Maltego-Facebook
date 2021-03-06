#!/usr/bin/env perl
#
# Please refer to the Plain Old Documentation (POD) at the end of this Perl Script for further information

my $VERSION = "0.0.5"; # May be required to upload script to CPAN i.e. http://www.cpan.org/scripts/submitting.html

sub split_maltego_additional_fields {

    my $maltego_additional_field_values = $_[0];
    my @maltego_additional_field_values =
      split( '#', $maltego_additional_field_values );

    my %maltego_additional_field_values;

    foreach (@maltego_additional_field_values) {
        my ( $key, $value ) = split( /=/, $_, 2 );
        $maltego_additional_field_values{"$key"} = "$value";
    }

    return %maltego_additional_field_values;
}

sub is_facebook_profileid_empty {
    $facebook_profileid = $_[0];
    $facebook_affiliation_name = $_[1];
    $transform_version = $_[2];
    if (!(defined ($facebook_profileid))) {
	    print("<MaltegoMessage>\n");
    	print("<MaltegoTransformResponseMessage>\n");
    	print("\t<UIMessages>\n");
    	print(
		"\t\t<UIMessage MessageType=\"Inform\">Facebook GraphAPI Profile Cover Image Local Transform v$transform_version</UIMessage>\n"
		);
		print("\t\t<UIMessage MessageType=\"PartialError\">No UID value for $facebook_affiliation_name</UIMessage>\n");
    	print("\t</UIMessages>\n");
    	print("\t<Entities>\n");
    	print("\t</Entities>\n");
    	print("</MaltegoTransformResponseMessage>\n");
    	print("</MaltegoMessage>\n");
    	exit 0;
    }
}

sub facebook_graphapi_down {
	# ISSUE Need to create an exception for when the Facebook User is not longer active 
    $facebook_graphapi_URL = $_[0];
    $transform_version = $_[1];
    $facebook_affiliation_name = $_[2];
    print("<MaltegoMessage>\n");
	print("<MaltegoTransformResponseMessage>\n");
	print("\t<UIMessages>\n");
	print(
	"\t\t<UIMessage MessageType=\"Inform\">Facebook GraphAPI Profile Cover Image Local Transform v$transform_version</UIMessage>\n"
	);
    print(
	"\t\t<UIMessage MessageType=\"FatalError\">Cannot contact Facebook GraphAPI for $facebook_affiliation_name</UIMessage>\n"
    );
    print STDERR "Cannot connect to $facebook_graphapi_URL\n";
    print("\t</UIMessages>\n");
    print("\t<Entities>\n");
    print("\t</Entities>\n");
    print("</MaltegoTransformResponseMessage>\n");
    print("</MaltegoMessage>\n");
    exit 0;
}

=head1 NAME

facebook_graphapi.pl

=head1 VERSION

This documentation refers facebook_graphapi.pl Alpha $VERSION

=head1 CONFIGURATION

Set the value(s) marked as #CONFIGURATION above this POD
    
=head1 USAGE

=head1 REQUIRED ARGUEMENTS
                
=head1 OPTIONAL ARGUEMENTS

=head1 DESCRIPTION

sub() {} for Maltego Transforms  

=head1 DEPENDENCIES

=head1 PREREQUISITES

=head1 COREQUISITES

=head1 INSTALLATION

=head1 OSNAMES

osx

=head1 SCRIPT CATEGORIES

Web

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

Please refer to the comments beginning with "TODO" in the Perl Code.

=head1 AUTHOR

Christian Heinrich

=head1 CONTACT INFORMATION

http://cmlh.id.au/contact

=head1 MAILING LIST

=head1 REPOSITORY

http://github.com/cmlh/

=head1 FURTHER INFORMATION AND UPDATES

http://cmlh.id.au/tagged/maltego

=head1 LICENSE AND COPYRIGHT

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 

Copyright 2012 Christian Heinrich
