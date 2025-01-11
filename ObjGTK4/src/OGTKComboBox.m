/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKComboBox.h"

#import <OGdk4/OGdkDevice.h>

@implementation OGTKComboBox

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COMBO_BOX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)comboBox
{
	GtkComboBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_combo_box_new(), GtkComboBox, GtkComboBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKComboBox* wrapperObject;
	@try {
		wrapperObject = [[OGTKComboBox alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)comboBoxWithEntry
{
	GtkComboBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_combo_box_new_with_entry(), GtkComboBox, GtkComboBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKComboBox* wrapperObject;
	@try {
		wrapperObject = [[OGTKComboBox alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)comboBoxWithModel:(GtkTreeModel*)model
{
	GtkComboBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_combo_box_new_with_model(model), GtkComboBox, GtkComboBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKComboBox* wrapperObject;
	@try {
		wrapperObject = [[OGTKComboBox alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)comboBoxWithModelAndEntry:(GtkTreeModel*)model
{
	GtkComboBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_combo_box_new_with_model_and_entry(model), GtkComboBox, GtkComboBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKComboBox* wrapperObject;
	@try {
		wrapperObject = [[OGTKComboBox alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkComboBox*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkComboBox, GtkComboBox);
}

- (int)active
{
	int returnValue = (int)gtk_combo_box_get_active([self castedGObject]);

	return returnValue;
}

- (OFString*)activeId
{
	const char* gobjectValue = gtk_combo_box_get_active_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)activeIter:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_combo_box_get_active_iter([self castedGObject], iter);

	return returnValue;
}

- (GtkSensitivityType)buttonSensitivity
{
	GtkSensitivityType returnValue = (GtkSensitivityType)gtk_combo_box_get_button_sensitivity([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_combo_box_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)entryTextColumn
{
	int returnValue = (int)gtk_combo_box_get_entry_text_column([self castedGObject]);

	return returnValue;
}

- (bool)hasEntry
{
	bool returnValue = (bool)gtk_combo_box_get_has_entry([self castedGObject]);

	return returnValue;
}

- (int)idColumn
{
	int returnValue = (int)gtk_combo_box_get_id_column([self castedGObject]);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = (GtkTreeModel*)gtk_combo_box_get_model([self castedGObject]);

	return returnValue;
}

- (bool)popupFixedWidth
{
	bool returnValue = (bool)gtk_combo_box_get_popup_fixed_width([self castedGObject]);

	return returnValue;
}

- (GtkTreeViewRowSeparatorFunc)rowSeparatorFunc
{
	GtkTreeViewRowSeparatorFunc returnValue = (GtkTreeViewRowSeparatorFunc)gtk_combo_box_get_row_separator_func([self castedGObject]);

	return returnValue;
}

- (void)popdown
{
	gtk_combo_box_popdown([self castedGObject]);
}

- (void)popup
{
	gtk_combo_box_popup([self castedGObject]);
}

- (void)popupForDevice:(OGdkDevice*)device
{
	gtk_combo_box_popup_for_device([self castedGObject], [device castedGObject]);
}

- (void)setActive:(int)index
{
	gtk_combo_box_set_active([self castedGObject], index);
}

- (bool)setActiveId:(OFString*)activeId
{
	bool returnValue = (bool)gtk_combo_box_set_active_id([self castedGObject], [activeId UTF8String]);

	return returnValue;
}

- (void)setActiveIter:(GtkTreeIter*)iter
{
	gtk_combo_box_set_active_iter([self castedGObject], iter);
}

- (void)setButtonSensitivity:(GtkSensitivityType)sensitivity
{
	gtk_combo_box_set_button_sensitivity([self castedGObject], sensitivity);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_combo_box_set_child([self castedGObject], [child castedGObject]);
}

- (void)setEntryTextColumn:(int)textColumn
{
	gtk_combo_box_set_entry_text_column([self castedGObject], textColumn);
}

- (void)setIdColumn:(int)idColumn
{
	gtk_combo_box_set_id_column([self castedGObject], idColumn);
}

- (void)setModel:(GtkTreeModel*)model
{
	gtk_combo_box_set_model([self castedGObject], model);
}

- (void)setPopupFixedWidth:(bool)fixed
{
	gtk_combo_box_set_popup_fixed_width([self castedGObject], fixed);
}

- (void)setRowSeparatorFuncWithFunc:(GtkTreeViewRowSeparatorFunc)func data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	gtk_combo_box_set_row_separator_func([self castedGObject], func, data, destroy);
}


@end