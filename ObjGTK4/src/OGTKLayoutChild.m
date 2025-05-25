/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutChild.h"

#import "OGTKLayoutManager.h"
#import "OGTKWidget.h"

@implementation OGTKLayoutChild

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LAYOUT_CHILD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_LAYOUT_CHILD);
	return gObjectClass;
}

- (GtkLayoutChild*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_LAYOUT_CHILD, GtkLayoutChild);
}

- (OGTKWidget*)childWidget
{
	GtkWidget* gobjectValue = gtk_layout_child_get_child_widget((GtkLayoutChild*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKLayoutManager*)layoutManager
{
	GtkLayoutManager* gobjectValue = gtk_layout_child_get_layout_manager((GtkLayoutChild*)[self castedGObject]);

	OGTKLayoutManager* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end