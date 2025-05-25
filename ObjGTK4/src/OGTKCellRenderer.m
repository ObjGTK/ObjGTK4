/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRenderer.h"

#import "OGTKSnapshot.h"
#import "OGTKWidget.h"

@implementation OGTKCellRenderer

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_RENDERER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CELL_RENDERER);
	return gObjectClass;
}

- (GtkCellRenderer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CELL_RENDERER, GtkCellRenderer);
}

- (bool)activateWithEvent:(GdkEvent*)event widget:(OGTKWidget*)widget path:(OFString*)path backgroundArea:(const GdkRectangle*)backgroundArea cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags
{
	bool returnValue = (bool)gtk_cell_renderer_activate((GtkCellRenderer*)[self castedGObject], event, [widget castedGObject], [path UTF8String], backgroundArea, cellArea, flags);

	return returnValue;
}

- (void)alignedAreaWithWidget:(OGTKWidget*)widget flags:(GtkCellRendererState)flags cellArea:(const GdkRectangle*)cellArea alignedArea:(GdkRectangle*)alignedArea
{
	gtk_cell_renderer_get_aligned_area((GtkCellRenderer*)[self castedGObject], [widget castedGObject], flags, cellArea, alignedArea);
}

- (void)alignmentWithXalign:(float*)xalign yalign:(float*)yalign
{
	gtk_cell_renderer_get_alignment((GtkCellRenderer*)[self castedGObject], xalign, yalign);
}

- (void)fixedSizeWithWidth:(int*)width height:(int*)height
{
	gtk_cell_renderer_get_fixed_size((GtkCellRenderer*)[self castedGObject], width, height);
}

- (bool)isExpanded
{
	bool returnValue = (bool)gtk_cell_renderer_get_is_expanded((GtkCellRenderer*)[self castedGObject]);

	return returnValue;
}

- (bool)isExpander
{
	bool returnValue = (bool)gtk_cell_renderer_get_is_expander((GtkCellRenderer*)[self castedGObject]);

	return returnValue;
}

- (void)paddingWithXpad:(int*)xpad ypad:(int*)ypad
{
	gtk_cell_renderer_get_padding((GtkCellRenderer*)[self castedGObject], xpad, ypad);
}

- (void)preferredHeightWithWidget:(OGTKWidget*)widget minimumSize:(int*)minimumSize naturalSize:(int*)naturalSize
{
	gtk_cell_renderer_get_preferred_height((GtkCellRenderer*)[self castedGObject], [widget castedGObject], minimumSize, naturalSize);
}

- (void)preferredHeightForWidthWithWidget:(OGTKWidget*)widget width:(int)width minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight
{
	gtk_cell_renderer_get_preferred_height_for_width((GtkCellRenderer*)[self castedGObject], [widget castedGObject], width, minimumHeight, naturalHeight);
}

- (void)preferredSizeWithWidget:(OGTKWidget*)widget minimumSize:(GtkRequisition*)minimumSize naturalSize:(GtkRequisition*)naturalSize
{
	gtk_cell_renderer_get_preferred_size((GtkCellRenderer*)[self castedGObject], [widget castedGObject], minimumSize, naturalSize);
}

- (void)preferredWidthWithWidget:(OGTKWidget*)widget minimumSize:(int*)minimumSize naturalSize:(int*)naturalSize
{
	gtk_cell_renderer_get_preferred_width((GtkCellRenderer*)[self castedGObject], [widget castedGObject], minimumSize, naturalSize);
}

- (void)preferredWidthForHeightWithWidget:(OGTKWidget*)widget height:(int)height minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth
{
	gtk_cell_renderer_get_preferred_width_for_height((GtkCellRenderer*)[self castedGObject], [widget castedGObject], height, minimumWidth, naturalWidth);
}

- (GtkSizeRequestMode)requestMode
{
	GtkSizeRequestMode returnValue = (GtkSizeRequestMode)gtk_cell_renderer_get_request_mode((GtkCellRenderer*)[self castedGObject]);

	return returnValue;
}

- (bool)sensitive
{
	bool returnValue = (bool)gtk_cell_renderer_get_sensitive((GtkCellRenderer*)[self castedGObject]);

	return returnValue;
}

- (GtkStateFlags)stateWithWidget:(OGTKWidget*)widget cellState:(GtkCellRendererState)cellState
{
	GtkStateFlags returnValue = (GtkStateFlags)gtk_cell_renderer_get_state((GtkCellRenderer*)[self castedGObject], [widget castedGObject], cellState);

	return returnValue;
}

- (bool)visible
{
	bool returnValue = (bool)gtk_cell_renderer_get_visible((GtkCellRenderer*)[self castedGObject]);

	return returnValue;
}

- (bool)isActivatable
{
	bool returnValue = (bool)gtk_cell_renderer_is_activatable((GtkCellRenderer*)[self castedGObject]);

	return returnValue;
}

- (void)setAlignmentWithXalign:(float)xalign yalign:(float)yalign
{
	gtk_cell_renderer_set_alignment((GtkCellRenderer*)[self castedGObject], xalign, yalign);
}

- (void)setFixedSizeWithWidth:(int)width height:(int)height
{
	gtk_cell_renderer_set_fixed_size((GtkCellRenderer*)[self castedGObject], width, height);
}

- (void)setIsExpanded:(bool)isExpanded
{
	gtk_cell_renderer_set_is_expanded((GtkCellRenderer*)[self castedGObject], isExpanded);
}

- (void)setIsExpander:(bool)isExpander
{
	gtk_cell_renderer_set_is_expander((GtkCellRenderer*)[self castedGObject], isExpander);
}

- (void)setPaddingWithXpad:(int)xpad ypad:(int)ypad
{
	gtk_cell_renderer_set_padding((GtkCellRenderer*)[self castedGObject], xpad, ypad);
}

- (void)setSensitive:(bool)sensitive
{
	gtk_cell_renderer_set_sensitive((GtkCellRenderer*)[self castedGObject], sensitive);
}

- (void)setVisible:(bool)visible
{
	gtk_cell_renderer_set_visible((GtkCellRenderer*)[self castedGObject], visible);
}

- (void)snapshotWithSnapshot:(OGTKSnapshot*)snapshot widget:(OGTKWidget*)widget backgroundArea:(const GdkRectangle*)backgroundArea cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags
{
	gtk_cell_renderer_snapshot((GtkCellRenderer*)[self castedGObject], [snapshot castedGObject], [widget castedGObject], backgroundArea, cellArea, flags);
}

- (GtkCellEditable*)startEditingWithEvent:(GdkEvent*)event widget:(OGTKWidget*)widget path:(OFString*)path backgroundArea:(const GdkRectangle*)backgroundArea cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags
{
	GtkCellEditable* returnValue = (GtkCellEditable*)gtk_cell_renderer_start_editing((GtkCellRenderer*)[self castedGObject], event, [widget castedGObject], [path UTF8String], backgroundArea, cellArea, flags);

	return returnValue;
}

- (void)stopEditingWithCanceled:(bool)canceled
{
	gtk_cell_renderer_stop_editing((GtkCellRenderer*)[self castedGObject], canceled);
}


@end