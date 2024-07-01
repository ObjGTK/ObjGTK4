/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkShortcutLabel` displays a single keyboard shortcut or gesture.
 * 
 * The main use case for `GtkShortcutLabel` is inside a [class@Gtk.ShortcutsWindow].
 *
 */
@interface OGTKShortcutLabel : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)accelerator;

/**
 * Methods
 */

- (GtkShortcutLabel*)castedGObject;

/**
 * Retrieves the current accelerator of @self.
 *
 * @return the current accelerator.
 */
- (OFString*)accelerator;

/**
 * Retrieves the text that is displayed when no accelerator is set.
 *
 * @return the current text displayed when no
 * accelerator is set.
 */
- (OFString*)disabledText;

/**
 * Sets the accelerator to be displayed by @self.
 *
 * @param accelerator the new accelerator
 */
- (void)setAccelerator:(OFString*)accelerator;

/**
 * Sets the text to be displayed by @self when no accelerator is set.
 *
 * @param disabledText the text to be displayed when no accelerator is set
 */
- (void)setDisabledText:(OFString*)disabledText;

@end