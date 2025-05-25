/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKRevealer.h"

@implementation OGTKRevealer

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_REVEALER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_REVEALER);
	return gObjectClass;
}

+ (instancetype)revealer
{
	GtkRevealer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_revealer_new(), GTK_TYPE_REVEALER, GtkRevealer);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKRevealer* wrapperObject;
	@try {
		wrapperObject = [[OGTKRevealer alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkRevealer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_REVEALER, GtkRevealer);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_revealer_get_child((GtkRevealer*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)childRevealed
{
	bool returnValue = (bool)gtk_revealer_get_child_revealed((GtkRevealer*)[self castedGObject]);

	return returnValue;
}

- (bool)revealChild
{
	bool returnValue = (bool)gtk_revealer_get_reveal_child((GtkRevealer*)[self castedGObject]);

	return returnValue;
}

- (guint)transitionDuration
{
	guint returnValue = (guint)gtk_revealer_get_transition_duration((GtkRevealer*)[self castedGObject]);

	return returnValue;
}

- (GtkRevealerTransitionType)transitionType
{
	GtkRevealerTransitionType returnValue = (GtkRevealerTransitionType)gtk_revealer_get_transition_type((GtkRevealer*)[self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_revealer_set_child((GtkRevealer*)[self castedGObject], [child castedGObject]);
}

- (void)setRevealChild:(bool)revealChild
{
	gtk_revealer_set_reveal_child((GtkRevealer*)[self castedGObject], revealChild);
}

- (void)setTransitionDuration:(guint)duration
{
	gtk_revealer_set_transition_duration((GtkRevealer*)[self castedGObject], duration);
}

- (void)setTransitionType:(GtkRevealerTransitionType)transition
{
	gtk_revealer_set_transition_type((GtkRevealer*)[self castedGObject], transition);
}


@end