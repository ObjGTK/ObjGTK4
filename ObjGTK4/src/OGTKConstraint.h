/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkConstraint` describes a constraint between attributes of two widgets,
 *  expressed as a linear equation.
 * 
 * The typical equation for a constraint is:
 * 
 * ```
 *   target.target_attr = source.source_attr × multiplier + constant
 * ```
 * 
 * Each `GtkConstraint` is part of a system that will be solved by a
 * [class@Gtk.ConstraintLayout] in order to allocate and position each
 * child widget or guide.
 * 
 * The source and target, as well as their attributes, of a `GtkConstraint`
 * instance are immutable after creation.
 *
 */
@interface OGTKConstraint : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithTarget:(gpointer)target targetAttribute:(GtkConstraintAttribute)targetAttribute relation:(GtkConstraintRelation)relation source:(gpointer)source sourceAttribute:(GtkConstraintAttribute)sourceAttribute multiplier:(double)multiplier constant:(double)constant strength:(int)strength;
- (instancetype)initConstantWithTarget:(gpointer)target targetAttribute:(GtkConstraintAttribute)targetAttribute relation:(GtkConstraintRelation)relation constant:(double)constant strength:(int)strength;

/**
 * Methods
 */

- (GtkConstraint*)castedGObject;

/**
 * Retrieves the constant factor added to the source attributes' value.
 *
 * @return a constant factor
 */
- (double)constant;

/**
 * Retrieves the multiplication factor applied to the source
 * attribute's value.
 *
 * @return a multiplication factor
 */
- (double)multiplier;

/**
 * The order relation between the terms of the constraint.
 *
 * @return a relation type
 */
- (GtkConstraintRelation)relation;

/**
 * Retrieves the [iface@Gtk.ConstraintTarget] used as the source for the
 * constraint.
 * 
 * If the source is set to `NULL` at creation, the constraint will use
 * the widget using the [class@Gtk.ConstraintLayout] as the source.
 *
 * @return the source of the constraint
 */
- (GtkConstraintTarget*)source;

/**
 * Retrieves the attribute of the source to be read by the constraint.
 *
 * @return the source's attribute
 */
- (GtkConstraintAttribute)sourceAttribute;

/**
 * Retrieves the strength of the constraint.
 *
 * @return the strength value
 */
- (int)strength;

/**
 * Retrieves the [iface@Gtk.ConstraintTarget] used as the target for
 * the constraint.
 * 
 * If the targe is set to `NULL` at creation, the constraint will use
 * the widget using the [class@Gtk.ConstraintLayout] as the target.
 *
 * @return a `GtkConstraintTarget`
 */
- (GtkConstraintTarget*)target;

/**
 * Retrieves the attribute of the target to be set by the constraint.
 *
 * @return the target's attribute
 */
- (GtkConstraintAttribute)targetAttribute;

/**
 * Checks whether the constraint is attached to a [class@Gtk.ConstraintLayout],
 * and it is contributing to the layout.
 *
 * @return `TRUE` if the constraint is attached
 */
- (bool)isAttached;

/**
 * Checks whether the constraint describes a relation between an attribute
 * on the [property@Gtk.Constraint:target] and a constant value.
 *
 * @return `TRUE` if the constraint is a constant relation
 */
- (bool)isConstant;

/**
 * Checks whether the constraint is a required relation for solving the
 * constraint layout.
 *
 * @return %TRUE if the constraint is required
 */
- (bool)isRequired;

@end