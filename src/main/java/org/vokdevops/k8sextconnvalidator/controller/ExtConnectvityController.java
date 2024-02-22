package org.vokdevops.k8sextconnvalidator.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by taakovi6 on 09/02/2024
 */
@RestController
public class ExtConnectvityController {
    @GetMapping("/")
    public String index() {
        return "Hello JDK 17!";
    }
}
