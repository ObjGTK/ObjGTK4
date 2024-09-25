/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileDialog.h"

#import <OGio/OGCancellable.h>
#import "OGTKWindow.h"
#import "OGTKFileFilter.h"

@implementation OGTKFileDialog

- (instancetype)init
{
	GtkFileDialog* gobjectValue = GTK_FILE_DIALOG(gtk_file_dialog_new());

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

- (GtkFileDialog*)castedGObject
{
	return GTK_FILE_DIALOG([self gObject]);
}

- (OFString*)acceptLabel
{
	const char* gobjectValue = gtk_file_dialog_get_accept_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKFileFilter*)defaultFilter
{
	GtkFileFilter* gobjectValue = GTK_FILE_FILTER(gtk_file_dialog_get_default_filter([self castedGObject]));

	OGTKFileFilter* returnValue = [OGTKFileFilter withGObject:gobjectValue];
	return returnValue;
}

- (GListModel*)filters
{
	GListModel* returnValue = gtk_file_dialog_get_filters([self castedGObject]);

	return returnValue;
}

- (GFile*)initialFile
{
	GFile* returnValue = gtk_file_dialog_get_initial_file([self castedGObject]);

	return returnValue;
}

- (GFile*)initialFolder
{
	GFile* returnValue = gtk_file_dialog_get_initial_folder([self castedGObject]);

	return returnValue;
}

- (OFString*)initialName
{
	const char* gobjectValue = gtk_file_dialog_get_initial_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)modal
{
	bool returnValue = gtk_file_dialog_get_modal([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_file_dialog_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)openWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_open([self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GFile*)openFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GFile* returnValue = gtk_file_dialog_open_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)openMultipleWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_open_multiple([self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GListModel*)openMultipleFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GListModel* returnValue = gtk_file_dialog_open_multiple_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)saveWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_save([self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GFile*)saveFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GFile* returnValue = gtk_file_dialog_save_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)selectFolderWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_select_folder([self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GFile*)selectFolderFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GFile* returnValue = gtk_file_dialog_select_folder_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)selectMultipleFoldersWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_dialog_select_multiple_folders([self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (GListModel*)selectMultipleFoldersFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GListModel* returnValue = gtk_file_dialog_select_multiple_folders_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setAcceptLabel:(OFString*)acceptLabel
{
	gtk_file_dialog_set_accept_label([self castedGObject], [acceptLabel UTF8String]);
}

- (void)setDefaultFilter:(OGTKFileFilter*)filter
{
	gtk_file_dialog_set_default_filter([self castedGObject], [filter castedGObject]);
}

- (void)setFilters:(GListModel*)filters
{
	gtk_file_dialog_set_filters([self castedGObject], filters);
}

- (void)setInitialFile:(GFile*)file
{
	gtk_file_dialog_set_initial_file([self castedGObject], file);
}

- (void)setInitialFolder:(GFile*)folder
{
	gtk_file_dialog_set_initial_folder([self castedGObject], folder);
}

- (void)setInitialName:(OFString*)name
{
	gtk_file_dialog_set_initial_name([self castedGObject], [name UTF8String]);
}

- (void)setModal:(bool)modal
{
	gtk_file_dialog_set_modal([self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_file_dialog_set_title([self castedGObject], [title UTF8String]);
}


@end