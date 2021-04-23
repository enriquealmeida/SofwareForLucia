package com.artech.common;

import org.junit.Test;


import static com.google.common.truth.Truth.assertThat;

public class DateTimeFormatterTest {

	@Test
	public void getTimePattern_HourOnly() {
		assertThat(DateTimeFormatter.getTimePattern("99", false)).isEqualTo("h a");
		assertThat(DateTimeFormatter.getTimePattern("99", true)).isEqualTo("H");
	}

	@Test
	public void getTimePattern_HourAndMins() {
		assertThat(DateTimeFormatter.getTimePattern("99:99", false)).isEqualTo("h:mm a");
		assertThat(DateTimeFormatter.getTimePattern("99:99", true)).isEqualTo("H:mm");
	}

	@Test
	public void getTimePattern_HourMinsAndSecs() {
		assertThat(DateTimeFormatter.getTimePattern("99:99:99", false)).isEqualTo("h:mm:ss a");
		assertThat(DateTimeFormatter.getTimePattern("99:99:99", true)).isEqualTo("H:mm:ss");
	}

	@Test
	public void getDatePattern_NotSpecified() {
		assertThat(DateTimeFormatter.getDatePattern("", "M/d/y")).isEqualTo("M/d/y");
		assertThat(DateTimeFormatter.getDatePattern("", "d/M/y")).isEqualTo("d/M/y");
		assertThat(DateTimeFormatter.getDatePattern("", "y/M/d")).isEqualTo("y/M/d");
	}

	@Test
	public void getDatePattern_TwoDigitsYear() {
		assertThat(DateTimeFormatter.getDatePattern("99/99/99", "M/d/y")).isEqualTo("M/d/yy");
		assertThat(DateTimeFormatter.getDatePattern("99/99/99", "d/M/y")).isEqualTo("d/M/yy");
		assertThat(DateTimeFormatter.getDatePattern("99/99/99", "y/M/d")).isEqualTo("yy/M/d");

		assertThat(DateTimeFormatter.getDatePattern("99/99/99", "M/d/yy")).isEqualTo("M/d/yy");
		assertThat(DateTimeFormatter.getDatePattern("99/99/99", "d/M/yy")).isEqualTo("d/M/yy");
		assertThat(DateTimeFormatter.getDatePattern("99/99/99", "yy/M/d")).isEqualTo("yy/M/d");
	}

	@Test
	public void getDatePattern_FourDigitsYear() {
		assertThat(DateTimeFormatter.getDatePattern("99/99/9999", "M/d/y")).isEqualTo("M/d/yyyy");
		assertThat(DateTimeFormatter.getDatePattern("99/99/9999", "d/M/y")).isEqualTo("d/M/yyyy");
		assertThat(DateTimeFormatter.getDatePattern("99/99/9999", "y/M/d")).isEqualTo("yyyy/M/d");

		assertThat(DateTimeFormatter.getDatePattern("99/99/9999", "M/d/yy")).isEqualTo("M/d/yyyy");
		assertThat(DateTimeFormatter.getDatePattern("99/99/9999", "d/M/yy")).isEqualTo("d/M/yyyy");
		assertThat(DateTimeFormatter.getDatePattern("99/99/9999", "yy/M/d")).isEqualTo("yyyy/M/d");
	}
}