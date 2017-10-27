package org.gordonkrull.kotlin.sideproject

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.EnableAutoConfiguration
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.annotation.Configuration

@SpringBootApplication
@EnableAutoConfiguration
@Configuration
class Application

fun main(args: Array<String>) {
    SpringApplication.run(Application::class.java, *args)
}