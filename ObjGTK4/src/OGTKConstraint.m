/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKConstraint.h"

@implementation OGTKConstraint

- (instancetype)initWithTarget:(gpointer)target targetAttribute:(GtkConstraintAttribute)targetAttribute relation:(GtkConstraintRelation)relation source:(gpointer)source sourceAttribute:(GtkConstraintAttribute)sourceAttribute multiplier:(double)multiplier constant:(double)constant strength:(int)strength
{
	GtkConstraint* gobjectValue = GTK_CONSTRAINT(gtk_constraint_new(target, targetAttribute, relation, source, sourceAttribute, multiplier, constant, strength));

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

- (instancetype)initConstantWithTarget:(gpointer)target targetAttribute:(GtkConstraintAttribute)targetAttribute relation:(GtkConstraintRelation)relation constant:(double)constant strength:(int)strength
{
	GtkConstraint* gobjectValue = GTK_CONSTRAINT(gtk_constraint_new_constant(target, targetAttribute, relation, constant, strength));

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

- (GtkConstraint*)castedGObject
{
	return GTK_CONSTRAINT([self gObject]);
}

- (double)constant
{
	double returnValue = gtk_constraint_get_constant([self castedGObject]);

	return returnValue;
}

- (double)multiplier
{
	double returnValue = gtk_constraint_get_multiplier([self castedGObject]);

	return returnValue;
}

- (GtkConstraintRelation)relation
{
	GtkConstraintRelation returnValue = gtk_constraint_get_relation([self castedGObject]);

	return returnValue;
}

- (GtkConstraintTarget*)source
{
	GtkConstraintTarget* returnValue = gtk_constraint_get_source([self castedGObject]);

	return returnValue;
}

- (GtkConstraintAttribute)sourceAttribute
{
	GtkConstraintAttribute returnValue = gtk_constraint_get_source_attribute([self castedGObject]);

	return returnValue;
}

- (int)strength
{
	int returnValue = gtk_constraint_get_strength([self castedGObject]);

	return returnValue;
}

- (GtkConstraintTarget*)target
{
	GtkConstraintTarget* returnValue = gtk_constraint_get_target([self castedGObject]);

	return returnValue;
}

- (GtkConstraintAttribute)targetAttribute
{
	GtkConstraintAttribute returnValue = gtk_constraint_get_target_attribute([self castedGObject]);

	return returnValue;
}

- (bool)isAttached
{
	bool returnValue = gtk_constraint_is_attached([self castedGObject]);

	return returnValue;
}

- (bool)isConstant
{
	bool returnValue = gtk_constraint_is_constant([self castedGObject]);

	return returnValue;
}

- (bool)isRequired
{
	bool returnValue = gtk_constraint_is_required([self castedGObject]);

	return returnValue;
}


@end