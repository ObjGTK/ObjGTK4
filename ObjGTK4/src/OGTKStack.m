/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStack.h"

#import "OGTKStackPage.h"

@implementation OGTKStack

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STACK;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)stack
{
	GtkStack* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_stack_new(), GtkStack, GtkStack);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKStack* wrapperObject;
	@try {
		wrapperObject = [[OGTKStack alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkStack*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkStack, GtkStack);
}

- (OGTKStackPage*)addChild:(OGTKWidget*)child
{
	GtkStackPage* gobjectValue = gtk_stack_add_child([self castedGObject], [child castedGObject]);

	OGTKStackPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKStackPage*)addNamedWithChild:(OGTKWidget*)child name:(OFString*)name
{
	GtkStackPage* gobjectValue = gtk_stack_add_named([self castedGObject], [child castedGObject], [name UTF8String]);

	OGTKStackPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKStackPage*)addTitledWithChild:(OGTKWidget*)child name:(OFString*)name title:(OFString*)title
{
	GtkStackPage* gobjectValue = gtk_stack_add_titled([self castedGObject], [child castedGObject], [name UTF8String], [title UTF8String]);

	OGTKStackPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)childByName:(OFString*)name
{
	GtkWidget* gobjectValue = gtk_stack_get_child_by_name([self castedGObject], [name UTF8String]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hhomogeneous
{
	bool returnValue = (bool)gtk_stack_get_hhomogeneous([self castedGObject]);

	return returnValue;
}

- (bool)interpolateSize
{
	bool returnValue = (bool)gtk_stack_get_interpolate_size([self castedGObject]);

	return returnValue;
}

- (OGTKStackPage*)pageWithChild:(OGTKWidget*)child
{
	GtkStackPage* gobjectValue = gtk_stack_get_page([self castedGObject], [child castedGObject]);

	OGTKStackPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkSelectionModel*)pages
{
	GtkSelectionModel* returnValue = (GtkSelectionModel*)gtk_stack_get_pages([self castedGObject]);

	return returnValue;
}

- (guint)transitionDuration
{
	guint returnValue = (guint)gtk_stack_get_transition_duration([self castedGObject]);

	return returnValue;
}

- (bool)transitionRunning
{
	bool returnValue = (bool)gtk_stack_get_transition_running([self castedGObject]);

	return returnValue;
}

- (GtkStackTransitionType)transitionType
{
	GtkStackTransitionType returnValue = (GtkStackTransitionType)gtk_stack_get_transition_type([self castedGObject]);

	return returnValue;
}

- (bool)vhomogeneous
{
	bool returnValue = (bool)gtk_stack_get_vhomogeneous([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)visibleChild
{
	GtkWidget* gobjectValue = gtk_stack_get_visible_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)visibleChildName
{
	const char* gobjectValue = gtk_stack_get_visible_child_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)removeWithChild:(OGTKWidget*)child
{
	gtk_stack_remove([self castedGObject], [child castedGObject]);
}

- (void)setHhomogeneous:(bool)hhomogeneous
{
	gtk_stack_set_hhomogeneous([self castedGObject], hhomogeneous);
}

- (void)setInterpolateSize:(bool)interpolateSize
{
	gtk_stack_set_interpolate_size([self castedGObject], interpolateSize);
}

- (void)setTransitionDuration:(guint)duration
{
	gtk_stack_set_transition_duration([self castedGObject], duration);
}

- (void)setTransitionType:(GtkStackTransitionType)transition
{
	gtk_stack_set_transition_type([self castedGObject], transition);
}

- (void)setVhomogeneous:(bool)vhomogeneous
{
	gtk_stack_set_vhomogeneous([self castedGObject], vhomogeneous);
}

- (void)setVisibleChild:(OGTKWidget*)child
{
	gtk_stack_set_visible_child([self castedGObject], [child castedGObject]);
}

- (void)setVisibleChildFullWithName:(OFString*)name transition:(GtkStackTransitionType)transition
{
	gtk_stack_set_visible_child_full([self castedGObject], [name UTF8String], transition);
}

- (void)setVisibleChildName:(OFString*)name
{
	gtk_stack_set_visible_child_name([self castedGObject], [name UTF8String]);
}


@end