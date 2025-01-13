/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCalendar.h"

@implementation OGTKCalendar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CALENDAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)calendar
{
	GtkCalendar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_calendar_new(), GtkCalendar, GtkCalendar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCalendar* wrapperObject;
	@try {
		wrapperObject = [[OGTKCalendar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCalendar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCalendar, GtkCalendar);
}

- (void)clearMarks
{
	gtk_calendar_clear_marks([self castedGObject]);
}

- (GDateTime*)date
{
	GDateTime* returnValue = (GDateTime*)gtk_calendar_get_date([self castedGObject]);

	return returnValue;
}

- (int)day
{
	int returnValue = (int)gtk_calendar_get_day([self castedGObject]);

	return returnValue;
}

- (bool)dayIsMarkedWithDay:(guint)day
{
	bool returnValue = (bool)gtk_calendar_get_day_is_marked([self castedGObject], day);

	return returnValue;
}

- (int)month
{
	int returnValue = (int)gtk_calendar_get_month([self castedGObject]);

	return returnValue;
}

- (bool)showDayNames
{
	bool returnValue = (bool)gtk_calendar_get_show_day_names([self castedGObject]);

	return returnValue;
}

- (bool)showHeading
{
	bool returnValue = (bool)gtk_calendar_get_show_heading([self castedGObject]);

	return returnValue;
}

- (bool)showWeekNumbers
{
	bool returnValue = (bool)gtk_calendar_get_show_week_numbers([self castedGObject]);

	return returnValue;
}

- (int)year
{
	int returnValue = (int)gtk_calendar_get_year([self castedGObject]);

	return returnValue;
}

- (void)markDay:(guint)day
{
	gtk_calendar_mark_day([self castedGObject], day);
}

- (void)selectDayWithDate:(GDateTime*)date
{
	gtk_calendar_select_day([self castedGObject], date);
}

- (void)setDay:(int)day
{
	gtk_calendar_set_day([self castedGObject], day);
}

- (void)setMonth:(int)month
{
	gtk_calendar_set_month([self castedGObject], month);
}

- (void)setShowDayNamesWithValue:(bool)value
{
	gtk_calendar_set_show_day_names([self castedGObject], value);
}

- (void)setShowHeadingWithValue:(bool)value
{
	gtk_calendar_set_show_heading([self castedGObject], value);
}

- (void)setShowWeekNumbersWithValue:(bool)value
{
	gtk_calendar_set_show_week_numbers([self castedGObject], value);
}

- (void)setYear:(int)year
{
	gtk_calendar_set_year([self castedGObject], year);
}

- (void)unmarkDay:(guint)day
{
	gtk_calendar_unmark_day([self castedGObject], day);
}


@end