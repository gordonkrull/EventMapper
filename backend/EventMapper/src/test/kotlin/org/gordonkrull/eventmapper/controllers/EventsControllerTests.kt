package org.gordonkrull.eventmapper.controllers

import org.assertj.core.api.Assertions.assertThat
import org.gordonkrull.eventmapper.models.Coordinate
import org.gordonkrull.eventmapper.models.Event
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.junit.jupiter.MockitoExtension

@ExtendWith(MockitoExtension::class)
class EventsControllerTests {

    @InjectMocks
    lateinit var eventsController: EventsController

    @Test
    fun getEvents_returnsStubbedTestEvent() {
        val testEvent = Event(
                Coordinate(37.7577627, -122.4726194),
                "Test Event",
                "Test Subtitle"
        )
        assertThat(eventsController.getEvents()).isEqualTo(testEvent)
    }
}