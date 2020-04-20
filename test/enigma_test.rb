require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }
      assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    expected =  {
      decryption: "hello world",
      key: "02715",
      date: "040895"
      }
      assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_with_today
    @enigma.stubs(:date).returns("200420")
    expected = {
      encryption: "pib wdmczpu",
      key: "02715",
      date: "200420"
      }
      assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_with_today
    @enigma.stubs(:date).returns("200420")
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "200420"
      }
      assert_equal expected, @enigma.decrypt("pib wdmczpu", "02715")
  end
end
