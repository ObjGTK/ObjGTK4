/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDropDown.h"

#import "OGTKListItemFactory.h"

@implementation OGTKDropDown

- (instancetype)initWithModel:(GListModel*)model expression:(GtkExpression*)expression
{
	GtkDropDown* gobjectValue = GTK_DROP_DOWN(gtk_drop_down_new(model, expression));

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

- (instancetype)initFromStrings:(const char* const*)strings
{
	GtkDropDown* gobjectValue = GTK_DROP_DOWN(gtk_drop_down_new_from_strings(strings));

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
	return GTK_DROP_DOWN([self gObject]);
}

- (bool)enableSearch
{
	bool returnValue = gtk_drop_down_get_enable_search([self castedGObject]);

	return returnValue;
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = gtk_drop_down_get_expression([self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)factory
{
	GtkListItemFactory* gobjectValue = GTK_LIST_ITEM_FACTORY(gtk_drop_down_get_factory([self castedGObject]));

	OGTKListItemFactory* returnValue = [OGTKListItemFactory withGObject:gobjectValue];
	return returnValue;
}

- (OGTKListItemFactory*)listFactory
{
	GtkListItemFactory* gobjectValue = GTK_LIST_ITEM_FACTORY(gtk_drop_down_get_list_factory([self castedGObject]));

	OGTKListItemFactory* returnValue = [OGTKListItemFactory withGObject:gobjectValue];
	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = gtk_drop_down_get_model([self castedGObject]);

	return returnValue;
}

- (guint)selected
{
	guint returnValue = gtk_drop_down_get_selected([self castedGObject]);

	return returnValue;
}

- (gpointer)selectedItem
{
	gpointer returnValue = gtk_drop_down_get_selected_item([self castedGObject]);

	return returnValue;
}

- (bool)showArrow
{
	bool returnValue = gtk_drop_down_get_show_arrow([self castedGObject]);

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

- (void)setListFactory:(OGTKListItemFactory*)factory
{
	gtk_drop_down_set_list_factory([self castedGObject], [factory castedGObject]);
}

- (void)setModel:(GListModel*)model
{
	gtk_drop_down_set_model([self castedGObject], model);
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