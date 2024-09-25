/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPrintDialog.h"

#import <OGio/OGCancellable.h>
#import "OGTKWindow.h"
#import "OGTKPrintSettings.h"
#import <OGio/OGOutputStream.h>
#import "OGTKPageSetup.h"

@implementation OGTKPrintDialog

- (instancetype)init
{
	GtkPrintDialog* gobjectValue = GTK_PRINT_DIALOG(gtk_print_dialog_new());

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

- (GtkPrintDialog*)castedGObject
{
	return GTK_PRINT_DIALOG([self gObject]);
}

- (OFString*)acceptLabel
{
	const char* gobjectValue = gtk_print_dialog_get_accept_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)modal
{
	bool returnValue = gtk_print_dialog_get_modal([self castedGObject]);

	return returnValue;
}

- (OGTKPageSetup*)pageSetup
{
	GtkPageSetup* gobjectValue = GTK_PAGE_SETUP(gtk_print_dialog_get_page_setup([self castedGObject]));

	OGTKPageSetup* returnValue = [OGTKPageSetup withGObject:gobjectValue];
	return returnValue;
}

- (OGTKPrintSettings*)printSettings
{
	GtkPrintSettings* gobjectValue = GTK_PRINT_SETTINGS(gtk_print_dialog_get_print_settings([self castedGObject]));

	OGTKPrintSettings* returnValue = [OGTKPrintSettings withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_print_dialog_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)printWithParent:(OGTKWindow*)parent setup:(GtkPrintSetup*)setup cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_print_dialog_print([self castedGObject], [parent castedGObject], setup, [cancellable castedGObject], callback, userData);
}

- (void)printFileWithParent:(OGTKWindow*)parent setup:(GtkPrintSetup*)setup file:(GFile*)file cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_print_dialog_print_file([self castedGObject], [parent castedGObject], setup, file, [cancellable castedGObject], callback, userData);
}

- (bool)printFileFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = gtk_print_dialog_print_file_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OGOutputStream*)printFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GOutputStream* gobjectValue = G_OUTPUT_STREAM(gtk_print_dialog_print_finish([self castedGObject], result, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGOutputStream* returnValue = [OGOutputStream withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setAcceptLabel:(OFString*)acceptLabel
{
	gtk_print_dialog_set_accept_label([self castedGObject], [acceptLabel UTF8String]);
}

- (void)setModal:(bool)modal
{
	gtk_print_dialog_set_modal([self castedGObject], modal);
}

- (void)setPageSetup:(OGTKPageSetup*)pageSetup
{
	gtk_print_dialog_set_page_setup([self castedGObject], [pageSetup castedGObject]);
}

- (void)setPrintSettings:(OGTKPrintSettings*)printSettings
{
	gtk_print_dialog_set_print_settings([self castedGObject], [printSettings castedGObject]);
}

- (void)setTitle:(OFString*)title
{
	gtk_print_dialog_set_title([self castedGObject], [title UTF8String]);
}

- (void)setupWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_print_dialog_setup([self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GtkPrintSetup*)setupFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GtkPrintSetup* returnValue = gtk_print_dialog_setup_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end