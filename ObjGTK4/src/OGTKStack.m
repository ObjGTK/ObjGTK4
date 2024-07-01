/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStack.h"

#import "OGTKStackPage.h"

@implementation OGTKStack

- (instancetype)init
{
	GtkStack* gobjectValue = GTK_STACK(gtk_stack_new());

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

- (GtkStack*)castedGObject
{
	return GTK_STACK([self gObject]);
}

- (OGTKStackPage*)addChild:(OGTKWidget*)child
{
	GtkStackPage* gobjectValue = GTK_STACK_PAGE(gtk_stack_add_child([self castedGObject], [child castedGObject]));

	OGTKStackPage* returnValue = [OGTKStackPage withGObject:gobjectValue];
	return returnValue;
}

- (OGTKStackPage*)addNamedWithChild:(OGTKWidget*)child name:(OFString*)name
{
	GtkStackPage* gobjectValue = GTK_STACK_PAGE(gtk_stack_add_named([self castedGObject], [child castedGObject], [name UTF8String]));

	OGTKStackPage* returnValue = [OGTKStackPage withGObject:gobjectValue];
	return returnValue;
}

- (OGTKStackPage*)addTitledWithChild:(OGTKWidget*)child name:(OFString*)name title:(OFString*)title
{
	GtkStackPage* gobjectValue = GTK_STACK_PAGE(gtk_stack_add_titled([self castedGObject], [child castedGObject], [name UTF8String], [title UTF8String]));

	OGTKStackPage* returnValue = [OGTKStackPage withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)childByName:(OFString*)name
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_stack_get_child_by_name([self castedGObject], [name UTF8String]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)hhomogeneous
{
	bool returnValue = gtk_stack_get_hhomogeneous([self castedGObject]);

	return returnValue;
}

- (bool)interpolateSize
{
	bool returnValue = gtk_stack_get_interpolate_size([self castedGObject]);

	return returnValue;
}

- (OGTKStackPage*)page:(OGTKWidget*)child
{
	GtkStackPage* gobjectValue = GTK_STACK_PAGE(gtk_stack_get_page([self castedGObject], [child castedGObject]));

	OGTKStackPage* returnValue = [OGTKStackPage withGObject:gobjectValue];
	return returnValue;
}

- (GtkSelectionModel*)pages
{
	GtkSelectionModel* returnValue = gtk_stack_get_pages([self castedGObject]);

	return returnValue;
}

- (guint)transitionDuration
{
	guint returnValue = gtk_stack_get_transition_duration([self castedGObject]);

	return returnValue;
}

- (bool)transitionRunning
{
	bool returnValue = gtk_stack_get_transition_running([self castedGObject]);

	return returnValue;
}

- (GtkStackTransitionType)transitionType
{
	GtkStackTransitionType returnValue = gtk_stack_get_transition_type([self castedGObject]);

	return returnValue;
}

- (bool)vhomogeneous
{
	bool returnValue = gtk_stack_get_vhomogeneous([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)visibleChild
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_stack_get_visible_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)visibleChildName
{
	const char* gobjectValue = gtk_stack_get_visible_child_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)remove:(OGTKWidget*)child
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