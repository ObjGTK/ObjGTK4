/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellArea.h"

#import "OGTKCellAreaContext.h"
#import "OGTKCellRenderer.h"
#import "OGTKSnapshot.h"
#import "OGTKWidget.h"

@implementation OGTKCellArea

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_AREA;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CELL_AREA);
	return gObjectClass;
}

+ (GParamSpec*)findCellPropertyWithPropertyName:(OFString*)propertyName
{
	GParamSpec* returnValue = (GParamSpec*)gtk_cell_area_class_find_cell_property((GtkCellAreaClass*)[self gObjectClass], [propertyName UTF8String]);

	return returnValue;
}

+ (void)installCellPropertyWithPropertyId:(guint)propertyId pspec:(GParamSpec*)pspec
{
	gtk_cell_area_class_install_cell_property((GtkCellAreaClass*)[self gObjectClass], propertyId, pspec);
}

+ (GParamSpec**)listCellPropertiesWithNproperties:(guint*)nproperties
{
	GParamSpec** returnValue = (GParamSpec**)gtk_cell_area_class_list_cell_properties((GtkCellAreaClass*)[self gObjectClass], nproperties);

	return returnValue;
}

- (GtkCellArea*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CELL_AREA, GtkCellArea);
}

- (bool)activateWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags editOnly:(bool)editOnly
{
	bool returnValue = (bool)gtk_cell_area_activate((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], cellArea, flags, editOnly);

	return returnValue;
}

- (bool)activateCellWithWidget:(OGTKWidget*)widget renderer:(OGTKCellRenderer*)renderer event:(GdkEvent*)event cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags
{
	bool returnValue = (bool)gtk_cell_area_activate_cell((GtkCellArea*)[self castedGObject], [widget castedGObject], [renderer castedGObject], event, cellArea, flags);

	return returnValue;
}

- (void)addWithRenderer:(OGTKCellRenderer*)renderer
{
	gtk_cell_area_add((GtkCellArea*)[self castedGObject], [renderer castedGObject]);
}

- (void)addFocusSiblingWithRenderer:(OGTKCellRenderer*)renderer sibling:(OGTKCellRenderer*)sibling
{
	gtk_cell_area_add_focus_sibling((GtkCellArea*)[self castedGObject], [renderer castedGObject], [sibling castedGObject]);
}

- (void)applyAttributesWithTreeModel:(GtkTreeModel*)treeModel iter:(GtkTreeIter*)iter isExpander:(bool)isExpander isExpanded:(bool)isExpanded
{
	gtk_cell_area_apply_attributes((GtkCellArea*)[self castedGObject], treeModel, iter, isExpander, isExpanded);
}

- (void)attributeConnectWithRenderer:(OGTKCellRenderer*)renderer attribute:(OFString*)attribute column:(int)column
{
	gtk_cell_area_attribute_connect((GtkCellArea*)[self castedGObject], [renderer castedGObject], [attribute UTF8String], column);
}

- (void)attributeDisconnectWithRenderer:(OGTKCellRenderer*)renderer attribute:(OFString*)attribute
{
	gtk_cell_area_attribute_disconnect((GtkCellArea*)[self castedGObject], [renderer castedGObject], [attribute UTF8String]);
}

- (int)attributeGetColumnWithRenderer:(OGTKCellRenderer*)renderer attribute:(OFString*)attribute
{
	int returnValue = (int)gtk_cell_area_attribute_get_column((GtkCellArea*)[self castedGObject], [renderer castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (void)cellGetPropertyWithRenderer:(OGTKCellRenderer*)renderer propertyName:(OFString*)propertyName value:(GValue*)value
{
	gtk_cell_area_cell_get_property((GtkCellArea*)[self castedGObject], [renderer castedGObject], [propertyName UTF8String], value);
}

- (void)cellGetValistWithRenderer:(OGTKCellRenderer*)renderer firstPropertyName:(OFString*)firstPropertyName varArgs:(va_list)varArgs
{
	gtk_cell_area_cell_get_valist((GtkCellArea*)[self castedGObject], [renderer castedGObject], [firstPropertyName UTF8String], varArgs);
}

- (void)cellSetPropertyWithRenderer:(OGTKCellRenderer*)renderer propertyName:(OFString*)propertyName value:(const GValue*)value
{
	gtk_cell_area_cell_set_property((GtkCellArea*)[self castedGObject], [renderer castedGObject], [propertyName UTF8String], value);
}

- (void)cellSetValistWithRenderer:(OGTKCellRenderer*)renderer firstPropertyName:(OFString*)firstPropertyName varArgs:(va_list)varArgs
{
	gtk_cell_area_cell_set_valist((GtkCellArea*)[self castedGObject], [renderer castedGObject], [firstPropertyName UTF8String], varArgs);
}

- (OGTKCellAreaContext*)copyContext:(OGTKCellAreaContext*)context
{
	GtkCellAreaContext* gobjectValue = gtk_cell_area_copy_context((GtkCellArea*)[self castedGObject], [context castedGObject]);

	OGTKCellAreaContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGTKCellAreaContext*)createContext
{
	GtkCellAreaContext* gobjectValue = gtk_cell_area_create_context((GtkCellArea*)[self castedGObject]);

	OGTKCellAreaContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (int)eventWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget event:(GdkEvent*)event cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags
{
	int returnValue = (int)gtk_cell_area_event((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], event, cellArea, flags);

	return returnValue;
}

- (bool)focusWithDirection:(GtkDirectionType)direction
{
	bool returnValue = (bool)gtk_cell_area_focus((GtkCellArea*)[self castedGObject], direction);

	return returnValue;
}

- (void)foreachWithCallback:(GtkCellCallback)callback callbackData:(gpointer)callbackData
{
	gtk_cell_area_foreach((GtkCellArea*)[self castedGObject], callback, callbackData);
}

- (void)foreachAllocWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea backgroundArea:(const GdkRectangle*)backgroundArea callback:(GtkCellAllocCallback)callback callbackData:(gpointer)callbackData
{
	gtk_cell_area_foreach_alloc((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], cellArea, backgroundArea, callback, callbackData);
}

- (void)cellAllocationWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget renderer:(OGTKCellRenderer*)renderer cellArea:(const GdkRectangle*)cellArea allocation:(GdkRectangle*)allocation
{
	gtk_cell_area_get_cell_allocation((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], [renderer castedGObject], cellArea, allocation);
}

- (OGTKCellRenderer*)cellAtPositionWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea x:(int)x y:(int)y allocArea:(GdkRectangle*)allocArea
{
	GtkCellRenderer* gobjectValue = gtk_cell_area_get_cell_at_position((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], cellArea, x, y, allocArea);

	OGTKCellRenderer* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)currentPathString
{
	const char* gobjectValue = gtk_cell_area_get_current_path_string((GtkCellArea*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkCellEditable*)editWidget
{
	GtkCellEditable* returnValue = (GtkCellEditable*)gtk_cell_area_get_edit_widget((GtkCellArea*)[self castedGObject]);

	return returnValue;
}

- (OGTKCellRenderer*)editedCell
{
	GtkCellRenderer* gobjectValue = gtk_cell_area_get_edited_cell((GtkCellArea*)[self castedGObject]);

	OGTKCellRenderer* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKCellRenderer*)focusCell
{
	GtkCellRenderer* gobjectValue = gtk_cell_area_get_focus_cell((GtkCellArea*)[self castedGObject]);

	OGTKCellRenderer* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKCellRenderer*)focusFromSiblingWithRenderer:(OGTKCellRenderer*)renderer
{
	GtkCellRenderer* gobjectValue = gtk_cell_area_get_focus_from_sibling((GtkCellArea*)[self castedGObject], [renderer castedGObject]);

	OGTKCellRenderer* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (const GList*)focusSiblingsWithRenderer:(OGTKCellRenderer*)renderer
{
	const GList* returnValue = (const GList*)gtk_cell_area_get_focus_siblings((GtkCellArea*)[self castedGObject], [renderer castedGObject]);

	return returnValue;
}

- (void)preferredHeightWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight
{
	gtk_cell_area_get_preferred_height((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], minimumHeight, naturalHeight);
}

- (void)preferredHeightForWidthWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget width:(int)width minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight
{
	gtk_cell_area_get_preferred_height_for_width((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], width, minimumHeight, naturalHeight);
}

- (void)preferredWidthWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth
{
	gtk_cell_area_get_preferred_width((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], minimumWidth, naturalWidth);
}

- (void)preferredWidthForHeightWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget height:(int)height minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth
{
	gtk_cell_area_get_preferred_width_for_height((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], height, minimumWidth, naturalWidth);
}

- (GtkSizeRequestMode)requestMode
{
	GtkSizeRequestMode returnValue = (GtkSizeRequestMode)gtk_cell_area_get_request_mode((GtkCellArea*)[self castedGObject]);

	return returnValue;
}

- (bool)hasRenderer:(OGTKCellRenderer*)renderer
{
	bool returnValue = (bool)gtk_cell_area_has_renderer((GtkCellArea*)[self castedGObject], [renderer castedGObject]);

	return returnValue;
}

- (void)innerCellAreaWithWidget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea innerArea:(GdkRectangle*)innerArea
{
	gtk_cell_area_inner_cell_area((GtkCellArea*)[self castedGObject], [widget castedGObject], cellArea, innerArea);
}

- (bool)isActivatable
{
	bool returnValue = (bool)gtk_cell_area_is_activatable((GtkCellArea*)[self castedGObject]);

	return returnValue;
}

- (bool)isFocusSiblingWithRenderer:(OGTKCellRenderer*)renderer sibling:(OGTKCellRenderer*)sibling
{
	bool returnValue = (bool)gtk_cell_area_is_focus_sibling((GtkCellArea*)[self castedGObject], [renderer castedGObject], [sibling castedGObject]);

	return returnValue;
}

- (void)removeWithRenderer:(OGTKCellRenderer*)renderer
{
	gtk_cell_area_remove((GtkCellArea*)[self castedGObject], [renderer castedGObject]);
}

- (void)removeFocusSiblingWithRenderer:(OGTKCellRenderer*)renderer sibling:(OGTKCellRenderer*)sibling
{
	gtk_cell_area_remove_focus_sibling((GtkCellArea*)[self castedGObject], [renderer castedGObject], [sibling castedGObject]);
}

- (void)requestRenderer:(OGTKCellRenderer*)renderer orientation:(GtkOrientation)orientation widget:(OGTKWidget*)widget forSize:(int)forSize minimumSize:(int*)minimumSize naturalSize:(int*)naturalSize
{
	gtk_cell_area_request_renderer((GtkCellArea*)[self castedGObject], [renderer castedGObject], orientation, [widget castedGObject], forSize, minimumSize, naturalSize);
}

- (void)setFocusCellWithRenderer:(OGTKCellRenderer*)renderer
{
	gtk_cell_area_set_focus_cell((GtkCellArea*)[self castedGObject], [renderer castedGObject]);
}

- (void)snapshotWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget snapshot:(OGTKSnapshot*)snapshot backgroundArea:(const GdkRectangle*)backgroundArea cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags paintFocus:(bool)paintFocus
{
	gtk_cell_area_snapshot((GtkCellArea*)[self castedGObject], [context castedGObject], [widget castedGObject], [snapshot castedGObject], backgroundArea, cellArea, flags, paintFocus);
}

- (void)stopEditingWithCanceled:(bool)canceled
{
	gtk_cell_area_stop_editing((GtkCellArea*)[self castedGObject], canceled);
}


@end