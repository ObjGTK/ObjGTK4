/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutAction.h"

/**
 * A `GtkShortcut`Action that emits a signal.
 * 
 * Signals that are used in this way are referred to as keybinding signals,
 * and they are expected to be defined with the %G_SIGNAL_ACTION flag.
 *
 */
@interface OGTKSignalAction : OGTKShortcutAction
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)signalName;

/**
 * Methods
 */

- (GtkSignalAction*)castedGObject;

/**
 * Returns the name of the signal that will be emitted.
 *
 * @return the name of the signal to emit
 */
- (OFString*)signalName;

@end