/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPrintOperation.h"

#import "OGTKPageSetup.h"
#import "OGTKPrintSettings.h"
#import "OGTKWindow.h"

@implementation OGTKPrintOperation

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PRINT_OPERATION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_PRINT_OPERATION);
	return gObjectClass;
}

+ (instancetype)printOperation
{
	GtkPrintOperation* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_print_operation_new(), GTK_TYPE_PRINT_OPERATION, GtkPrintOperation);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKPrintOperation* wrapperObject;
	@try {
		wrapperObject = [[OGTKPrintOperation alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPrintOperation*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_PRINT_OPERATION, GtkPrintOperation);
}

- (void)cancel
{
	gtk_print_operation_cancel((GtkPrintOperation*)[self castedGObject]);
}

- (void)drawPageFinish
{
	gtk_print_operation_draw_page_finish((GtkPrintOperation*)[self castedGObject]);
}

- (OGTKPageSetup*)defaultPageSetup
{
	GtkPageSetup* gobjectValue = gtk_print_operation_get_default_page_setup((GtkPrintOperation*)[self castedGObject]);

	OGTKPageSetup* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)embedPageSetup
{
	bool returnValue = (bool)gtk_print_operation_get_embed_page_setup((GtkPrintOperation*)[self castedGObject]);

	return returnValue;
}

- (void)error
{
	GError* err = NULL;

	gtk_print_operation_get_error((GtkPrintOperation*)[self castedGObject], &err);

	[OGErrorException throwForError:err];

}

- (bool)hasSelection
{
	bool returnValue = (bool)gtk_print_operation_get_has_selection((GtkPrintOperation*)[self castedGObject]);

	return returnValue;
}

- (int)npagesToPrint
{
	int returnValue = (int)gtk_print_operation_get_n_pages_to_print((GtkPrintOperation*)[self castedGObject]);

	return returnValue;
}

- (OGTKPrintSettings*)printSettings
{
	GtkPrintSettings* gobjectValue = gtk_print_operation_get_print_settings((GtkPrintOperation*)[self castedGObject]);

	OGTKPrintSettings* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkPrintStatus)status
{
	GtkPrintStatus returnValue = (GtkPrintStatus)gtk_print_operation_get_status((GtkPrintOperation*)[self castedGObject]);

	return returnValue;
}

- (OFString*)statusString
{
	const char* gobjectValue = gtk_print_operation_get_status_string((GtkPrintOperation*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)supportSelection
{
	bool returnValue = (bool)gtk_print_operation_get_support_selection((GtkPrintOperation*)[self castedGObject]);

	return returnValue;
}

- (bool)isFinished
{
	bool returnValue = (bool)gtk_print_operation_is_finished((GtkPrintOperation*)[self castedGObject]);

	return returnValue;
}

- (GtkPrintOperationResult)runWithAction:(GtkPrintOperationAction)action parent:(OGTKWindow*)parent
{
	GError* err = NULL;

	GtkPrintOperationResult returnValue = (GtkPrintOperationResult)gtk_print_operation_run((GtkPrintOperation*)[self castedGObject], action, [parent castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setAllowAsync:(bool)allowAsync
{
	gtk_print_operation_set_allow_async((GtkPrintOperation*)[self castedGObject], allowAsync);
}

- (void)setCurrentPage:(int)currentPage
{
	gtk_print_operation_set_current_page((GtkPrintOperation*)[self castedGObject], currentPage);
}

- (void)setCustomTabLabel:(OFString*)label
{
	gtk_print_operation_set_custom_tab_label((GtkPrintOperation*)[self castedGObject], [label UTF8String]);
}

- (void)setDefaultPageSetup:(OGTKPageSetup*)defaultPageSetup
{
	gtk_print_operation_set_default_page_setup((GtkPrintOperation*)[self castedGObject], [defaultPageSetup castedGObject]);
}

- (void)setDeferDrawing
{
	gtk_print_operation_set_defer_drawing((GtkPrintOperation*)[self castedGObject]);
}

- (void)setEmbedPageSetup:(bool)embed
{
	gtk_print_operation_set_embed_page_setup((GtkPrintOperation*)[self castedGObject], embed);
}

- (void)setExportFilename:(OFString*)filename
{
	gtk_print_operation_set_export_filename((GtkPrintOperation*)[self castedGObject], [filename UTF8String]);
}

- (void)setHasSelection:(bool)hasSelection
{
	gtk_print_operation_set_has_selection((GtkPrintOperation*)[self castedGObject], hasSelection);
}

- (void)setJobName:(OFString*)jobName
{
	gtk_print_operation_set_job_name((GtkPrintOperation*)[self castedGObject], [jobName UTF8String]);
}

- (void)setNpages:(int)npages
{
	gtk_print_operation_set_n_pages((GtkPrintOperation*)[self castedGObject], npages);
}

- (void)setPrintSettings:(OGTKPrintSettings*)printSettings
{
	gtk_print_operation_set_print_settings((GtkPrintOperation*)[self castedGObject], [printSettings castedGObject]);
}

- (void)setShowProgress:(bool)showProgress
{
	gtk_print_operation_set_show_progress((GtkPrintOperation*)[self castedGObject], showProgress);
}

- (void)setSupportSelection:(bool)supportSelection
{
	gtk_print_operation_set_support_selection((GtkPrintOperation*)[self castedGObject], supportSelection);
}

- (void)setTrackPrintStatusWithTrackStatus:(bool)trackStatus
{
	gtk_print_operation_set_track_print_status((GtkPrintOperation*)[self castedGObject], trackStatus);
}

- (void)setUnit:(GtkUnit)unit
{
	gtk_print_operation_set_unit((GtkPrintOperation*)[self castedGObject], unit);
}

- (void)setUseFullPage:(bool)fullPage
{
	gtk_print_operation_set_use_full_page((GtkPrintOperation*)[self castedGObject], fullPage);
}


@end