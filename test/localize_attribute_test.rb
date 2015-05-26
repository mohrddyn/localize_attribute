require 'test_helper'

class LocalizeAttributeTest < ActiveSupport::TestCase
  def test_localize_attribute_first_is_default
    country = Country.new name_fi: 'Ruotsi', name_en: 'Sweden', name_sv: 'Sverige'
    assert_equal 'Sweden', country.name
  end

  def test_localize_attribute_fetches_value_with_locale
    I18n.locale = :sv
    country = Country.new name_fi: 'Ruotsi', name_en: 'Sweden', name_sv: 'Sverige'
    assert_equal 'Sverige', country.name
  end
end
