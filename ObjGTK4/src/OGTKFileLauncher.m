/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileLauncher.h"

#import <OGio/OGCancellable.h>
#import "OGTKWindow.h"

@implementation OGTKFileLauncher

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILE_LAUNCHER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FILE_LAUNCHER);
	return gObjectClass;
}

+ (instancetype)fileLauncherWithFile:(GFile*)file
{
	GtkFileLauncher* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_file_launcher_new(file), GTK_TYPE_FILE_LAUNCHER, GtkFileLauncher);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKFileLauncher* wrapperObject;
	@try {
		wrapperObject = [[OGTKFileLauncher alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFileLauncher*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FILE_LAUNCHER, GtkFileLauncher);
}

- (bool)alwaysAsk
{
	bool returnValue = (bool)gtk_file_launcher_get_always_ask((GtkFileLauncher*)[self castedGObject]);

	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = (GFile*)gtk_file_launcher_get_file((GtkFileLauncher*)[self castedGObject]);

	return returnValue;
}

- (bool)writable
{
	bool returnValue = (bool)gtk_file_launcher_get_writable((GtkFileLauncher*)[self castedGObject]);

	return returnValue;
}

- (void)launchWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_launcher_launch((GtkFileLauncher*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)launchFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_file_launcher_launch_finish((GtkFileLauncher*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)openContainingFolderWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_file_launcher_open_containing_folder((GtkFileLauncher*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)openContainingFolderFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_file_launcher_open_containing_folder_finish((GtkFileLauncher*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setAlwaysAsk:(bool)alwaysAsk
{
	gtk_file_launcher_set_always_ask((GtkFileLauncher*)[self castedGObject], alwaysAsk);
}

- (void)setFile:(GFile*)file
{
	gtk_file_launcher_set_file((GtkFileLauncher*)[self castedGObject], file);
}

- (void)setWritable:(bool)writable
{
	gtk_file_launcher_set_writable((GtkFileLauncher*)[self castedGObject], writable);
}


@end