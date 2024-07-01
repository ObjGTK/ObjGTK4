/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * A `GtkSpinner` widget displays an icon-size spinning animation.
 * 
 * It is often used as an alternative to a [class@Gtk.ProgressBar]
 * for displaying indefinite activity, instead of actual progress.
 * 
 * ![An example GtkSpinner](spinner.png)
 * 
 * To start the animation, use [method@Gtk.Spinner.start], to stop it
 * use [method@Gtk.Spinner.stop].
 * 
 * # CSS nodes
 * 
 * `GtkSpinner` has a single CSS node with the name spinner.
 * When the animation is active, the :checked pseudoclass is
 * added to this node.
 *
 */
@interface OGTKSpinner : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkSpinner*)castedGObject;

/**
 * Returns whether the spinner is spinning.
 *
 * @return %TRUE if the spinner is active
 */
- (bool)spinning;

/**
 * Sets the activity of the spinner.
 *
 * @param spinning whether the spinner should be spinning
 */
- (void)setSpinning:(bool)spinning;

/**
 * Starts the animation of the spinner.
 *
 */
- (void)start;

/**
 * Stops the animation of the spinner.
 *
 */
- (void)stop;

@end