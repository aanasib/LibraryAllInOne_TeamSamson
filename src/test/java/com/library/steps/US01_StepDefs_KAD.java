package com.library.steps;

import com.library.utility.ConfigurationReader;
import com.library.utility.LibraryAPI_Util;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import org.hamcrest.Matchers;

import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;

public class US01_StepDefs_KAD {

    RequestSpecification givenPart;
    Response response;
    ValidatableResponse thenPart;
    /**
     * US 01 RELATED STEPS
     *
     */
    @Given("I logged Library api as a {string}. KAD")
    public void iLoggedLibraryApiAsAKAD(String userType) {

        givenPart = given().log().uri()
                .header("x-library-token", LibraryAPI_Util.getToken(userType));
    }

    @And("Accept header is {string}. KAD")
    public void acceptHeaderIsKAD(String contentType) {
        givenPart.accept(contentType);
    }

    @When("I send GET request to {string} endpoint. KAD")
    public void iSendGETRequestToEndpointKAD(String endpoint) {
        response = givenPart.when().get(ConfigurationReader.getProperty("library.baseUri") + endpoint).prettyPeek();
        thenPart = response.then();
    }

    @Then("status code should be {int}. KAD")
    public void statusCodeShouldBeKAD(int statusCode) {
        thenPart.statusCode(statusCode);
    }

    @And("Response Content type is {string}. KAD")
    public void responseContentTypeIsKAD(String contentType) {
        thenPart.contentType(contentType);
    }

    @And("{string} field should not be null. KAD")
    public void fieldShouldNotBeNullKAD(String path) {
        thenPart.body(path, everyItem(notNullValue()));
    }
}