<?php

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

}
