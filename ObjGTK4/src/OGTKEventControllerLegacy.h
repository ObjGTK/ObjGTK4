/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

/**
 * `GtkEventControllerLegacy` is an event controller that provides raw
 * access to the event stream.
 * 
 * It should only be used as a last resort if none of the other event
 * controllers or gestures do the job.
 *
 */
@interface OGTKEventControllerLegacy : OGTKEventController
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)eventControllerLegacy;

/**
 * Methods
 */

- (GtkEventControllerLegacy*)castedGObject;

@end