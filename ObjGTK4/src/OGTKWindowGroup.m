/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindowGroup.h"

#import "OGTKWindow.h"

@implementation OGTKWindowGroup

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_WINDOW_GROUP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_WINDOW_GROUP);
	return gObjectClass;
}

+ (instancetype)windowGroup
{
	GtkWindowGroup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_window_group_new(), GTK_TYPE_WINDOW_GROUP, GtkWindowGroup);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKWindowGroup* wrapperObject;
	@try {
		wrapperObject = [[OGTKWindowGroup alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkWindowGroup*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_WINDOW_GROUP, GtkWindowGroup);
}

- (void)addWindow:(OGTKWindow*)window
{
	gtk_window_group_add_window((GtkWindowGroup*)[self castedGObject], [window castedGObject]);
}

- (GList*)listWindows
{
	GList* returnValue = (GList*)gtk_window_group_list_windows((GtkWindowGroup*)[self castedGObject]);

	return returnValue;
}

- (void)removeWindow:(OGTKWindow*)window
{
	gtk_window_group_remove_window((GtkWindowGroup*)[self castedGObject], [window castedGObject]);
}


@end