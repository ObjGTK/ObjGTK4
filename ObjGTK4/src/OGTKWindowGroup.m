/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindowGroup.h"

#import "OGTKWindow.h"

@implementation OGTKWindowGroup

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_WINDOW_GROUP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkWindowGroup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_window_group_new(), GtkWindowGroup, GtkWindowGroup);

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

- (GtkWindowGroup*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkWindowGroup, GtkWindowGroup);
}

- (void)addWindow:(OGTKWindow*)window
{
	gtk_window_group_add_window([self castedGObject], [window castedGObject]);
}

- (GList*)listWindows
{
	GList* returnValue = (GList*)gtk_window_group_list_windows([self castedGObject]);

	return returnValue;
}

- (void)removeWindow:(OGTKWindow*)window
{
	gtk_window_group_remove_window([self castedGObject], [window castedGObject]);
}


@end