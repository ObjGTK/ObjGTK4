/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCalendar.h"

@implementation OGTKCalendar

- (instancetype)init
{
	GtkCalendar* gobjectValue = GTK_CALENDAR(gtk_calendar_new());

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

- (GtkCalendar*)castedGObject
{
	return GTK_CALENDAR([self gObject]);
}

- (void)clearMarks
{
	gtk_calendar_clear_marks([self castedGObject]);
}

- (GDateTime*)date
{
	GDateTime* returnValue = gtk_calendar_get_date([self castedGObject]);

	return returnValue;
}

- (bool)dayIsMarked:(guint)day
{
	bool returnValue = gtk_calendar_get_day_is_marked([self castedGObject], day);

	return returnValue;
}

- (bool)showDayNames
{
	bool returnValue = gtk_calendar_get_show_day_names([self castedGObject]);

	return returnValue;
}

- (bool)showHeading
{
	bool returnValue = gtk_calendar_get_show_heading([self castedGObject]);

	return returnValue;
}

- (bool)showWeekNumbers
{
	bool returnValue = gtk_calendar_get_show_week_numbers([self castedGObject]);

	return returnValue;
}

- (void)markDay:(guint)day
{
	gtk_calendar_mark_day([self castedGObject], day);
}

- (void)selectDay:(GDateTime*)date
{
	gtk_calendar_select_day([self castedGObject], date);
}

- (void)setShowDayNames:(bool)value
{
	gtk_calendar_set_show_day_names([self castedGObject], value);
}

- (void)setShowHeading:(bool)value
{
	gtk_calendar_set_show_heading([self castedGObject], value);
}

- (void)setShowWeekNumbers:(bool)value
{
	gtk_calendar_set_show_week_numbers([self castedGObject], value);
}

- (void)unmarkDay:(guint)day
{
	gtk_calendar_unmark_day([self castedGObject], day);
}


@end