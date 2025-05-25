/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStack.h"

#import "OGTKStackPage.h"

@implementation OGTKStack

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STACK;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_STACK);
	return gObjectClass;
}

+ (instancetype)stack
{
	GtkStack* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_stack_new(), GTK_TYPE_STACK, GtkStack);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_STACK, GtkStack);
}

- (OGTKStackPage*)addChild:(OGTKWidget*)child
{
	GtkStackPage* gobjectValue = gtk_stack_add_child((GtkStack*)[self castedGObject], [child castedGObject]);

	OGTKStackPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKStackPage*)addNamedWithChild:(OGTKWidget*)child name:(OFString*)name
{
	GtkStackPage* gobjectValue = gtk_stack_add_named((GtkStack*)[self castedGObject], [child castedGObject], [name UTF8String]);

	OGTKStackPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKStackPage*)addTitledWithChild:(OGTKWidget*)child name:(OFString*)name title:(OFString*)title
{
	GtkStackPage* gobjectValue = gtk_stack_add_titled((GtkStack*)[self castedGObject], [child castedGObject], [name UTF8String], [title UTF8String]);

	OGTKStackPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)childByName:(OFString*)name
{
	GtkWidget* gobjectValue = gtk_stack_get_child_by_name((GtkStack*)[self castedGObject], [name UTF8String]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hhomogeneous
{
	bool returnValue = (bool)gtk_stack_get_hhomogeneous((GtkStack*)[self castedGObject]);

	return returnValue;
}

- (bool)interpolateSize
{
	bool returnValue = (bool)gtk_stack_get_interpolate_size((GtkStack*)[self castedGObject]);

	return returnValue;
}

- (OGTKStackPage*)pageWithChild:(OGTKWidget*)child
{
	GtkStackPage* gobjectValue = gtk_stack_get_page((GtkStack*)[self castedGObject], [child castedGObject]);

	OGTKStackPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkSelectionModel*)pages
{
	GtkSelectionModel* returnValue = (GtkSelectionModel*)gtk_stack_get_pages((GtkStack*)[self castedGObject]);

	return returnValue;
}

- (guint)transitionDuration
{
	guint returnValue = (guint)gtk_stack_get_transition_duration((GtkStack*)[self castedGObject]);

	return returnValue;
}

- (bool)transitionRunning
{
	bool returnValue = (bool)gtk_stack_get_transition_running((GtkStack*)[self castedGObject]);

	return returnValue;
}

- (GtkStackTransitionType)transitionType
{
	GtkStackTransitionType returnValue = (GtkStackTransitionType)gtk_stack_get_transition_type((GtkStack*)[self castedGObject]);

	return returnValue;
}

- (bool)vhomogeneous
{
	bool returnValue = (bool)gtk_stack_get_vhomogeneous((GtkStack*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)visibleChild
{
	GtkWidget* gobjectValue = gtk_stack_get_visible_child((GtkStack*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)visibleChildName
{
	const char* gobjectValue = gtk_stack_get_visible_child_name((GtkStack*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)removeWithChild:(OGTKWidget*)child
{
	gtk_stack_remove((GtkStack*)[self castedGObject], [child castedGObject]);
}

- (void)setHhomogeneous:(bool)hhomogeneous
{
	gtk_stack_set_hhomogeneous((GtkStack*)[self castedGObject], hhomogeneous);
}

- (void)setInterpolateSize:(bool)interpolateSize
{
	gtk_stack_set_interpolate_size((GtkStack*)[self castedGObject], interpolateSize);
}

- (void)setTransitionDuration:(guint)duration
{
	gtk_stack_set_transition_duration((GtkStack*)[self castedGObject], duration);
}

- (void)setTransitionType:(GtkStackTransitionType)transition
{
	gtk_stack_set_transition_type((GtkStack*)[self castedGObject], transition);
}

- (void)setVhomogeneous:(bool)vhomogeneous
{
	gtk_stack_set_vhomogeneous((GtkStack*)[self castedGObject], vhomogeneous);
}

- (void)setVisibleChild:(OGTKWidget*)child
{
	gtk_stack_set_visible_child((GtkStack*)[self castedGObject], [child castedGObject]);
}

- (void)setVisibleChildFullWithName:(OFString*)name transition:(GtkStackTransitionType)transition
{
	gtk_stack_set_visible_child_full((GtkStack*)[self castedGObject], [name UTF8String], transition);
}

- (void)setVisibleChildName:(OFString*)name
{
	gtk_stack_set_visible_child_name((GtkStack*)[self castedGObject], [name UTF8String]);
}


@end