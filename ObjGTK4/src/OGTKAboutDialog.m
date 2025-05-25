/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAboutDialog.h"

#import "OGTKWidget.h"

@implementation OGTKAboutDialog

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ABOUT_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ABOUT_DIALOG);
	return gObjectClass;
}

+ (instancetype)aboutDialog
{
	GtkAboutDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_about_dialog_new(), GTK_TYPE_ABOUT_DIALOG, GtkAboutDialog);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAboutDialog* wrapperObject;
	@try {
		wrapperObject = [[OGTKAboutDialog alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAboutDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ABOUT_DIALOG, GtkAboutDialog);
}

- (void)addCreditSectionWithSectionName:(OFString*)sectionName people:(const char**)people
{
	gtk_about_dialog_add_credit_section((GtkAboutDialog*)[self castedGObject], [sectionName UTF8String], people);
}

- (const char* const*)artists
{
	const char* const* returnValue = (const char* const*)gtk_about_dialog_get_artists((GtkAboutDialog*)[self castedGObject]);

	return returnValue;
}

- (const char* const*)authors
{
	const char* const* returnValue = (const char* const*)gtk_about_dialog_get_authors((GtkAboutDialog*)[self castedGObject]);

	return returnValue;
}

- (OFString*)comments
{
	const char* gobjectValue = gtk_about_dialog_get_comments((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)copyright
{
	const char* gobjectValue = gtk_about_dialog_get_copyright((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const char* const*)documenters
{
	const char* const* returnValue = (const char* const*)gtk_about_dialog_get_documenters((GtkAboutDialog*)[self castedGObject]);

	return returnValue;
}

- (OFString*)license
{
	const char* gobjectValue = gtk_about_dialog_get_license((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkLicense)licenseType
{
	GtkLicense returnValue = (GtkLicense)gtk_about_dialog_get_license_type((GtkAboutDialog*)[self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)logo
{
	GdkPaintable* returnValue = (GdkPaintable*)gtk_about_dialog_get_logo((GtkAboutDialog*)[self castedGObject]);

	return returnValue;
}

- (OFString*)logoIconName
{
	const char* gobjectValue = gtk_about_dialog_get_logo_icon_name((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)programName
{
	const char* gobjectValue = gtk_about_dialog_get_program_name((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)systemInformation
{
	const char* gobjectValue = gtk_about_dialog_get_system_information((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)translatorCredits
{
	const char* gobjectValue = gtk_about_dialog_get_translator_credits((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)version
{
	const char* gobjectValue = gtk_about_dialog_get_version((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)website
{
	const char* gobjectValue = gtk_about_dialog_get_website((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)websiteLabel
{
	const char* gobjectValue = gtk_about_dialog_get_website_label((GtkAboutDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)wrapLicense
{
	bool returnValue = (bool)gtk_about_dialog_get_wrap_license((GtkAboutDialog*)[self castedGObject]);

	return returnValue;
}

- (void)setArtists:(const char**)artists
{
	gtk_about_dialog_set_artists((GtkAboutDialog*)[self castedGObject], artists);
}

- (void)setAuthors:(const char**)authors
{
	gtk_about_dialog_set_authors((GtkAboutDialog*)[self castedGObject], authors);
}

- (void)setComments:(OFString*)comments
{
	gtk_about_dialog_set_comments((GtkAboutDialog*)[self castedGObject], [comments UTF8String]);
}

- (void)setCopyright:(OFString*)copyright
{
	gtk_about_dialog_set_copyright((GtkAboutDialog*)[self castedGObject], [copyright UTF8String]);
}

- (void)setDocumenters:(const char**)documenters
{
	gtk_about_dialog_set_documenters((GtkAboutDialog*)[self castedGObject], documenters);
}

- (void)setLicense:(OFString*)license
{
	gtk_about_dialog_set_license((GtkAboutDialog*)[self castedGObject], [license UTF8String]);
}

- (void)setLicenseType:(GtkLicense)licenseType
{
	gtk_about_dialog_set_license_type((GtkAboutDialog*)[self castedGObject], licenseType);
}

- (void)setLogo:(GdkPaintable*)logo
{
	gtk_about_dialog_set_logo((GtkAboutDialog*)[self castedGObject], logo);
}

- (void)setLogoIconName:(OFString*)iconName
{
	gtk_about_dialog_set_logo_icon_name((GtkAboutDialog*)[self castedGObject], [iconName UTF8String]);
}

- (void)setProgramName:(OFString*)name
{
	gtk_about_dialog_set_program_name((GtkAboutDialog*)[self castedGObject], [name UTF8String]);
}

- (void)setSystemInformation:(OFString*)systemInformation
{
	gtk_about_dialog_set_system_information((GtkAboutDialog*)[self castedGObject], [systemInformation UTF8String]);
}

- (void)setTranslatorCredits:(OFString*)translatorCredits
{
	gtk_about_dialog_set_translator_credits((GtkAboutDialog*)[self castedGObject], [translatorCredits UTF8String]);
}

- (void)setVersion:(OFString*)version
{
	gtk_about_dialog_set_version((GtkAboutDialog*)[self castedGObject], [version UTF8String]);
}

- (void)setWebsite:(OFString*)website
{
	gtk_about_dialog_set_website((GtkAboutDialog*)[self castedGObject], [website UTF8String]);
}

- (void)setWebsiteLabel:(OFString*)websiteLabel
{
	gtk_about_dialog_set_website_label((GtkAboutDialog*)[self castedGObject], [websiteLabel UTF8String]);
}

- (void)setWrapLicense:(bool)wrapLicense
{
	gtk_about_dialog_set_wrap_license((GtkAboutDialog*)[self castedGObject], wrapLicense);
}


@end