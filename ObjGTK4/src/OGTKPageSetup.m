/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPageSetup.h"

@implementation OGTKPageSetup

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PAGE_SETUP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)pageSetup
{
	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new(), GtkPageSetup, GtkPageSetup);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKPageSetup* wrapperObject;
	@try {
		wrapperObject = [[OGTKPageSetup alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pageSetupFromFileWithFileName:(OFString*)fileName
{
	GError* err = NULL;

	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new_from_file([fileName UTF8String], &err), GtkPageSetup, GtkPageSetup);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGTKPageSetup* wrapperObject;
	@try {
		wrapperObject = [[OGTKPageSetup alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pageSetupFromGvariant:(GVariant*)variant
{
	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new_from_gvariant(variant), GtkPageSetup, GtkPageSetup);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKPageSetup* wrapperObject;
	@try {
		wrapperObject = [[OGTKPageSetup alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pageSetupFromKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	GError* err = NULL;

	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new_from_key_file(keyFile, [groupName UTF8String], &err), GtkPageSetup, GtkPageSetup);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGTKPageSetup* wrapperObject;
	@try {
		wrapperObject = [[OGTKPageSetup alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPageSetup*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkPageSetup, GtkPageSetup);
}

- (OGTKPageSetup*)copy
{
	GtkPageSetup* gobjectValue = gtk_page_setup_copy([self castedGObject]);

	OGTKPageSetup* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (double)bottomMarginWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_bottom_margin([self castedGObject], unit);

	return returnValue;
}

- (double)leftMarginWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_left_margin([self castedGObject], unit);

	return returnValue;
}

- (GtkPageOrientation)orientation
{
	GtkPageOrientation returnValue = (GtkPageOrientation)gtk_page_setup_get_orientation([self castedGObject]);

	return returnValue;
}

- (double)pageHeightWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_page_height([self castedGObject], unit);

	return returnValue;
}

- (double)pageWidthWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_page_width([self castedGObject], unit);

	return returnValue;
}

- (double)paperHeightWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_paper_height([self castedGObject], unit);

	return returnValue;
}

- (GtkPaperSize*)paperSize
{
	GtkPaperSize* returnValue = (GtkPaperSize*)gtk_page_setup_get_paper_size([self castedGObject]);

	return returnValue;
}

- (double)paperWidthWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_paper_width([self castedGObject], unit);

	return returnValue;
}

- (double)rightMarginWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_right_margin([self castedGObject], unit);

	return returnValue;
}

- (double)topMarginWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_top_margin([self castedGObject], unit);

	return returnValue;
}

- (bool)loadFileWithFileName:(OFString*)fileName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_page_setup_load_file([self castedGObject], [fileName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)loadKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_page_setup_load_key_file([self castedGObject], keyFile, [groupName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setBottomMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_bottom_margin([self castedGObject], margin, unit);
}

- (void)setLeftMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_left_margin([self castedGObject], margin, unit);
}

- (void)setOrientation:(GtkPageOrientation)orientation
{
	gtk_page_setup_set_orientation([self castedGObject], orientation);
}

- (void)setPaperSize:(GtkPaperSize*)size
{
	gtk_page_setup_set_paper_size([self castedGObject], size);
}

- (void)setPaperSizeAndDefaultMargins:(GtkPaperSize*)size
{
	gtk_page_setup_set_paper_size_and_default_margins([self castedGObject], size);
}

- (void)setRightMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_right_margin([self castedGObject], margin, unit);
}

- (void)setTopMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_top_margin([self castedGObject], margin, unit);
}

- (bool)toFileWithFileName:(OFString*)fileName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_page_setup_to_file([self castedGObject], [fileName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GVariant*)toGvariant
{
	GVariant* returnValue = (GVariant*)gtk_page_setup_to_gvariant([self castedGObject]);

	return returnValue;
}

- (void)toKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	gtk_page_setup_to_key_file([self castedGObject], keyFile, [groupName UTF8String]);
}


@end