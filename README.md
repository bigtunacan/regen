## Regen

**Quickly generate project boilerplate so you can get to work.**

Regen is simple project template generator.  It tries to do just enough to get out of your way and let you get the real work done.

Installing Regen is simple
> gem install regen

Regen can then be run from the command line specifying the destination directory and an a config file location.

The Regen config file is a simple JSON file.

    {
      "templates": [
        "https://github.com/bigtunacan/rgen_ruby_223_template"
      ],
      "ignore": [
        ".git",
        "README.md"
      ],
      "pre-commands": [
      ],
      "post-commands": [
        "echo 'sample' > .ruby-gemset"
      ]
    }

Regen can install from local directory `templates` or git repositories `templates`.  Specify an `ignore` list if there are files in the template location that should not be sent to the destination directory (Readme files, .git files, etc...).

The pre-commands list will run local to the destination directory prior to the templates being moved over.

The post-commands list will run local to the destination directory after the templates have been moved.

Regen can apply multiple templates one on top of another; this is so you can build templates up in layers that may be applied one on top of the other.  This presents a risk of file collisions; Regen handles this by using a basic last in wins method of applying templates.

**DISCLAIMER**

You use this product at your own risk.  Regen config files pre & post commands could be used to cause harm to your computer.  If you are using public templates you should examine the config files and make sure you understand what it is doing before using Regen.

**LICENSE**

Regen is licensed under the [MIT](http://opensource.org/licenses/MIT) license.