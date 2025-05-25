/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDropDown.h"

#import "OGTKListItemFactory.h"

@implementation OGTKDropDown

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DROP_DOWN;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_DROP_DOWN);
	return gObjectClass;
}

+ (instancetype)dropDownWithModel:(GListModel*)model expression:(GtkExpression*)expression
{
	GtkDropDown* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drop_down_new(model, expression), GTK_TYPE_DROP_DOWN, GtkDropDown);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKDropDown* wrapperObject;
	@try {
		wrapperObject = [[OGTKDropDown alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)dropDownFromStrings:(const char* const*)strings
{
	GtkDropDown* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drop_down_new_from_strings(strings), GTK_TYPE_DROP_DOWN, GtkDropDown);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKDropDown* wrapperObject;
	@try {
		wrapperObject = [[OGTKDropDown alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkDropDown*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_DROP_DOWN, GtkDropDown);
}

- (bool)enableSearch
{
	bool returnValue = (bool)gtk_drop_down_get_enable_search((GtkDropDown*)[self castedGObject]);

	return returnValue;
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = (GtkExpression*)gtk_drop_down_get_expression((GtkDropDown*)[self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)factory
{
	GtkListItemFactory* gobjectValue = gtk_drop_down_get_factory((GtkDropDown*)[self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListItemFactory*)headerFactory
{
	GtkListItemFactory* gobjectValue = gtk_drop_down_get_header_factory((GtkDropDown*)[self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListItemFactory*)listFactory
{
	GtkListItemFactory* gobjectValue = gtk_drop_down_get_list_factory((GtkDropDown*)[self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_drop_down_get_model((GtkDropDown*)[self castedGObject]);

	return returnValue;
}

- (GtkStringFilterMatchMode)searchMatchMode
{
	GtkStringFilterMatchMode returnValue = (GtkStringFilterMatchMode)gtk_drop_down_get_search_match_mode((GtkDropDown*)[self castedGObject]);

	return returnValue;
}

- (guint)selected
{
	guint returnValue = (guint)gtk_drop_down_get_selected((GtkDropDown*)[self castedGObject]);

	return returnValue;
}

- (gpointer)selectedItem
{
	gpointer returnValue = (gpointer)gtk_drop_down_get_selected_item((GtkDropDown*)[self castedGObject]);

	return returnValue;
}

- (bool)showArrow
{
	bool returnValue = (bool)gtk_drop_down_get_show_arrow((GtkDropDown*)[self castedGObject]);

	return returnValue;
}

- (void)setEnableSearch:(bool)enableSearch
{
	gtk_drop_down_set_enable_search((GtkDropDown*)[self castedGObject], enableSearch);
}

- (void)setExpression:(GtkExpression*)expression
{
	gtk_drop_down_set_expression((GtkDropDown*)[self castedGObject], expression);
}

- (void)setFactory:(OGTKListItemFactory*)factory
{
	gtk_drop_down_set_factory((GtkDropDown*)[self castedGObject], [factory castedGObject]);
}

- (void)setHeaderFactory:(OGTKListItemFactory*)factory
{
	gtk_drop_down_set_header_factory((GtkDropDown*)[self castedGObject], [factory castedGObject]);
}

- (void)setListFactory:(OGTKListItemFactory*)factory
{
	gtk_drop_down_set_list_factory((GtkDropDown*)[self castedGObject], [factory castedGObject]);
}

- (void)setModel:(GListModel*)model
{
	gtk_drop_down_set_model((GtkDropDown*)[self castedGObject], model);
}

- (void)setSearchMatchMode:(GtkStringFilterMatchMode)searchMatchMode
{
	gtk_drop_down_set_search_match_mode((GtkDropDown*)[self castedGObject], searchMatchMode);
}

- (void)setSelectedWithPosition:(guint)position
{
	gtk_drop_down_set_selected((GtkDropDown*)[self castedGObject], position);
}

- (void)setShowArrow:(bool)showArrow
{
	gtk_drop_down_set_show_arrow((GtkDropDown*)[self castedGObject], showArrow);
}


@end