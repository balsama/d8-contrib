<?php

// @todo - this file is auto-generated, but I have customized it with the
// iAmViewingTheSam... function. Need to move that somewhere else. Committing
// because it's the end of the day and I don't want to lose it.

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Drupal\node\Entity\Node;
use Drupal\field_collection\Entity\FieldCollectionItem;
use Drupal\field_collection\Entity\FieldCollection;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

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
   * @Given I am viewing the Sample FAQ:
   */
  public function iAmViewingTheSampleFaq() {

    $fci = field_collection_item_load(1);

    $faq = Node::create(array(
      'type' => 'faq',
      'title' => 'Sample FAQ',
      'langcode' => 'en',
      'uid' => '1',
      'status' => 1,
      'field_fields' => array(),
      'field_q_and_a' => array(
        'value' => 3,
      )
    ));

    $faq->save();

    $this->getSession()->visit($this->locatePath('/node/' . $faq->id()));

  }

}
