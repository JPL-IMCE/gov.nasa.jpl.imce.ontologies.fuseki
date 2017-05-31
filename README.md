# Configuration for setting up a Fuseki server for the IMCE ontology workflows

## Environment Setup

Running the workflow requires a number of tools to be configured: JRuby, SBT, Java 8 (JDK), Make. When using a CI server (such as Jenkins), a number of plugins are recommended to be installed. This is mentioned at the bottom of this section.

### Java 8 JDK
Install the latest version of the Java 8 JDK from [Oracle's website](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html). It is recommended **not** to use OpenJDK.

Java 8 JDK may already be pre-installed on your system. To check if this is the case, run `java -version` in a terminal window.

### SBT 0.13.x
Install the latest version of SBT 0.13.x from the [Scala SBT website](http://www.scala-sbt.org/). **Note:** do NOT use SBT 1.x (currently a pre-release / beta) - there are known differences in syntax that will break part of the workflow.

### Make
Ensure that "make" is installed on the system. This is typically already the case for most Unix-based systems. Make is part of the [GNU Utils](https://www.gnu.org/software/make/). On MacOSX, this may require installing Xcode.

### Note For Running Under Continuous Integration
When running in a CI system (such as Jenkins), the agent may need to be configured appropriately. For Jenkins:

* Install the SBT plugin (simply called "sbt plugin"), and configure an installation of SBT 0.13.x .

The above assumes a recommended standard installation of Jenkins 2.4.x, with the recommended plugins installed (e.g., GitHub plugin, JUnit plugin)

## Running

To run, execute the following commands in a terminal, starting at the project root:

```sh
sbt setupFuseki
cd workflow
. env.sh
make start-fuseki
```

To stop the server:

```sh
cd workflow
make stop-fuseki
```

### Running Under CI
For Jenkins, a pipeline script can be found in the root directory. This file is called `Jenkinsfile`.

