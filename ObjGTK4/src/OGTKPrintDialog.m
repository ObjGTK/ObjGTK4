/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPrintDialog.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGOutputStream.h>
#import "OGTKPageSetup.h"
#import "OGTKPrintSettings.h"
#import "OGTKWindow.h"

@implementation OGTKPrintDialog

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PRINT_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_PRINT_DIALOG);
	return gObjectClass;
}

+ (instancetype)printDialog
{
	GtkPrintDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_print_dialog_new(), GTK_TYPE_PRINT_DIALOG, GtkPrintDialog);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKPrintDialog* wrapperObject;
	@try {
		wrapperObject = [[OGTKPrintDialog alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPrintDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_PRINT_DIALOG, GtkPrintDialog);
}

- (OFString*)acceptLabel
{
	const char* gobjectValue = gtk_print_dialog_get_accept_label((GtkPrintDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)modal
{
	bool returnValue = (bool)gtk_print_dialog_get_modal((GtkPrintDialog*)[self castedGObject]);

	return returnValue;
}

- (OGTKPageSetup*)pageSetup
{
	GtkPageSetup* gobjectValue = gtk_print_dialog_get_page_setup((GtkPrintDialog*)[self castedGObject]);

	OGTKPageSetup* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKPrintSettings*)printSettings
{
	GtkPrintSettings* gobjectValue = gtk_print_dialog_get_print_settings((GtkPrintDialog*)[self castedGObject]);

	OGTKPrintSettings* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_print_dialog_get_title((GtkPrintDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)printWithParent:(OGTKWindow*)parent setup:(GtkPrintSetup*)setup cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_print_dialog_print((GtkPrintDialog*)[self castedGObject], [parent castedGObject], setup, [cancellable castedGObject], callback, userData);
}

- (void)printFileWithParent:(OGTKWindow*)parent setup:(GtkPrintSetup*)setup file:(GFile*)file cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_print_dialog_print_file((GtkPrintDialog*)[self castedGObject], [parent castedGObject], setup, file, [cancellable castedGObject], callback, userData);
}

- (bool)printFileFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_print_dialog_print_file_finish((GtkPrintDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGOutputStream*)printFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GOutputStream* gobjectValue = gtk_print_dialog_print_finish((GtkPrintDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGOutputStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setAcceptLabel:(OFString*)acceptLabel
{
	gtk_print_dialog_set_accept_label((GtkPrintDialog*)[self castedGObject], [acceptLabel UTF8String]);
}

- (void)setModal:(bool)modal
{
	gtk_print_dialog_set_modal((GtkPrintDialog*)[self castedGObject], modal);
}

- (void)setPageSetup:(OGTKPageSetup*)pageSetup
{
	gtk_print_dialog_set_page_setup((GtkPrintDialog*)[self castedGObject], [pageSetup castedGObject]);
}

- (void)setPrintSettings:(OGTKPrintSettings*)printSettings
{
	gtk_print_dialog_set_print_settings((GtkPrintDialog*)[self castedGObject], [printSettings castedGObject]);
}

- (void)setTitle:(OFString*)title
{
	gtk_print_dialog_set_title((GtkPrintDialog*)[self castedGObject], [title UTF8String]);
}

- (void)setupWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_print_dialog_setup((GtkPrintDialog*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GtkPrintSetup*)setupFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GtkPrintSetup* returnValue = (GtkPrintSetup*)gtk_print_dialog_setup_finish((GtkPrintDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end