<?php

namespace Drupal\Tests\ui_patterns\Unit\Definition;

use function bovigo\assert\assert;
use function bovigo\assert\predicate\equals;
use Drupal\Component\Serialization\Yaml;
use Drupal\Tests\ui_patterns\Unit\AbstractUiPatternsTest;
use Drupal\ui_patterns\Definition\PatternDefinition;

/**
 * @coversDefaultClass \Drupal\ui_patterns\Definition\PatternDefinition
 *
 * @group ui_patterns
 */
class PatternDefinitionTest extends AbstractUiPatternsTest {

  /**
   * Test getters.
   *
   * @dataProvider definitionGettersProvider
   */
  public function testGettersSetters($getter, $name, $value) {
    $pattern_definition = new PatternDefinition([$name => $value]);
    assert($value, equals(call_user_func([$pattern_definition, $getter])));
  }

  /**
   * Test field singleton.
   *
   * @dataProvider definitionGettersProvider
   */
  public function testFields() {
    $fields = [
      'name' => [
        'name' => 'name',
        'label' => 'Label',
      ],
    ];
    $pattern_definition = new PatternDefinition();
    $pattern_definition->setFields($fields);
    assert($pattern_definition->getField('name')->getLabel(), equals($fields['name']['label']));
    assert($pattern_definition->getField('name')->getName(), equals($fields['name']['name']));
    assert($pattern_definition->getField('name')->getType(), equals(NULL));
    assert($pattern_definition->getField('name')->getDescription(), equals(NULL));
    assert($pattern_definition->getField('name')->getPreview(), equals(NULL));

    $pattern_definition->getField('name')->setType('type');
    $pattern_definition->getField('name')->setPreview('preview');
    $pattern_definition->getField('name')->setDescription('description');
    assert($pattern_definition->getField('name')->getType(), equals('type'));
    assert($pattern_definition->getField('name')->getDescription(), equals('description'));
    assert($pattern_definition->getField('name')->getPreview(), equals('preview'));
  }

  /**
   * Test fields processing.
   *
   * @dataProvider fieldsProcessingProvider
   */
  public function testFieldsProcessing($actual, $expected) {
    $pattern_definition = new PatternDefinition();
    $data = $pattern_definition->setFields($actual)->toArray();
    assert($data['fields'], equals($expected));
  }

  /**
   * Provider.
   *
   * @return array
   *    Data.
   */
  public function fieldsProcessingProvider() {
    return Yaml::decode(file_get_contents($this->getFixturePath() . '/definition/fields_processing.yml'));
  }

  /**
   * Provider.
   *
   * @return array
   *    Data.
   */
  public function definitionGettersProvider() {
    return [
      ['getProvider', 'provider', 'my_module'],
      ['id', 'id', 'pattern_id'],
      ['getLabel', 'label', 'Pattern label'],
      ['getDescription', 'description', 'Pattern description.'],
      ['getUse', 'use', 'template.twig'],
      ['hasCustomThemeHook', 'custom theme hook', FALSE],
      ['getThemeHook', 'theme hook', 'eme hook: custom_my_theme_hook'],
      ['getTemplate', 'template', 'my-template.html.twig'],
      ['getFileName', 'file name', '/path/to/filename.ui_patterns.yml'],
      ['getClass', 'class', '\Drupal\ui_patterns\MyClass'],
      ['getBasePath', 'base path', '/path/to'],
      ['getTags', 'tags', ['a', 'b']],
    ];
  }

}
