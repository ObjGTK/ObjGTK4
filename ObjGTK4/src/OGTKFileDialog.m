/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileDialog.h"

#import <OGio/OGCancellable.h>
#import "OGTKFileFilter.h"
#import "OGTKWindow.h"

@implementation OGTKFileDialog

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILE_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FILE_DIALOG);
	return gObjectClass;
}

+ (instancetype)fileDialog
{
	GtkFileDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_file_dialog_new(), GTK_TYPE_FILE_DIALOG, GtkFileDialog);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKFileDialog* wrapperObject;
	@try {
		wrapperObject = [[OGTKFileDialog alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFileDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FILE_DIALOG, GtkFileDialog);
}

- (OFString*)acceptLabel
{
	const char* gobjectValue = gtk_file_dialog_get_accept_label((GtkFileDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKFileFilter*)defaultFilter
{
	GtkFileFilter* gobjectValue = gtk_file_dialog_get_default_filter((GtkFileDialog*)[self castedGObject]);

	OGTKFileFilter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GListModel*)filters
{
	GListModel* returnValue = (GListModel*)gtk_file_dialog_get_filters((GtkFileDialog*)[self castedGObject]);

	return returnValue;
}

- (GFile*)initialFile
{
	GFile* returnValue = (GFile*)gtk_file_dialog_get_initial_file((GtkFileDialog*)[self castedGObject]);

	return returnValue;
}

- (GFile*)initialFolder
{
	GFile* returnValue = (GFile*)gtk_file_dialog_get_initial_folder((GtkFileDialog*)[self castedGObject]);

	return returnValue;
}

- (OFString*)initialName
{
	const char* gobjectValue = gtk_file_dialog_get_initial_name((GtkFileDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)modal
{
	bool returnValue = (bool)gtk_file_dialog_get_modal((GtkFileDialog*)[self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_file_dialog_get_title((GtkFileDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)openWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_open((GtkFileDialog*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GFile*)openFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GFile* returnValue = (GFile*)gtk_file_dialog_open_finish((GtkFileDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)openMultipleWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_open_multiple((GtkFileDialog*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GListModel*)openMultipleFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GListModel* returnValue = (GListModel*)gtk_file_dialog_open_multiple_finish((GtkFileDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)saveWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_save((GtkFileDialog*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GFile*)saveFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GFile* returnValue = (GFile*)gtk_file_dialog_save_finish((GtkFileDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)selectFolderWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_select_folder((GtkFileDialog*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GFile*)selectFolderFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GFile* returnValue = (GFile*)gtk_file_dialog_select_folder_finish((GtkFileDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)selectMultipleFoldersWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_select_multiple_folders((GtkFileDialog*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GListModel*)selectMultipleFoldersFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GListModel* returnValue = (GListModel*)gtk_file_dialog_select_multiple_folders_finish((GtkFileDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setAcceptLabel:(OFString*)acceptLabel
{
	gtk_file_dialog_set_accept_label((GtkFileDialog*)[self castedGObject], [acceptLabel UTF8String]);
}

- (void)setDefaultFilter:(OGTKFileFilter*)filter
{
	gtk_file_dialog_set_default_filter((GtkFileDialog*)[self castedGObject], [filter castedGObject]);
}

- (void)setFilters:(GListModel*)filters
{
	gtk_file_dialog_set_filters((GtkFileDialog*)[self castedGObject], filters);
}

- (void)setInitialFile:(GFile*)file
{
	gtk_file_dialog_set_initial_file((GtkFileDialog*)[self castedGObject], file);
}

- (void)setInitialFolder:(GFile*)folder
{
	gtk_file_dialog_set_initial_folder((GtkFileDialog*)[self castedGObject], folder);
}

- (void)setInitialName:(OFString*)name
{
	gtk_file_dialog_set_initial_name((GtkFileDialog*)[self castedGObject], [name UTF8String]);
}

- (void)setModal:(bool)modal
{
	gtk_file_dialog_set_modal((GtkFileDialog*)[self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_file_dialog_set_title((GtkFileDialog*)[self castedGObject], [title UTF8String]);
}


@end