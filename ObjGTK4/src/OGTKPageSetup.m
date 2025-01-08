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

- (instancetype)init
{
	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new(), GtkPageSetup, GtkPageSetup);

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

- (instancetype)initWithFileNameFromFile:(OFString*)fileName
{
	GError* err = NULL;

	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new_from_file([fileName UTF8String], &err), GtkPageSetup, GtkPageSetup);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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

- (instancetype)initWithVariantFromGvariant:(GVariant*)variant
{
	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new_from_gvariant(variant), GtkPageSetup, GtkPageSetup);

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

- (instancetype)initFromKeyFileWithKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	GError* err = NULL;

	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new_from_key_file(keyFile, [groupName UTF8String], &err), GtkPageSetup, GtkPageSetup);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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

- (double)bottomMargin:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_bottom_margin([self castedGObject], unit);

	return returnValue;
}

- (double)leftMargin:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_left_margin([self castedGObject], unit);

	return returnValue;
}

- (GtkPageOrientation)orientation
{
	GtkPageOrientation returnValue = (GtkPageOrientation)gtk_page_setup_get_orientation([self castedGObject]);

	return returnValue;
}

- (double)pageHeight:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_page_height([self castedGObject], unit);

	return returnValue;
}

- (double)pageWidth:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_page_width([self castedGObject], unit);

	return returnValue;
}

- (double)paperHeight:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_paper_height([self castedGObject], unit);

	return returnValue;
}

- (GtkPaperSize*)paperSize
{
	GtkPaperSize* returnValue = (GtkPaperSize*)gtk_page_setup_get_paper_size([self castedGObject]);

	return returnValue;
}

- (double)paperWidth:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_paper_width([self castedGObject], unit);

	return returnValue;
}

- (double)rightMargin:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_right_margin([self castedGObject], unit);

	return returnValue;
}

- (double)topMargin:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_top_margin([self castedGObject], unit);

	return returnValue;
}

- (bool)loadFile:(OFString*)fileName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_page_setup_load_file([self castedGObject], [fileName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)loadKeyFileWithKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_page_setup_load_key_file([self castedGObject], keyFile, [groupName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setBottomMarginWithMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_bottom_margin([self castedGObject], margin, unit);
}

- (void)setLeftMarginWithMargin:(double)margin unit:(GtkUnit)unit
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

- (void)setRightMarginWithMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_right_margin([self castedGObject], margin, unit);
}

- (void)setTopMarginWithMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_top_margin([self castedGObject], margin, unit);
}

- (bool)toFile:(OFString*)fileName
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

- (void)toKeyFileWithKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	gtk_page_setup_to_key_file([self castedGObject], keyFile, [groupName UTF8String]);
}


@end