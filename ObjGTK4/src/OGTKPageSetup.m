/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPageSetup.h"

@implementation OGTKPageSetup

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PAGE_SETUP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_PAGE_SETUP);
	return gObjectClass;
}

+ (instancetype)pageSetup
{
	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new(), GTK_TYPE_PAGE_SETUP, GtkPageSetup);

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

	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new_from_file([fileName UTF8String], &err), GTK_TYPE_PAGE_SETUP, GtkPageSetup);

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
	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new_from_gvariant(variant), GTK_TYPE_PAGE_SETUP, GtkPageSetup);

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

	GtkPageSetup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_page_setup_new_from_key_file(keyFile, [groupName UTF8String], &err), GTK_TYPE_PAGE_SETUP, GtkPageSetup);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_PAGE_SETUP, GtkPageSetup);
}

- (OGTKPageSetup*)copy
{
	GtkPageSetup* gobjectValue = gtk_page_setup_copy((GtkPageSetup*)[self castedGObject]);

	OGTKPageSetup* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (double)bottomMarginWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_bottom_margin((GtkPageSetup*)[self castedGObject], unit);

	return returnValue;
}

- (double)leftMarginWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_left_margin((GtkPageSetup*)[self castedGObject], unit);

	return returnValue;
}

- (GtkPageOrientation)orientation
{
	GtkPageOrientation returnValue = (GtkPageOrientation)gtk_page_setup_get_orientation((GtkPageSetup*)[self castedGObject]);

	return returnValue;
}

- (double)pageHeightWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_page_height((GtkPageSetup*)[self castedGObject], unit);

	return returnValue;
}

- (double)pageWidthWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_page_width((GtkPageSetup*)[self castedGObject], unit);

	return returnValue;
}

- (double)paperHeightWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_paper_height((GtkPageSetup*)[self castedGObject], unit);

	return returnValue;
}

- (GtkPaperSize*)paperSize
{
	GtkPaperSize* returnValue = (GtkPaperSize*)gtk_page_setup_get_paper_size((GtkPageSetup*)[self castedGObject]);

	return returnValue;
}

- (double)paperWidthWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_paper_width((GtkPageSetup*)[self castedGObject], unit);

	return returnValue;
}

- (double)rightMarginWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_right_margin((GtkPageSetup*)[self castedGObject], unit);

	return returnValue;
}

- (double)topMarginWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_page_setup_get_top_margin((GtkPageSetup*)[self castedGObject], unit);

	return returnValue;
}

- (bool)loadFileWithFileName:(OFString*)fileName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_page_setup_load_file((GtkPageSetup*)[self castedGObject], [fileName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)loadKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_page_setup_load_key_file((GtkPageSetup*)[self castedGObject], keyFile, [groupName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setBottomMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_bottom_margin((GtkPageSetup*)[self castedGObject], margin, unit);
}

- (void)setLeftMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_left_margin((GtkPageSetup*)[self castedGObject], margin, unit);
}

- (void)setOrientation:(GtkPageOrientation)orientation
{
	gtk_page_setup_set_orientation((GtkPageSetup*)[self castedGObject], orientation);
}

- (void)setPaperSize:(GtkPaperSize*)size
{
	gtk_page_setup_set_paper_size((GtkPageSetup*)[self castedGObject], size);
}

- (void)setPaperSizeAndDefaultMargins:(GtkPaperSize*)size
{
	gtk_page_setup_set_paper_size_and_default_margins((GtkPageSetup*)[self castedGObject], size);
}

- (void)setRightMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_right_margin((GtkPageSetup*)[self castedGObject], margin, unit);
}

- (void)setTopMargin:(double)margin unit:(GtkUnit)unit
{
	gtk_page_setup_set_top_margin((GtkPageSetup*)[self castedGObject], margin, unit);
}

- (bool)toFileWithFileName:(OFString*)fileName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_page_setup_to_file((GtkPageSetup*)[self castedGObject], [fileName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GVariant*)toGvariant
{
	GVariant* returnValue = (GVariant*)gtk_page_setup_to_gvariant((GtkPageSetup*)[self castedGObject]);

	return returnValue;
}

- (void)toKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	gtk_page_setup_to_key_file((GtkPageSetup*)[self castedGObject], keyFile, [groupName UTF8String]);
}


@end