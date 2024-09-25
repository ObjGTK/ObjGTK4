/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileLauncher.h"

#import <OGio/OGCancellable.h>
#import "OGTKWindow.h"

@implementation OGTKFileLauncher

- (instancetype)init:(GFile*)file
{
	GtkFileLauncher* gobjectValue = GTK_FILE_LAUNCHER(gtk_file_launcher_new(file));

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

- (GtkFileLauncher*)castedGObject
{
	return GTK_FILE_LAUNCHER([self gObject]);
}

- (bool)alwaysAsk
{
	bool returnValue = gtk_file_launcher_get_always_ask([self castedGObject]);

	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = gtk_file_launcher_get_file([self castedGObject]);

	return returnValue;
}

- (bool)writable
{
	bool returnValue = gtk_file_launcher_get_writable([self castedGObject]);

	return returnValue;
}

- (void)launchWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_launcher_launch([self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)launchFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = gtk_file_launcher_launch_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)openContainingFolderWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_launcher_open_containing_folder([self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)openContainingFolderFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = gtk_file_launcher_open_containing_folder_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setAlwaysAsk:(bool)alwaysAsk
{
	gtk_file_launcher_set_always_ask([self castedGObject], alwaysAsk);
}

- (void)setFile:(GFile*)file
{
	gtk_file_launcher_set_file([self castedGObject], file);
}

- (void)setWritable:(bool)writable
{
	gtk_file_launcher_set_writable([self castedGObject], writable);
}


@end