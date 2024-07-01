/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKRevealer.h"

@implementation OGTKRevealer

- (instancetype)init
{
	GtkRevealer* gobjectValue = GTK_REVEALER(gtk_revealer_new());

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

- (GtkRevealer*)castedGObject
{
	return GTK_REVEALER([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_revealer_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)childRevealed
{
	bool returnValue = gtk_revealer_get_child_revealed([self castedGObject]);

	return returnValue;
}

- (bool)revealChild
{
	bool returnValue = gtk_revealer_get_reveal_child([self castedGObject]);

	return returnValue;
}

- (guint)transitionDuration
{
	guint returnValue = gtk_revealer_get_transition_duration([self castedGObject]);

	return returnValue;
}

- (GtkRevealerTransitionType)transitionType
{
	GtkRevealerTransitionType returnValue = gtk_revealer_get_transition_type([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_revealer_set_child([self castedGObject], [child castedGObject]);
}

- (void)setRevealChild:(bool)revealChild
{
	gtk_revealer_set_reveal_child([self castedGObject], revealChild);
}

- (void)setTransitionDuration:(guint)duration
{
	gtk_revealer_set_transition_duration([self castedGObject], duration);
}

- (void)setTransitionType:(GtkRevealerTransitionType)transition
{
	gtk_revealer_set_transition_type([self castedGObject], transition);
}


@end