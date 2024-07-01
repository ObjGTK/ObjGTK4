/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAboutDialog.h"

#import "OGTKWidget.h"

@implementation OGTKAboutDialog

- (instancetype)init
{
	GtkAboutDialog* gobjectValue = GTK_ABOUT_DIALOG(gtk_about_dialog_new());

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkAboutDialog*)castedGObject
{
	return GTK_ABOUT_DIALOG([self gObject]);
}

- (void)addCreditSectionWithSectionName:(OFString*)sectionName people:(const char**)people
{
	gtk_about_dialog_add_credit_section([self castedGObject], [sectionName UTF8String], people);
}

- (const char* const*)artists
{
	const char* const* returnValue = gtk_about_dialog_get_artists([self castedGObject]);

	return returnValue;
}

- (const char* const*)authors
{
	const char* const* returnValue = gtk_about_dialog_get_authors([self castedGObject]);

	return returnValue;
}

- (OFString*)comments
{
	const char* gobjectValue = gtk_about_dialog_get_comments([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)copyright
{
	const char* gobjectValue = gtk_about_dialog_get_copyright([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const char* const*)documenters
{
	const char* const* returnValue = gtk_about_dialog_get_documenters([self castedGObject]);

	return returnValue;
}

- (OFString*)license
{
	const char* gobjectValue = gtk_about_dialog_get_license([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkLicense)licenseType
{
	GtkLicense returnValue = gtk_about_dialog_get_license_type([self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)logo
{
	GdkPaintable* returnValue = gtk_about_dialog_get_logo([self castedGObject]);

	return returnValue;
}

- (OFString*)logoIconName
{
	const char* gobjectValue = gtk_about_dialog_get_logo_icon_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)programName
{
	const char* gobjectValue = gtk_about_dialog_get_program_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)systemInformation
{
	const char* gobjectValue = gtk_about_dialog_get_system_information([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)translatorCredits
{
	const char* gobjectValue = gtk_about_dialog_get_translator_credits([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)version
{
	const char* gobjectValue = gtk_about_dialog_get_version([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)website
{
	const char* gobjectValue = gtk_about_dialog_get_website([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)websiteLabel
{
	const char* gobjectValue = gtk_about_dialog_get_website_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)wrapLicense
{
	bool returnValue = gtk_about_dialog_get_wrap_license([self castedGObject]);

	return returnValue;
}

- (void)setArtists:(const char**)artists
{
	gtk_about_dialog_set_artists([self castedGObject], artists);
}

- (void)setAuthors:(const char**)authors
{
	gtk_about_dialog_set_authors([self castedGObject], authors);
}

- (void)setComments:(OFString*)comments
{
	gtk_about_dialog_set_comments([self castedGObject], [comments UTF8String]);
}

- (void)setCopyright:(OFString*)copyright
{
	gtk_about_dialog_set_copyright([self castedGObject], [copyright UTF8String]);
}

- (void)setDocumenters:(const char**)documenters
{
	gtk_about_dialog_set_documenters([self castedGObject], documenters);
}

- (void)setLicense:(OFString*)license
{
	gtk_about_dialog_set_license([self castedGObject], [license UTF8String]);
}

- (void)setLicenseType:(GtkLicense)licenseType
{
	gtk_about_dialog_set_license_type([self castedGObject], licenseType);
}

- (void)setLogo:(GdkPaintable*)logo
{
	gtk_about_dialog_set_logo([self castedGObject], logo);
}

- (void)setLogoIconName:(OFString*)iconName
{
	gtk_about_dialog_set_logo_icon_name([self castedGObject], [iconName UTF8String]);
}

- (void)setProgramName:(OFString*)name
{
	gtk_about_dialog_set_program_name([self castedGObject], [name UTF8String]);
}

- (void)setSystemInformation:(OFString*)systemInformation
{
	gtk_about_dialog_set_system_information([self castedGObject], [systemInformation UTF8String]);
}

- (void)setTranslatorCredits:(OFString*)translatorCredits
{
	gtk_about_dialog_set_translator_credits([self castedGObject], [translatorCredits UTF8String]);
}

- (void)setVersion:(OFString*)version
{
	gtk_about_dialog_set_version([self castedGObject], [version UTF8String]);
}

- (void)setWebsite:(OFString*)website
{
	gtk_about_dialog_set_website([self castedGObject], [website UTF8String]);
}

- (void)setWebsiteLabel:(OFString*)websiteLabel
{
	gtk_about_dialog_set_website_label([self castedGObject], [websiteLabel UTF8String]);
}

- (void)setWrapLicense:(bool)wrapLicense
{
	gtk_about_dialog_set_wrap_license([self castedGObject], wrapLicense);
}


@end