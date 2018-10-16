require 'crowbar/validate/databags/version'
require 'crowbar/validate/crowbarvalidator'
require 'kwalify'

module Crowbar
  module Validate
    module Databags
      def self.validate(dir)
        # add missing slash if needed
        dir = "#{dir}/" unless dir[-1] == "/"

        schema_files = Dir["#{dir}*.schema"].reject { |f| File.directory? f }
        migration_folders = Dir["#{dir}migrate/*/"]

        rc = []
        schema_files.each { |schema| rc.push(validate_schema(schema)) }
        schema_files.each { |schema| rc.push(validate_json(schema)) }
        migration_folders.each { |folder| rc.push(validate_migrations(folder)) }
        return rc.uniq

      end

      def self.validate_schema(schema_filename)
        metavalidator = Kwalify::MetaValidator.instance
        parser = Kwalify::Yaml::Parser.new(metavalidator)
        parser.parse_file(schema_filename)

        if parser.errors && !parser.errors.empty?
          parser.errors.each do |e|
            puts "#{schema_filename}: #{e.linenum}:#{e.column} [#{e.path}] #{e.message}"
          end
          return -1
        end
        return 0
      end

      def self.validate_json(schema_filename)
        config_filename = schema_filename.sub(".schema", ".json")
        validator = CrowbarValidator.new(schema_filename)
        parser = Kwalify::Yaml::Parser.new(validator)
        parser.parse_file(config_filename)

        if parser.errors && !parser.errors.empty?
          parser.errors.each do |e|
            puts "#{config_filename}: #{e.linenum}:#{e.column} [#{e.path}] #{e.message}"
          end
          return -2
        end
        return 0
      end

      def self.validate_migrations(folder)
        folder = "#{folder}/" unless folder[-1] == "/"
        files = Dir["#{folder}*.rb"]
        migration_numbers = files.map { |f| File.basename(f)[0, 3] }
        duplicated = migration_numbers.select { |m| migration_numbers.count(m) > 1 }.uniq
        unless duplicated.empty?
          puts "Found duplicated number migration(s) on #{folder} with number(s) #{duplicated}"
          return -3
        end
        return 0
      end
    end
  end
end