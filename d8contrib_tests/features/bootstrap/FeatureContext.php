<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Drupal\node\Entity\Node;
use Drupal\field_collection\Entity\FieldCollectionItem;
use Drupal\field_collection\Entity\FieldCollection;
use Drupal\DrupalExtension\Event\EntityEvent;
use Drupal\Component\Utility\Random;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Context\BehatContext;
use Behat\Behat\Context\Step;
use Behat\Behat\Context\Step\Given;
use Behat\Behat\Tester\Exception\PendingException;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }


  /**
   * @Then /^I should get a "([^"]*)" HTTP response$/
   */
  public function iShouldGetAHttpResponse($arg1) {
    return $this->getSession()->getStatusCode($arg1);
  }

  /**
   *
   * @When /^(?:|I )click the element with CSS selector "([^"]*)"$/
   * @When /^(?:|I )click the element with css selector "([^"]*)"$/
   */
  public function iClickTheElementWithCssSelector($css_selector) {
    $element = $this->getSession()->getPage()->find("css", $css_selector);
    if (empty($element)) {
      throw new \Exception(sprintf("The page '%s' does not contain the css selector '%s'", $this->getSession()->getCurrentUrl(), $css_selector));
    }
    $element->click();
  }

  /**
   * @Given /^I wait (\d+) seconds$/
   * @Given /^I wait for (\d+) seconds$/
   */
  public function iWaitSeconds($seconds) {
    sleep($seconds);
  }



  /**
   * @Given I am viewing the Sample FAQ:
   *
   * Creates an FAQ node and associated field collection item. Used in the
   * @field_collection scenario.
   */
  public function iAmViewingTheSampleFaq() {

    // Create an FAQ node - FAQ nodes have a field collection field.
    $faq = Node::create(array(
      'type' => 'faq',
      'title' => 'Sample FAQ',
      'langcode' => 'en',
      'uid' => '1',
      'status' => 1,
      'field_q_and_a' => array(),
    ));
    $faq->save();

    // Create the Q and A field collection item and attach it to the FAQ node
    $fieldCollectionItem = entity_create('field_collection_item', array(
        'field_name' => 'field_q_and_a'));
    $fieldCollectionItem->field_question->setValue('Sample Question');
    $fieldCollectionItem->field_answer->setValue('Sample answer. How quickly deft jumping zebras vex.');
    $fieldCollectionItem->setHostEntity($faq);
    $fieldCollectionItem->save();

    // Resave the FAQ node with the Field Collection Item.
    $faq->save();

    $this->getSession()->visit($this->locatePath('/node/' . $faq->id()));
  }

  /**
   * @Then /^I should see the css selector "([^"]*)"$/
   * @Then /^I should see the CSS selector "([^"]*)"$/
   *
   * Used in the @focal_point scenario
   */
  public function iShouldSeeTheCssSelector($css_selector) {
    $element = $this->getSession()->getPage()->find("css", $css_selector);
    if (empty($element)) {
      throw new \Exception(sprintf("The page '%s' does not contain the css selector '%s'", $this->getSession()->getCurrentUrl(), $css_selector));
    }
  }

}
