/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKConstraint.h"

@implementation OGTKConstraint

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CONSTRAINT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CONSTRAINT);
	return gObjectClass;
}

+ (instancetype)constraintWithTarget:(gpointer)target targetAttribute:(GtkConstraintAttribute)targetAttribute relation:(GtkConstraintRelation)relation source:(gpointer)source sourceAttribute:(GtkConstraintAttribute)sourceAttribute multiplier:(double)multiplier constant:(double)constant strength:(int)strength
{
	GtkConstraint* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_constraint_new(target, targetAttribute, relation, source, sourceAttribute, multiplier, constant, strength), GTK_TYPE_CONSTRAINT, GtkConstraint);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKConstraint* wrapperObject;
	@try {
		wrapperObject = [[OGTKConstraint alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)constraintConstantWithTarget:(gpointer)target targetAttribute:(GtkConstraintAttribute)targetAttribute relation:(GtkConstraintRelation)relation constant:(double)constant strength:(int)strength
{
	GtkConstraint* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_constraint_new_constant(target, targetAttribute, relation, constant, strength), GTK_TYPE_CONSTRAINT, GtkConstraint);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKConstraint* wrapperObject;
	@try {
		wrapperObject = [[OGTKConstraint alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkConstraint*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CONSTRAINT, GtkConstraint);
}

- (double)constant
{
	double returnValue = (double)gtk_constraint_get_constant((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (double)multiplier
{
	double returnValue = (double)gtk_constraint_get_multiplier((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (GtkConstraintRelation)relation
{
	GtkConstraintRelation returnValue = (GtkConstraintRelation)gtk_constraint_get_relation((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (GtkConstraintTarget*)source
{
	GtkConstraintTarget* returnValue = (GtkConstraintTarget*)gtk_constraint_get_source((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (GtkConstraintAttribute)sourceAttribute
{
	GtkConstraintAttribute returnValue = (GtkConstraintAttribute)gtk_constraint_get_source_attribute((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (int)strength
{
	int returnValue = (int)gtk_constraint_get_strength((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (GtkConstraintTarget*)target
{
	GtkConstraintTarget* returnValue = (GtkConstraintTarget*)gtk_constraint_get_target((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (GtkConstraintAttribute)targetAttribute
{
	GtkConstraintAttribute returnValue = (GtkConstraintAttribute)gtk_constraint_get_target_attribute((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (bool)isAttached
{
	bool returnValue = (bool)gtk_constraint_is_attached((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (bool)isConstant
{
	bool returnValue = (bool)gtk_constraint_is_constant((GtkConstraint*)[self castedGObject]);

	return returnValue;
}

- (bool)isRequired
{
	bool returnValue = (bool)gtk_constraint_is_required((GtkConstraint*)[self castedGObject]);

	return returnValue;
}


@end