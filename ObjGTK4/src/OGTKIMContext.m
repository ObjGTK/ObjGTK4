/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIMContext.h"

#import <OGdk4/OGdkDevice.h>
#import <OGdk4/OGdkSurface.h>
#import "OGTKWidget.h"

@implementation OGTKIMContext

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_IM_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_IM_CONTEXT);
	return gObjectClass;
}

- (GtkIMContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_IM_CONTEXT, GtkIMContext);
}

- (bool)activateOskWithEvent:(GdkEvent*)event
{
	bool returnValue = (bool)gtk_im_context_activate_osk((GtkIMContext*)[self castedGObject], event);

	return returnValue;
}

- (bool)deleteSurroundingWithOffset:(int)offset nchars:(int)nchars
{
	bool returnValue = (bool)gtk_im_context_delete_surrounding((GtkIMContext*)[self castedGObject], offset, nchars);

	return returnValue;
}

- (bool)filterKeyWithPress:(bool)press surface:(OGdkSurface*)surface device:(OGdkDevice*)device time:(guint32)time keycode:(guint)keycode state:(GdkModifierType)state group:(int)group
{
	bool returnValue = (bool)gtk_im_context_filter_key((GtkIMContext*)[self castedGObject], press, [surface castedGObject], [device castedGObject], time, keycode, state, group);

	return returnValue;
}

- (bool)filterKeypressWithEvent:(GdkEvent*)event
{
	bool returnValue = (bool)gtk_im_context_filter_keypress((GtkIMContext*)[self castedGObject], event);

	return returnValue;
}

- (void)focusIn
{
	gtk_im_context_focus_in((GtkIMContext*)[self castedGObject]);
}

- (void)focusOut
{
	gtk_im_context_focus_out((GtkIMContext*)[self castedGObject]);
}

- (void)preeditString:(char**)str attrs:(PangoAttrList**)attrs cursorPos:(int*)cursorPos
{
	gtk_im_context_get_preedit_string((GtkIMContext*)[self castedGObject], str, attrs, cursorPos);
}

- (bool)surroundingWithText:(char**)text cursorIndex:(int*)cursorIndex
{
	bool returnValue = (bool)gtk_im_context_get_surrounding((GtkIMContext*)[self castedGObject], text, cursorIndex);

	return returnValue;
}

- (bool)surroundingWithSelectionWithText:(char**)text cursorIndex:(int*)cursorIndex anchorIndex:(int*)anchorIndex
{
	bool returnValue = (bool)gtk_im_context_get_surrounding_with_selection((GtkIMContext*)[self castedGObject], text, cursorIndex, anchorIndex);

	return returnValue;
}

- (void)reset
{
	gtk_im_context_reset((GtkIMContext*)[self castedGObject]);
}

- (void)setClientWidget:(OGTKWidget*)widget
{
	gtk_im_context_set_client_widget((GtkIMContext*)[self castedGObject], [widget castedGObject]);
}

- (void)setCursorLocationWithArea:(const GdkRectangle*)area
{
	gtk_im_context_set_cursor_location((GtkIMContext*)[self castedGObject], area);
}

- (void)setSurroundingWithText:(OFString*)text len:(int)len cursorIndex:(int)cursorIndex
{
	gtk_im_context_set_surrounding((GtkIMContext*)[self castedGObject], [text UTF8String], len, cursorIndex);
}

- (void)setSurroundingWithSelectionWithText:(OFString*)text len:(int)len cursorIndex:(int)cursorIndex anchorIndex:(int)anchorIndex
{
	gtk_im_context_set_surrounding_with_selection((GtkIMContext*)[self castedGObject], [text UTF8String], len, cursorIndex, anchorIndex);
}

- (void)setUsePreedit:(bool)usePreedit
{
	gtk_im_context_set_use_preedit((GtkIMContext*)[self castedGObject], usePreedit);
}


@end