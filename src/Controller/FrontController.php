<?php

/**
 * @file
 * Contains \Drupal\d8contrib\Controller\FrontController.
 */

namespace Drupal\d8contrib\Controller;

use Drupal\Core\Controller\ControllerBase;

class FrontController extends ControllerBase {

  /**
   * Displays d8contrib's README.md file.
   *
   * @todo Run this through a Markdown filter so it actually looks correct.
   */
  public function readMe() {
    return array(
      '#markup' => file_get_contents($this->moduleHandler()->getModule('d8contrib')->getPath() . '/README.md'),
    );
  }

}
