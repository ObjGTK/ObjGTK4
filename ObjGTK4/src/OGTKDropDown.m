/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDropDown.h"

#import "OGTKListItemFactory.h"

@implementation OGTKDropDown

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DROP_DOWN;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithModel:(GListModel*)model expression:(GtkExpression*)expression
{
	GtkDropDown* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drop_down_new(model, expression), GtkDropDown, GtkDropDown);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initWithStringsFromStrings:(const char* const*)strings
{
	GtkDropDown* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drop_down_new_from_strings(strings), GtkDropDown, GtkDropDown);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkDropDown*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkDropDown, GtkDropDown);
}

- (bool)enableSearch
{
	bool returnValue = (bool)gtk_drop_down_get_enable_search([self castedGObject]);

	return returnValue;
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = (GtkExpression*)gtk_drop_down_get_expression([self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)factory
{
	GtkListItemFactory* gobjectValue = gtk_drop_down_get_factory([self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListItemFactory*)headerFactory
{
	GtkListItemFactory* gobjectValue = gtk_drop_down_get_header_factory([self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListItemFactory*)listFactory
{
	GtkListItemFactory* gobjectValue = gtk_drop_down_get_list_factory([self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_drop_down_get_model([self castedGObject]);

	return returnValue;
}

- (GtkStringFilterMatchMode)searchMatchMode
{
	GtkStringFilterMatchMode returnValue = (GtkStringFilterMatchMode)gtk_drop_down_get_search_match_mode([self castedGObject]);

	return returnValue;
}

- (guint)selected
{
	guint returnValue = (guint)gtk_drop_down_get_selected([self castedGObject]);

	return returnValue;
}

- (gpointer)selectedItem
{
	gpointer returnValue = (gpointer)gtk_drop_down_get_selected_item([self castedGObject]);

	return returnValue;
}

- (bool)showArrow
{
	bool returnValue = (bool)gtk_drop_down_get_show_arrow([self castedGObject]);

	return returnValue;
}

- (void)setEnableSearch:(bool)enableSearch
{
	gtk_drop_down_set_enable_search([self castedGObject], enableSearch);
}

- (void)setExpression:(GtkExpression*)expression
{
	gtk_drop_down_set_expression([self castedGObject], expression);
}

- (void)setFactory:(OGTKListItemFactory*)factory
{
	gtk_drop_down_set_factory([self castedGObject], [factory castedGObject]);
}

- (void)setHeaderFactory:(OGTKListItemFactory*)factory
{
	gtk_drop_down_set_header_factory([self castedGObject], [factory castedGObject]);
}

- (void)setListFactory:(OGTKListItemFactory*)factory
{
	gtk_drop_down_set_list_factory([self castedGObject], [factory castedGObject]);
}

- (void)setModel:(GListModel*)model
{
	gtk_drop_down_set_model([self castedGObject], model);
}

- (void)setSearchMatchMode:(GtkStringFilterMatchMode)searchMatchMode
{
	gtk_drop_down_set_search_match_mode([self castedGObject], searchMatchMode);
}

- (void)setSelected:(guint)position
{
	gtk_drop_down_set_selected([self castedGObject], position);
}

- (void)setShowArrow:(bool)showArrow
{
	gtk_drop_down_set_show_arrow([self castedGObject], showArrow);
}


@end