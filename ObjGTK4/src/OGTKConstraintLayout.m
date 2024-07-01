/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKConstraintLayout.h"

#import "OGTKConstraintGuide.h"
#import "OGTKConstraint.h"

@implementation OGTKConstraintLayout

- (instancetype)init
{
	GtkConstraintLayout* gobjectValue = GTK_CONSTRAINT_LAYOUT(gtk_constraint_layout_new());

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

- (GtkConstraintLayout*)castedGObject
{
	return GTK_CONSTRAINT_LAYOUT([self gObject]);
}

- (void)addConstraint:(OGTKConstraint*)constraint
{
	gtk_constraint_layout_add_constraint([self castedGObject], [constraint castedGObject]);
}

- (GList*)addConstraintsFromDescriptionvWithLines:(const char* const*)lines nlines:(gsize)nlines hspacing:(int)hspacing vspacing:(int)vspacing views:(GHashTable*)views
{
	GError* err = NULL;

	GList* returnValue = gtk_constraint_layout_add_constraints_from_descriptionv([self castedGObject], lines, nlines, hspacing, vspacing, views, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)addGuide:(OGTKConstraintGuide*)guide
{
	gtk_constraint_layout_add_guide([self castedGObject], [guide castedGObject]);
}

- (GListModel*)observeConstraints
{
	GListModel* returnValue = gtk_constraint_layout_observe_constraints([self castedGObject]);

	return returnValue;
}

- (GListModel*)observeGuides
{
	GListModel* returnValue = gtk_constraint_layout_observe_guides([self castedGObject]);

	return returnValue;
}

- (void)removeAllConstraints
{
	gtk_constraint_layout_remove_all_constraints([self castedGObject]);
}

- (void)removeConstraint:(OGTKConstraint*)constraint
{
	gtk_constraint_layout_remove_constraint([self castedGObject], [constraint castedGObject]);
}

- (void)removeGuide:(OGTKConstraintGuide*)guide
{
	gtk_constraint_layout_remove_guide([self castedGObject], [guide castedGObject]);
}


@end