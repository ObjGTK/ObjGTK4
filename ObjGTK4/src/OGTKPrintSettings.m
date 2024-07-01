/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPrintSettings.h"

@implementation OGTKPrintSettings

- (instancetype)init
{
	GtkPrintSettings* gobjectValue = GTK_PRINT_SETTINGS(gtk_print_settings_new());

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

- (instancetype)initFromFile:(OFString*)fileName
{
	GError* err = NULL;

	GtkPrintSettings* gobjectValue = GTK_PRINT_SETTINGS(gtk_print_settings_new_from_file([fileName UTF8String], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

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

- (instancetype)initFromGvariant:(GVariant*)variant
{
	GtkPrintSettings* gobjectValue = GTK_PRINT_SETTINGS(gtk_print_settings_new_from_gvariant(variant));

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

	GtkPrintSettings* gobjectValue = GTK_PRINT_SETTINGS(gtk_print_settings_new_from_key_file(keyFile, [groupName UTF8String], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

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

- (GtkPrintSettings*)castedGObject
{
	return GTK_PRINT_SETTINGS([self gObject]);
}

- (OGTKPrintSettings*)copy
{
	GtkPrintSettings* gobjectValue = GTK_PRINT_SETTINGS(gtk_print_settings_copy([self castedGObject]));

	OGTKPrintSettings* returnValue = [OGTKPrintSettings withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)foreachWithFunc:(GtkPrintSettingsFunc)func userData:(gpointer)userData
{
	gtk_print_settings_foreach([self castedGObject], func, userData);
}

- (OFString*)get:(OFString*)key
{
	const char* gobjectValue = gtk_print_settings_get([self castedGObject], [key UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)bool:(OFString*)key
{
	bool returnValue = gtk_print_settings_get_bool([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (bool)collate
{
	bool returnValue = gtk_print_settings_get_collate([self castedGObject]);

	return returnValue;
}

- (OFString*)defaultSource
{
	const char* gobjectValue = gtk_print_settings_get_default_source([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)dither
{
	const char* gobjectValue = gtk_print_settings_get_dither([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (double)double:(OFString*)key
{
	double returnValue = gtk_print_settings_get_double([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (double)doubleWithDefaultWithKey:(OFString*)key def:(double)def
{
	double returnValue = gtk_print_settings_get_double_with_default([self castedGObject], [key UTF8String], def);

	return returnValue;
}

- (GtkPrintDuplex)duplex
{
	GtkPrintDuplex returnValue = gtk_print_settings_get_duplex([self castedGObject]);

	return returnValue;
}

- (OFString*)finishings
{
	const char* gobjectValue = gtk_print_settings_get_finishings([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)int:(OFString*)key
{
	int returnValue = gtk_print_settings_get_int([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (int)intWithDefaultWithKey:(OFString*)key def:(int)def
{
	int returnValue = gtk_print_settings_get_int_with_default([self castedGObject], [key UTF8String], def);

	return returnValue;
}

- (double)lengthWithKey:(OFString*)key unit:(GtkUnit)unit
{
	double returnValue = gtk_print_settings_get_length([self castedGObject], [key UTF8String], unit);

	return returnValue;
}

- (OFString*)mediaType
{
	const char* gobjectValue = gtk_print_settings_get_media_type([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)ncopies
{
	int returnValue = gtk_print_settings_get_n_copies([self castedGObject]);

	return returnValue;
}

- (int)numberUp
{
	int returnValue = gtk_print_settings_get_number_up([self castedGObject]);

	return returnValue;
}

- (GtkNumberUpLayout)numberUpLayout
{
	GtkNumberUpLayout returnValue = gtk_print_settings_get_number_up_layout([self castedGObject]);

	return returnValue;
}

- (GtkPageOrientation)orientation
{
	GtkPageOrientation returnValue = gtk_print_settings_get_orientation([self castedGObject]);

	return returnValue;
}

- (OFString*)outputBin
{
	const char* gobjectValue = gtk_print_settings_get_output_bin([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkPageRange*)pageRanges:(int*)numRanges
{
	GtkPageRange* returnValue = gtk_print_settings_get_page_ranges([self castedGObject], numRanges);

	return returnValue;
}

- (GtkPageSet)pageSet
{
	GtkPageSet returnValue = gtk_print_settings_get_page_set([self castedGObject]);

	return returnValue;
}

- (double)paperHeight:(GtkUnit)unit
{
	double returnValue = gtk_print_settings_get_paper_height([self castedGObject], unit);

	return returnValue;
}

- (GtkPaperSize*)paperSize
{
	GtkPaperSize* returnValue = gtk_print_settings_get_paper_size([self castedGObject]);

	return returnValue;
}

- (double)paperWidth:(GtkUnit)unit
{
	double returnValue = gtk_print_settings_get_paper_width([self castedGObject], unit);

	return returnValue;
}

- (GtkPrintPages)printPages
{
	GtkPrintPages returnValue = gtk_print_settings_get_print_pages([self castedGObject]);

	return returnValue;
}

- (OFString*)printer
{
	const char* gobjectValue = gtk_print_settings_get_printer([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (double)printerLpi
{
	double returnValue = gtk_print_settings_get_printer_lpi([self castedGObject]);

	return returnValue;
}

- (GtkPrintQuality)quality
{
	GtkPrintQuality returnValue = gtk_print_settings_get_quality([self castedGObject]);

	return returnValue;
}

- (int)resolution
{
	int returnValue = gtk_print_settings_get_resolution([self castedGObject]);

	return returnValue;
}

- (int)resolutionX
{
	int returnValue = gtk_print_settings_get_resolution_x([self castedGObject]);

	return returnValue;
}

- (int)resolutionY
{
	int returnValue = gtk_print_settings_get_resolution_y([self castedGObject]);

	return returnValue;
}

- (bool)reverse
{
	bool returnValue = gtk_print_settings_get_reverse([self castedGObject]);

	return returnValue;
}

- (double)scale
{
	double returnValue = gtk_print_settings_get_scale([self castedGObject]);

	return returnValue;
}

- (bool)useColor
{
	bool returnValue = gtk_print_settings_get_use_color([self castedGObject]);

	return returnValue;
}

- (bool)hasKey:(OFString*)key
{
	bool returnValue = gtk_print_settings_has_key([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (bool)loadFile:(OFString*)fileName
{
	GError* err = NULL;

	bool returnValue = gtk_print_settings_load_file([self castedGObject], [fileName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)loadKeyFileWithKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	GError* err = NULL;

	bool returnValue = gtk_print_settings_load_key_file([self castedGObject], keyFile, [groupName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setWithKey:(OFString*)key value:(OFString*)value
{
	gtk_print_settings_set([self castedGObject], [key UTF8String], [value UTF8String]);
}

- (void)setBoolWithKey:(OFString*)key value:(bool)value
{
	gtk_print_settings_set_bool([self castedGObject], [key UTF8String], value);
}

- (void)setCollate:(bool)collate
{
	gtk_print_settings_set_collate([self castedGObject], collate);
}

- (void)setDefaultSource:(OFString*)defaultSource
{
	gtk_print_settings_set_default_source([self castedGObject], [defaultSource UTF8String]);
}

- (void)setDither:(OFString*)dither
{
	gtk_print_settings_set_dither([self castedGObject], [dither UTF8String]);
}

- (void)setDoubleWithKey:(OFString*)key value:(double)value
{
	gtk_print_settings_set_double([self castedGObject], [key UTF8String], value);
}

- (void)setDuplex:(GtkPrintDuplex)duplex
{
	gtk_print_settings_set_duplex([self castedGObject], duplex);
}

- (void)setFinishings:(OFString*)finishings
{
	gtk_print_settings_set_finishings([self castedGObject], [finishings UTF8String]);
}

- (void)setIntWithKey:(OFString*)key value:(int)value
{
	gtk_print_settings_set_int([self castedGObject], [key UTF8String], value);
}

- (void)setLengthWithKey:(OFString*)key value:(double)value unit:(GtkUnit)unit
{
	gtk_print_settings_set_length([self castedGObject], [key UTF8String], value, unit);
}

- (void)setMediaType:(OFString*)mediaType
{
	gtk_print_settings_set_media_type([self castedGObject], [mediaType UTF8String]);
}

- (void)setNcopies:(int)numCopies
{
	gtk_print_settings_set_n_copies([self castedGObject], numCopies);
}

- (void)setNumberUp:(int)numberUp
{
	gtk_print_settings_set_number_up([self castedGObject], numberUp);
}

- (void)setNumberUpLayout:(GtkNumberUpLayout)numberUpLayout
{
	gtk_print_settings_set_number_up_layout([self castedGObject], numberUpLayout);
}

- (void)setOrientation:(GtkPageOrientation)orientation
{
	gtk_print_settings_set_orientation([self castedGObject], orientation);
}

- (void)setOutputBin:(OFString*)outputBin
{
	gtk_print_settings_set_output_bin([self castedGObject], [outputBin UTF8String]);
}

- (void)setPageRangesWithPageRanges:(GtkPageRange*)pageRanges numRanges:(int)numRanges
{
	gtk_print_settings_set_page_ranges([self castedGObject], pageRanges, numRanges);
}

- (void)setPageSet:(GtkPageSet)pageSet
{
	gtk_print_settings_set_page_set([self castedGObject], pageSet);
}

- (void)setPaperHeightWithHeight:(double)height unit:(GtkUnit)unit
{
	gtk_print_settings_set_paper_height([self castedGObject], height, unit);
}

- (void)setPaperSize:(GtkPaperSize*)paperSize
{
	gtk_print_settings_set_paper_size([self castedGObject], paperSize);
}

- (void)setPaperWidthWithWidth:(double)width unit:(GtkUnit)unit
{
	gtk_print_settings_set_paper_width([self castedGObject], width, unit);
}

- (void)setPrintPages:(GtkPrintPages)pages
{
	gtk_print_settings_set_print_pages([self castedGObject], pages);
}

- (void)setPrinter:(OFString*)printer
{
	gtk_print_settings_set_printer([self castedGObject], [printer UTF8String]);
}

- (void)setPrinterLpi:(double)lpi
{
	gtk_print_settings_set_printer_lpi([self castedGObject], lpi);
}

- (void)setQuality:(GtkPrintQuality)quality
{
	gtk_print_settings_set_quality([self castedGObject], quality);
}

- (void)setResolution:(int)resolution
{
	gtk_print_settings_set_resolution([self castedGObject], resolution);
}

- (void)setResolutionXyWithResolutionX:(int)resolutionX resolutionY:(int)resolutionY
{
	gtk_print_settings_set_resolution_xy([self castedGObject], resolutionX, resolutionY);
}

- (void)setReverse:(bool)reverse
{
	gtk_print_settings_set_reverse([self castedGObject], reverse);
}

- (void)setScale:(double)scale
{
	gtk_print_settings_set_scale([self castedGObject], scale);
}

- (void)setUseColor:(bool)useColor
{
	gtk_print_settings_set_use_color([self castedGObject], useColor);
}

- (bool)toFile:(OFString*)fileName
{
	GError* err = NULL;

	bool returnValue = gtk_print_settings_to_file([self castedGObject], [fileName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (GVariant*)toGvariant
{
	GVariant* returnValue = gtk_print_settings_to_gvariant([self castedGObject]);

	return returnValue;
}

- (void)toKeyFileWithKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName
{
	gtk_print_settings_to_key_file([self castedGObject], keyFile, [groupName UTF8String]);
}

- (void)unset:(OFString*)key
{
	gtk_print_settings_unset([self castedGObject], [key UTF8String]);
}


@end