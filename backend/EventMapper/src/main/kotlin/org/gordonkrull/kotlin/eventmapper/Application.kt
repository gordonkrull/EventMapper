package org.gordonkrull.kotlin.eventmapper

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.annotation.Configuration

@SpringBootApplication
@Configuration
class Application

fun main(args: Array<String>) {
    SpringApplication.run(Application::class.java, *args)
}