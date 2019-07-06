package com.mserpa.micrometerpoc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import io.micrometer.core.instrument.MeterRegistry;


@RestController
public class Endpoint {
	
	@Autowired
	private MeterRegistry meterRegistry;
	
	
	@GetMapping(path = "/hello")
	public String sayHello() {		
		meterRegistry.counter("metric.count", "app", "poc").increment();
		meterRegistry.timer("metric.transaction",  "app", "poc");
		return "Hello";
	}
	
}
