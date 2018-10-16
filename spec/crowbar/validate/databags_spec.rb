RSpec.describe Crowbar::Validate::Databags do
  schema_correct = "spec/fixtures/schema_correct/test.schema"
  schema_failure = "spec/fixtures/schema_failure/test.schema"
  json_correct = "spec/fixtures/json_correct/test.schema"
  json_failure = "spec/fixtures/json_failure/test.schema"
  json_missing = "spec/fixtures/json_missing/test.schema"
  migration_correct = "spec/fixtures/migration_correct/"
  migration_failure = "spec/fixtures/migration_duplicated/"
  empty_dir = "spec/fixtures/empty/"
  full_test_dir = "spec/fixtures/full_test"

  it "has a version number" do
    expect(Crowbar::Validate::Databags::VERSION).not_to be nil
  end

  context "validate" do
    it "should not fail with an empty dir" do
      expect(Crowbar::Validate::Databags).not_to receive(:validate_schema)
      expect(Crowbar::Validate::Databags).not_to receive(:validate_json)
      expect(Crowbar::Validate::Databags).not_to receive(:validate_migrations)
      expect(Crowbar::Validate::Databags.validate(empty_dir)).to eq([])
    end

    it "should pass with a proper dir" do
      expect(
        Crowbar::Validate::Databags
      ).to receive(:validate_schema).with("#{full_test_dir}/test.schema").and_call_original
      expect(
        Crowbar::Validate::Databags
      ).to receive(:validate_json).with("#{full_test_dir}/test.schema").and_call_original
      expect(
        Crowbar::Validate::Databags
      ).to receive(:validate_migrations).with("#{full_test_dir}/migrate/test/").and_call_original
      expect(Crowbar::Validate::Databags.validate(full_test_dir)).to eq([0])
    end
  end

  context "validate_schema" do
    it "should pass with a proper schema" do
      expect(Crowbar::Validate::Databags.validate_schema(schema_correct)).to eq(0)
    end

    it "should fail with a wrong schema" do
      expect(Crowbar::Validate::Databags.validate_schema(schema_failure)).to eq(-1)
    end
  end

  context "validate_json" do
    it "should pass with a proper json" do
      expect(Crowbar::Validate::Databags.validate_json(json_correct)).to eq(0)
    end

    it "should fail with a wrong json" do
      expect(Crowbar::Validate::Databags.validate_json(json_failure)).to eq(-2)
    end

    it "should fail with a missing json" do
      expect do
        Crowbar::Validate::Databags.validate_json(json_missing)
      end.to raise_exception(Errno::ENOENT)
    end
  end

  context "validate_migrations" do
    it "should pass with proper migrations" do
      expect(Crowbar::Validate::Databags.validate_migrations(migration_correct)).to eq(0)
    end

    it "should fail with duplicated migrations" do
      expect(Crowbar::Validate::Databags.validate_migrations(migration_failure)).to eq(-3)
    end

    it "should not fail with an empty dir" do
      expect(Crowbar::Validate::Databags.validate_migrations(empty_dir)).to eq(0)
    end
  end
end
