/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPrintSettings.h"

@implementation OGTKPrintSettings

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PRINT_SETTINGS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_PRINT_SETTINGS);
	return gObjectClass;
}

+ (instancetype)printSettings
{
	GtkPrintSettings* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_print_settings_new(), GTK_TYPE_PRINT_SETTINGS, GtkPrintSettings);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKPrintSettings* wrapperObject;
	@try {
		wrapperObject = [[OGTKPrintSettings alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)printSettingsFromFileWithFileName:(OFString*)fileName
{
	GError* err = NULL;

	GtkPrintSettings* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_print_settings_new_from_file([fileName UTF8String], &err), GTK_TYPE_PRINT_SETTINGS, GtkPrintSettings);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGTKPrintSettings* wrapperObject;
	@try {
		wrapperObject = [[OGTKPrintSettings alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)printSettingsFromGvariant:(GVariant*)variant
{
	GtkPrintSettings* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_print_settings_new_from_gvariant(variant), GTK_TYPE_PRINT_SETTINGS, GtkPrintSettings);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKPrintSettings* wrapperObject;
	@try {
		wrapperObject = [[OGTKPrintSettings alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)printSettingsFromKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	GError* err = NULL;

	GtkPrintSettings* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_print_settings_new_from_key_file(keyFile, [groupName UTF8String], &err), GTK_TYPE_PRINT_SETTINGS, GtkPrintSettings);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGTKPrintSettings* wrapperObject;
	@try {
		wrapperObject = [[OGTKPrintSettings alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPrintSettings*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_PRINT_SETTINGS, GtkPrintSettings);
}

- (OGTKPrintSettings*)copy
{
	GtkPrintSettings* gobjectValue = gtk_print_settings_copy((GtkPrintSettings*)[self castedGObject]);

	OGTKPrintSettings* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)foreachWithFunc:(GtkPrintSettingsFunc)func userData:(gpointer)userData
{
	gtk_print_settings_foreach((GtkPrintSettings*)[self castedGObject], func, userData);
}

- (OFString*)getWithKey:(OFString*)key
{
	const char* gobjectValue = gtk_print_settings_get((GtkPrintSettings*)[self castedGObject], [key UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)boolWithKey:(OFString*)key
{
	bool returnValue = (bool)gtk_print_settings_get_bool((GtkPrintSettings*)[self castedGObject], [key UTF8String]);

	return returnValue;
}

- (bool)collate
{
	bool returnValue = (bool)gtk_print_settings_get_collate((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (OFString*)defaultSource
{
	const char* gobjectValue = gtk_print_settings_get_default_source((GtkPrintSettings*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)dither
{
	const char* gobjectValue = gtk_print_settings_get_dither((GtkPrintSettings*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (double)doubleWithKey:(OFString*)key
{
	double returnValue = (double)gtk_print_settings_get_double((GtkPrintSettings*)[self castedGObject], [key UTF8String]);

	return returnValue;
}

- (double)doubleWithDefaultWithKey:(OFString*)key def:(double)def
{
	double returnValue = (double)gtk_print_settings_get_double_with_default((GtkPrintSettings*)[self castedGObject], [key UTF8String], def);

	return returnValue;
}

- (GtkPrintDuplex)duplex
{
	GtkPrintDuplex returnValue = (GtkPrintDuplex)gtk_print_settings_get_duplex((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (OFString*)finishings
{
	const char* gobjectValue = gtk_print_settings_get_finishings((GtkPrintSettings*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)intWithKey:(OFString*)key
{
	int returnValue = (int)gtk_print_settings_get_int((GtkPrintSettings*)[self castedGObject], [key UTF8String]);

	return returnValue;
}

- (int)intWithDefaultWithKey:(OFString*)key def:(int)def
{
	int returnValue = (int)gtk_print_settings_get_int_with_default((GtkPrintSettings*)[self castedGObject], [key UTF8String], def);

	return returnValue;
}

- (double)lengthWithKey:(OFString*)key unit:(GtkUnit)unit
{
	double returnValue = (double)gtk_print_settings_get_length((GtkPrintSettings*)[self castedGObject], [key UTF8String], unit);

	return returnValue;
}

- (OFString*)mediaType
{
	const char* gobjectValue = gtk_print_settings_get_media_type((GtkPrintSettings*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)ncopies
{
	int returnValue = (int)gtk_print_settings_get_n_copies((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (int)numberUp
{
	int returnValue = (int)gtk_print_settings_get_number_up((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (GtkNumberUpLayout)numberUpLayout
{
	GtkNumberUpLayout returnValue = (GtkNumberUpLayout)gtk_print_settings_get_number_up_layout((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (GtkPageOrientation)orientation
{
	GtkPageOrientation returnValue = (GtkPageOrientation)gtk_print_settings_get_orientation((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (OFString*)outputBin
{
	const char* gobjectValue = gtk_print_settings_get_output_bin((GtkPrintSettings*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkPageRange*)pageRangesWithNumRanges:(int*)numRanges
{
	GtkPageRange* returnValue = (GtkPageRange*)gtk_print_settings_get_page_ranges((GtkPrintSettings*)[self castedGObject], numRanges);

	return returnValue;
}

- (GtkPageSet)pageSet
{
	GtkPageSet returnValue = (GtkPageSet)gtk_print_settings_get_page_set((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (double)paperHeightWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_print_settings_get_paper_height((GtkPrintSettings*)[self castedGObject], unit);

	return returnValue;
}

- (GtkPaperSize*)paperSize
{
	GtkPaperSize* returnValue = (GtkPaperSize*)gtk_print_settings_get_paper_size((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (double)paperWidthWithUnit:(GtkUnit)unit
{
	double returnValue = (double)gtk_print_settings_get_paper_width((GtkPrintSettings*)[self castedGObject], unit);

	return returnValue;
}

- (GtkPrintPages)printPages
{
	GtkPrintPages returnValue = (GtkPrintPages)gtk_print_settings_get_print_pages((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (OFString*)printer
{
	const char* gobjectValue = gtk_print_settings_get_printer((GtkPrintSettings*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (double)printerLpi
{
	double returnValue = (double)gtk_print_settings_get_printer_lpi((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (GtkPrintQuality)quality
{
	GtkPrintQuality returnValue = (GtkPrintQuality)gtk_print_settings_get_quality((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (int)resolution
{
	int returnValue = (int)gtk_print_settings_get_resolution((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (int)resolutionX
{
	int returnValue = (int)gtk_print_settings_get_resolution_x((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (int)resolutionY
{
	int returnValue = (int)gtk_print_settings_get_resolution_y((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (bool)reverse
{
	bool returnValue = (bool)gtk_print_settings_get_reverse((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (double)scale
{
	double returnValue = (double)gtk_print_settings_get_scale((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (bool)useColor
{
	bool returnValue = (bool)gtk_print_settings_get_use_color((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (bool)hasKey:(OFString*)key
{
	bool returnValue = (bool)gtk_print_settings_has_key((GtkPrintSettings*)[self castedGObject], [key UTF8String]);

	return returnValue;
}

- (bool)loadFileWithFileName:(OFString*)fileName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_print_settings_load_file((GtkPrintSettings*)[self castedGObject], [fileName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)loadKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_print_settings_load_key_file((GtkPrintSettings*)[self castedGObject], keyFile, [groupName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setWithKey:(OFString*)key value:(OFString*)value
{
	gtk_print_settings_set((GtkPrintSettings*)[self castedGObject], [key UTF8String], [value UTF8String]);
}

- (void)setBoolWithKey:(OFString*)key value:(bool)value
{
	gtk_print_settings_set_bool((GtkPrintSettings*)[self castedGObject], [key UTF8String], value);
}

- (void)setCollate:(bool)collate
{
	gtk_print_settings_set_collate((GtkPrintSettings*)[self castedGObject], collate);
}

- (void)setDefaultSource:(OFString*)defaultSource
{
	gtk_print_settings_set_default_source((GtkPrintSettings*)[self castedGObject], [defaultSource UTF8String]);
}

- (void)setDither:(OFString*)dither
{
	gtk_print_settings_set_dither((GtkPrintSettings*)[self castedGObject], [dither UTF8String]);
}

- (void)setDoubleWithKey:(OFString*)key value:(double)value
{
	gtk_print_settings_set_double((GtkPrintSettings*)[self castedGObject], [key UTF8String], value);
}

- (void)setDuplex:(GtkPrintDuplex)duplex
{
	gtk_print_settings_set_duplex((GtkPrintSettings*)[self castedGObject], duplex);
}

- (void)setFinishings:(OFString*)finishings
{
	gtk_print_settings_set_finishings((GtkPrintSettings*)[self castedGObject], [finishings UTF8String]);
}

- (void)setIntWithKey:(OFString*)key value:(int)value
{
	gtk_print_settings_set_int((GtkPrintSettings*)[self castedGObject], [key UTF8String], value);
}

- (void)setLengthWithKey:(OFString*)key value:(double)value unit:(GtkUnit)unit
{
	gtk_print_settings_set_length((GtkPrintSettings*)[self castedGObject], [key UTF8String], value, unit);
}

- (void)setMediaType:(OFString*)mediaType
{
	gtk_print_settings_set_media_type((GtkPrintSettings*)[self castedGObject], [mediaType UTF8String]);
}

- (void)setNcopiesWithNumCopies:(int)numCopies
{
	gtk_print_settings_set_n_copies((GtkPrintSettings*)[self castedGObject], numCopies);
}

- (void)setNumberUp:(int)numberUp
{
	gtk_print_settings_set_number_up((GtkPrintSettings*)[self castedGObject], numberUp);
}

- (void)setNumberUpLayout:(GtkNumberUpLayout)numberUpLayout
{
	gtk_print_settings_set_number_up_layout((GtkPrintSettings*)[self castedGObject], numberUpLayout);
}

- (void)setOrientation:(GtkPageOrientation)orientation
{
	gtk_print_settings_set_orientation((GtkPrintSettings*)[self castedGObject], orientation);
}

- (void)setOutputBin:(OFString*)outputBin
{
	gtk_print_settings_set_output_bin((GtkPrintSettings*)[self castedGObject], [outputBin UTF8String]);
}

- (void)setPageRanges:(GtkPageRange*)pageRanges numRanges:(int)numRanges
{
	gtk_print_settings_set_page_ranges((GtkPrintSettings*)[self castedGObject], pageRanges, numRanges);
}

- (void)setPageSet:(GtkPageSet)pageSet
{
	gtk_print_settings_set_page_set((GtkPrintSettings*)[self castedGObject], pageSet);
}

- (void)setPaperHeight:(double)height unit:(GtkUnit)unit
{
	gtk_print_settings_set_paper_height((GtkPrintSettings*)[self castedGObject], height, unit);
}

- (void)setPaperSize:(GtkPaperSize*)paperSize
{
	gtk_print_settings_set_paper_size((GtkPrintSettings*)[self castedGObject], paperSize);
}

- (void)setPaperWidth:(double)width unit:(GtkUnit)unit
{
	gtk_print_settings_set_paper_width((GtkPrintSettings*)[self castedGObject], width, unit);
}

- (void)setPrintPages:(GtkPrintPages)pages
{
	gtk_print_settings_set_print_pages((GtkPrintSettings*)[self castedGObject], pages);
}

- (void)setPrinter:(OFString*)printer
{
	gtk_print_settings_set_printer((GtkPrintSettings*)[self castedGObject], [printer UTF8String]);
}

- (void)setPrinterLpi:(double)lpi
{
	gtk_print_settings_set_printer_lpi((GtkPrintSettings*)[self castedGObject], lpi);
}

- (void)setQuality:(GtkPrintQuality)quality
{
	gtk_print_settings_set_quality((GtkPrintSettings*)[self castedGObject], quality);
}

- (void)setResolution:(int)resolution
{
	gtk_print_settings_set_resolution((GtkPrintSettings*)[self castedGObject], resolution);
}

- (void)setResolutionXy:(int)resolutionX resolutionY:(int)resolutionY
{
	gtk_print_settings_set_resolution_xy((GtkPrintSettings*)[self castedGObject], resolutionX, resolutionY);
}

- (void)setReverse:(bool)reverse
{
	gtk_print_settings_set_reverse((GtkPrintSettings*)[self castedGObject], reverse);
}

- (void)setScale:(double)scale
{
	gtk_print_settings_set_scale((GtkPrintSettings*)[self castedGObject], scale);
}

- (void)setUseColor:(bool)useColor
{
	gtk_print_settings_set_use_color((GtkPrintSettings*)[self castedGObject], useColor);
}

- (bool)toFileWithFileName:(OFString*)fileName
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_print_settings_to_file((GtkPrintSettings*)[self castedGObject], [fileName UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GVariant*)toGvariant
{
	GVariant* returnValue = (GVariant*)gtk_print_settings_to_gvariant((GtkPrintSettings*)[self castedGObject]);

	return returnValue;
}

- (void)toKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	gtk_print_settings_to_key_file((GtkPrintSettings*)[self castedGObject], keyFile, [groupName UTF8String]);
}

- (void)unsetWithKey:(OFString*)key
{
	gtk_print_settings_unset((GtkPrintSettings*)[self castedGObject], [key UTF8String]);
}


@end