/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellArea.h"

#import "OGTKSnapshot.h"
#import "OGTKWidget.h"
#import "OGTKCellRenderer.h"
#import "OGTKCellAreaContext.h"

@implementation OGTKCellArea

- (GtkCellArea*)castedGObject
{
	return GTK_CELL_AREA([self gObject]);
}

- (bool)activateWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags editOnly:(bool)editOnly
{
	bool returnValue = gtk_cell_area_activate([self castedGObject], [context castedGObject], [widget castedGObject], cellArea, flags, editOnly);

	return returnValue;
}

- (bool)activateCellWithWidget:(OGTKWidget*)widget renderer:(OGTKCellRenderer*)renderer event:(GdkEvent*)event cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags
{
	bool returnValue = gtk_cell_area_activate_cell([self castedGObject], [widget castedGObject], [renderer castedGObject], event, cellArea, flags);

	return returnValue;
}

- (void)add:(OGTKCellRenderer*)renderer
{
	gtk_cell_area_add([self castedGObject], [renderer castedGObject]);
}

- (void)addFocusSiblingWithRenderer:(OGTKCellRenderer*)renderer sibling:(OGTKCellRenderer*)sibling
{
	gtk_cell_area_add_focus_sibling([self castedGObject], [renderer castedGObject], [sibling castedGObject]);
}

- (void)applyAttributesWithTreeModel:(GtkTreeModel*)treeModel iter:(GtkTreeIter*)iter isExpander:(bool)isExpander isExpanded:(bool)isExpanded
{
	gtk_cell_area_apply_attributes([self castedGObject], treeModel, iter, isExpander, isExpanded);
}

- (void)attributeConnectWithRenderer:(OGTKCellRenderer*)renderer attribute:(OFString*)attribute column:(int)column
{
	gtk_cell_area_attribute_connect([self castedGObject], [renderer castedGObject], [attribute UTF8String], column);
}

- (void)attributeDisconnectWithRenderer:(OGTKCellRenderer*)renderer attribute:(OFString*)attribute
{
	gtk_cell_area_attribute_disconnect([self castedGObject], [renderer castedGObject], [attribute UTF8String]);
}

- (int)attributeGetColumnWithRenderer:(OGTKCellRenderer*)renderer attribute:(OFString*)attribute
{
	int returnValue = gtk_cell_area_attribute_get_column([self castedGObject], [renderer castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (void)cellGetPropertyWithRenderer:(OGTKCellRenderer*)renderer propertyName:(OFString*)propertyName value:(GValue*)value
{
	gtk_cell_area_cell_get_property([self castedGObject], [renderer castedGObject], [propertyName UTF8String], value);
}

- (void)cellGetValistWithRenderer:(OGTKCellRenderer*)renderer firstPropertyName:(OFString*)firstPropertyName varArgs:(va_list)varArgs
{
	gtk_cell_area_cell_get_valist([self castedGObject], [renderer castedGObject], [firstPropertyName UTF8String], varArgs);
}

- (void)cellSetPropertyWithRenderer:(OGTKCellRenderer*)renderer propertyName:(OFString*)propertyName value:(const GValue*)value
{
	gtk_cell_area_cell_set_property([self castedGObject], [renderer castedGObject], [propertyName UTF8String], value);
}

- (void)cellSetValistWithRenderer:(OGTKCellRenderer*)renderer firstPropertyName:(OFString*)firstPropertyName varArgs:(va_list)varArgs
{
	gtk_cell_area_cell_set_valist([self castedGObject], [renderer castedGObject], [firstPropertyName UTF8String], varArgs);
}

- (OGTKCellAreaContext*)copyContext:(OGTKCellAreaContext*)context
{
	GtkCellAreaContext* gobjectValue = GTK_CELL_AREA_CONTEXT(gtk_cell_area_copy_context([self castedGObject], [context castedGObject]));

	OGTKCellAreaContext* returnValue = [OGTKCellAreaContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGTKCellAreaContext*)createContext
{
	GtkCellAreaContext* gobjectValue = GTK_CELL_AREA_CONTEXT(gtk_cell_area_create_context([self castedGObject]));

	OGTKCellAreaContext* returnValue = [OGTKCellAreaContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (int)eventWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget event:(GdkEvent*)event cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags
{
	int returnValue = gtk_cell_area_event([self castedGObject], [context castedGObject], [widget castedGObject], event, cellArea, flags);

	return returnValue;
}

- (bool)focus:(GtkDirectionType)direction
{
	bool returnValue = gtk_cell_area_focus([self castedGObject], direction);

	return returnValue;
}

- (void)foreachWithCallback:(GtkCellCallback)callback callbackData:(gpointer)callbackData
{
	gtk_cell_area_foreach([self castedGObject], callback, callbackData);
}

- (void)foreachAllocWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea backgroundArea:(const GdkRectangle*)backgroundArea callback:(GtkCellAllocCallback)callback callbackData:(gpointer)callbackData
{
	gtk_cell_area_foreach_alloc([self castedGObject], [context castedGObject], [widget castedGObject], cellArea, backgroundArea, callback, callbackData);
}

- (void)cellAllocationWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget renderer:(OGTKCellRenderer*)renderer cellArea:(const GdkRectangle*)cellArea allocation:(GdkRectangle*)allocation
{
	gtk_cell_area_get_cell_allocation([self castedGObject], [context castedGObject], [widget castedGObject], [renderer castedGObject], cellArea, allocation);
}

- (OGTKCellRenderer*)cellAtPositionWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea x:(int)x y:(int)y allocArea:(GdkRectangle*)allocArea
{
	GtkCellRenderer* gobjectValue = GTK_CELL_RENDERER(gtk_cell_area_get_cell_at_position([self castedGObject], [context castedGObject], [widget castedGObject], cellArea, x, y, allocArea));

	OGTKCellRenderer* returnValue = [OGTKCellRenderer withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)currentPathString
{
	const char* gobjectValue = gtk_cell_area_get_current_path_string([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkCellEditable*)editWidget
{
	GtkCellEditable* returnValue = gtk_cell_area_get_edit_widget([self castedGObject]);

	return returnValue;
}

- (OGTKCellRenderer*)editedCell
{
	GtkCellRenderer* gobjectValue = GTK_CELL_RENDERER(gtk_cell_area_get_edited_cell([self castedGObject]));

	OGTKCellRenderer* returnValue = [OGTKCellRenderer withGObject:gobjectValue];
	return returnValue;
}

- (OGTKCellRenderer*)focusCell
{
	GtkCellRenderer* gobjectValue = GTK_CELL_RENDERER(gtk_cell_area_get_focus_cell([self castedGObject]));

	OGTKCellRenderer* returnValue = [OGTKCellRenderer withGObject:gobjectValue];
	return returnValue;
}

- (OGTKCellRenderer*)focusFromSibling:(OGTKCellRenderer*)renderer
{
	GtkCellRenderer* gobjectValue = GTK_CELL_RENDERER(gtk_cell_area_get_focus_from_sibling([self castedGObject], [renderer castedGObject]));

	OGTKCellRenderer* returnValue = [OGTKCellRenderer withGObject:gobjectValue];
	return returnValue;
}

- (const GList*)focusSiblings:(OGTKCellRenderer*)renderer
{
	const GList* returnValue = gtk_cell_area_get_focus_siblings([self castedGObject], [renderer castedGObject]);

	return returnValue;
}

- (void)preferredHeightWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight
{
	gtk_cell_area_get_preferred_height([self castedGObject], [context castedGObject], [widget castedGObject], minimumHeight, naturalHeight);
}

- (void)preferredHeightForWidthWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget width:(int)width minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight
{
	gtk_cell_area_get_preferred_height_for_width([self castedGObject], [context castedGObject], [widget castedGObject], width, minimumHeight, naturalHeight);
}

- (void)preferredWidthWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth
{
	gtk_cell_area_get_preferred_width([self castedGObject], [context castedGObject], [widget castedGObject], minimumWidth, naturalWidth);
}

- (void)preferredWidthForHeightWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget height:(int)height minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth
{
	gtk_cell_area_get_preferred_width_for_height([self castedGObject], [context castedGObject], [widget castedGObject], height, minimumWidth, naturalWidth);
}

- (GtkSizeRequestMode)requestMode
{
	GtkSizeRequestMode returnValue = gtk_cell_area_get_request_mode([self castedGObject]);

	return returnValue;
}

- (bool)hasRenderer:(OGTKCellRenderer*)renderer
{
	bool returnValue = gtk_cell_area_has_renderer([self castedGObject], [renderer castedGObject]);

	return returnValue;
}

- (void)innerCellAreaWithWidget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea innerArea:(GdkRectangle*)innerArea
{
	gtk_cell_area_inner_cell_area([self castedGObject], [widget castedGObject], cellArea, innerArea);
}

- (bool)isActivatable
{
	bool returnValue = gtk_cell_area_is_activatable([self castedGObject]);

	return returnValue;
}

- (bool)isFocusSiblingWithRenderer:(OGTKCellRenderer*)renderer sibling:(OGTKCellRenderer*)sibling
{
	bool returnValue = gtk_cell_area_is_focus_sibling([self castedGObject], [renderer castedGObject], [sibling castedGObject]);

	return returnValue;
}

- (void)remove:(OGTKCellRenderer*)renderer
{
	gtk_cell_area_remove([self castedGObject], [renderer castedGObject]);
}

- (void)removeFocusSiblingWithRenderer:(OGTKCellRenderer*)renderer sibling:(OGTKCellRenderer*)sibling
{
	gtk_cell_area_remove_focus_sibling([self castedGObject], [renderer castedGObject], [sibling castedGObject]);
}

- (void)requestRendererWithRenderer:(OGTKCellRenderer*)renderer orientation:(GtkOrientation)orientation widget:(OGTKWidget*)widget forSize:(int)forSize minimumSize:(int*)minimumSize naturalSize:(int*)naturalSize
{
	gtk_cell_area_request_renderer([self castedGObject], [renderer castedGObject], orientation, [widget castedGObject], forSize, minimumSize, naturalSize);
}

- (void)setFocusCell:(OGTKCellRenderer*)renderer
{
	gtk_cell_area_set_focus_cell([self castedGObject], [renderer castedGObject]);
}

- (void)snapshotWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget snapshot:(OGTKSnapshot*)snapshot backgroundArea:(const GdkRectangle*)backgroundArea cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags paintFocus:(bool)paintFocus
{
	gtk_cell_area_snapshot([self castedGObject], [context castedGObject], [widget castedGObject], [snapshot castedGObject], backgroundArea, cellArea, flags, paintFocus);
}

- (void)stopEditing:(bool)canceled
{
	gtk_cell_area_stop_editing([self castedGObject], canceled);
}


@end