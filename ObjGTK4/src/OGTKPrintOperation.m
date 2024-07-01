/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPrintOperation.h"

#import "OGTKWindow.h"
#import "OGTKPageSetup.h"
#import "OGTKPrintSettings.h"

@implementation OGTKPrintOperation

- (instancetype)init
{
	GtkPrintOperation* gobjectValue = GTK_PRINT_OPERATION(gtk_print_operation_new());

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

- (GtkPrintOperation*)castedGObject
{
	return GTK_PRINT_OPERATION([self gObject]);
}

- (void)cancel
{
	gtk_print_operation_cancel([self castedGObject]);
}

- (void)drawPageFinish
{
	gtk_print_operation_draw_page_finish([self castedGObject]);
}

- (OGTKPageSetup*)defaultPageSetup
{
	GtkPageSetup* gobjectValue = GTK_PAGE_SETUP(gtk_print_operation_get_default_page_setup([self castedGObject]));

	OGTKPageSetup* returnValue = [OGTKPageSetup withGObject:gobjectValue];
	return returnValue;
}

- (bool)embedPageSetup
{
	bool returnValue = gtk_print_operation_get_embed_page_setup([self castedGObject]);

	return returnValue;
}

- (void)error
{
	GError* err = NULL;

	gtk_print_operation_get_error([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (bool)hasSelection
{
	bool returnValue = gtk_print_operation_get_has_selection([self castedGObject]);

	return returnValue;
}

- (int)npagesToPrint
{
	int returnValue = gtk_print_operation_get_n_pages_to_print([self castedGObject]);

	return returnValue;
}

- (OGTKPrintSettings*)printSettings
{
	GtkPrintSettings* gobjectValue = GTK_PRINT_SETTINGS(gtk_print_operation_get_print_settings([self castedGObject]));

	OGTKPrintSettings* returnValue = [OGTKPrintSettings withGObject:gobjectValue];
	return returnValue;
}

- (GtkPrintStatus)status
{
	GtkPrintStatus returnValue = gtk_print_operation_get_status([self castedGObject]);

	return returnValue;
}

- (OFString*)statusString
{
	const char* gobjectValue = gtk_print_operation_get_status_string([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)supportSelection
{
	bool returnValue = gtk_print_operation_get_support_selection([self castedGObject]);

	return returnValue;
}

- (bool)isFinished
{
	bool returnValue = gtk_print_operation_is_finished([self castedGObject]);

	return returnValue;
}

- (GtkPrintOperationResult)runWithAction:(GtkPrintOperationAction)action parent:(OGTKWindow*)parent
{
	GError* err = NULL;

	GtkPrintOperationResult returnValue = gtk_print_operation_run([self castedGObject], action, [parent castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setAllowAsync:(bool)allowAsync
{
	gtk_print_operation_set_allow_async([self castedGObject], allowAsync);
}

- (void)setCurrentPage:(int)currentPage
{
	gtk_print_operation_set_current_page([self castedGObject], currentPage);
}

- (void)setCustomTabLabel:(OFString*)label
{
	gtk_print_operation_set_custom_tab_label([self castedGObject], [label UTF8String]);
}

- (void)setDefaultPageSetup:(OGTKPageSetup*)defaultPageSetup
{
	gtk_print_operation_set_default_page_setup([self castedGObject], [defaultPageSetup castedGObject]);
}

- (void)setDeferDrawing
{
	gtk_print_operation_set_defer_drawing([self castedGObject]);
}

- (void)setEmbedPageSetup:(bool)embed
{
	gtk_print_operation_set_embed_page_setup([self castedGObject], embed);
}

- (void)setExportFilename:(OFString*)filename
{
	gtk_print_operation_set_export_filename([self castedGObject], [filename UTF8String]);
}

- (void)setHasSelection:(bool)hasSelection
{
	gtk_print_operation_set_has_selection([self castedGObject], hasSelection);
}

- (void)setJobName:(OFString*)jobName
{
	gtk_print_operation_set_job_name([self castedGObject], [jobName UTF8String]);
}

- (void)setNpages:(int)npages
{
	gtk_print_operation_set_n_pages([self castedGObject], npages);
}

- (void)setPrintSettings:(OGTKPrintSettings*)printSettings
{
	gtk_print_operation_set_print_settings([self castedGObject], [printSettings castedGObject]);
}

- (void)setShowProgress:(bool)showProgress
{
	gtk_print_operation_set_show_progress([self castedGObject], showProgress);
}

- (void)setSupportSelection:(bool)supportSelection
{
	gtk_print_operation_set_support_selection([self castedGObject], supportSelection);
}

- (void)setTrackPrintStatus:(bool)trackStatus
{
	gtk_print_operation_set_track_print_status([self castedGObject], trackStatus);
}

- (void)setUnit:(GtkUnit)unit
{
	gtk_print_operation_set_unit([self castedGObject], unit);
}

- (void)setUseFullPage:(bool)fullPage
{
	gtk_print_operation_set_use_full_page([self castedGObject], fullPage);
}


@end