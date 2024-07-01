/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKActionBar.h"

@implementation OGTKActionBar

- (instancetype)init
{
	GtkActionBar* gobjectValue = GTK_ACTION_BAR(gtk_action_bar_new());

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

- (GtkActionBar*)castedGObject
{
	return GTK_ACTION_BAR([self gObject]);
}

- (OGTKWidget*)centerWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_action_bar_get_center_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)revealed
{
	bool returnValue = gtk_action_bar_get_revealed([self castedGObject]);

	return returnValue;
}

- (void)packEnd:(OGTKWidget*)child
{
	gtk_action_bar_pack_end([self castedGObject], [child castedGObject]);
}

- (void)packStart:(OGTKWidget*)child
{
	gtk_action_bar_pack_start([self castedGObject], [child castedGObject]);
}

- (void)remove:(OGTKWidget*)child
{
	gtk_action_bar_remove([self castedGObject], [child castedGObject]);
}

- (void)setCenterWidget:(OGTKWidget*)centerWidget
{
	gtk_action_bar_set_center_widget([self castedGObject], [centerWidget castedGObject]);
}

- (void)setRevealed:(bool)revealed
{
	gtk_action_bar_set_revealed([self castedGObject], revealed);
}


@end